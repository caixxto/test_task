import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/feature/data/models/address_model.dart';
import 'package:test_app_flutter/feature/ui/pages/main_page/bloc/main_page_bloc.dart';
import 'package:test_app_flutter/feature/ui/widgets/category_card.dart';
import 'package:test_app_flutter/feature/ui/widgets/main_scaffold/appbars/main_appbar.dart';

class MainPage extends StatelessWidget {
  final String date;
  final AddressModel city;
  const MainPage({super.key, required this.date, required this.city});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        if (state is MainPageInitialState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MainPageLoadedState) {
          final category = state.categories;

          return Scaffold(
            appBar: MainAppBar(date: date, city: city),
            body: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(category.length, (index) {
                      return CategoryCard(category: category[index]);
                    })
                  )
              ),
            ),
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
