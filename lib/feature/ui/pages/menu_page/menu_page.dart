import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/ui/pages/menu_page/bloc/menu_bloc.dart';
import 'package:test_app_flutter/feature/ui/widgets/chip.dart';
import 'package:test_app_flutter/feature/ui/widgets/main_scaffold/appbars/category_appbar.dart';
import 'package:test_app_flutter/feature/ui/widgets/menu_card.dart';

class MenuPage extends StatelessWidget {
  final String title;

  const MenuPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(title: title),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MenuLoadedState) {
            final dishes = state.dish;
            final tags = state.tags;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: standardPadding / 2),
                Padding(
                  padding: const EdgeInsets.only(left: standardPadding),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                        spacing: 8,
                        children: List.generate(tags.length, (index) {
                          return SelectorItem(
                              isSelected: tags[index].isSelected,
                              title: tags[index].title,
                              onTap: (tags) {
                                //TODO: tags
                              },
                              selectedIndex: index);
                        })),
                  ),
                ),
                const SizedBox(height: standardPadding),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: standardPadding),
                      child: GridView.builder(
                          primary: true,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: standardPadding / 2,
                                  mainAxisSpacing: 0,
                                  crossAxisCount: 3,
                                  childAspectRatio: 3 / 4),
                          itemCount: dishes.length,
                          itemBuilder: (_, index) {
                            return MenuCard(
                              dish: dishes[index],
                            );
                          }),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Placeholder();
          }
        },
      ),
    );
  }
}
