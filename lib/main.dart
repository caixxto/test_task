import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_app_flutter/feature/data/models/address_model.dart';
import 'package:test_app_flutter/feature/data/repositories/cart_repo.dart';
import 'package:test_app_flutter/feature/domain/repositories/gps_repository.dart';
import 'package:test_app_flutter/feature/domain/repositories/search_address_repository.dart';
import 'package:test_app_flutter/feature/ui/pages/cart_page/bloc/cart_bloc.dart';
import 'package:test_app_flutter/feature/ui/pages/main_page/bloc/main_page_bloc.dart';
import 'package:test_app_flutter/feature/ui/pages/menu_page/bloc/menu_bloc.dart';
import 'package:test_app_flutter/feature/ui/widgets/main_scaffold/main_scaffold.dart';
import 'package:test_app_flutter/injection.dart';

void main() async {
  configureDependencies('dev');
  await initLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<MainPageBloc>(
      create: (context) => MainPageBloc()..add(MainPageLoadEvent()),
    ),
    BlocProvider<MenuBloc>(
      create: (context) => MenuBloc()..add(MenuLoadedEvent()),
    ),
    BlocProvider<CartBloc>(
      create: (_) => CartBloc(locator.get<CartRepo>())..add(UpdateCartEvent()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool _initialized = false;
  final GPSRepository gpsRepository = GPSRepository();
  late final SearchAddressRepository searchAddressRepository =
      SearchAddressRepository();
  late AddressModel city;
  late String date;

  String setDate() {
    initializeDateFormatting('ru');
    DateTime now = DateTime.now();
    String date = DateFormat('yMMMMd', 'ru').format(now);
    return date;
  }

  Future<AddressModel> setLocation() async {
    try {
      final gps = await gpsRepository.getGPSPosition();
      final address = await searchAddressRepository
          .onLocationSearch(LatLng(gps!.latitude, gps.longitude));
      setState(() {
        _initialized = true;
        city = address;
      });
      return address;
    } catch (e) {
      setState(() {
        _initialized = false;
        city = AddressModel(address: e.toString());
      });

      return AddressModel(address: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    } else {
      return MaterialApp(
        home: MainScaffold(city: city, date: date),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    setLocation();
    date = setDate();
  }
}
