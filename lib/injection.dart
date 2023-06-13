import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app_flutter/feature/data/repositories/cart_repo.dart';
import 'package:test_app_flutter/feature/data/repositories/tags_repo.dart';
import 'package:test_app_flutter/feature/domain/repositories/gps_repository.dart';
import 'package:test_app_flutter/feature/domain/repositories/search_address_repository.dart';
import 'injection.config.dart';

final locator = GetIt.instance;

@InjectableInit(
    //generateForDir: ['test'],
    asExtension: false,
    preferRelativeImports: true,
    initializerName: r'$configureDependencies')
void configureDependencies(String environment) =>
    $configureDependencies(locator, environment: environment);

Future<void> initLocator() async {
  locator.registerLazySingleton(() => SearchAddressRepository());
  locator.registerLazySingleton(() => TagsRepo());
  locator.registerLazySingleton(() => CartRepo());

  if (!locator.isRegistered<GPSRepository>()) {
    locator.registerLazySingleton(() => GPSRepository());
  }

}
