import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/data/models/dish_model.dart';
import 'package:test_app_flutter/feature/ui/widgets/dialog_widget.dart';

class MenuCard extends StatelessWidget {
  final DishModel dish;

  const MenuCard({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DialogWidget(
                dish: dish,
              );
            });
      },
      child: Column(
        children: [
          Container(
            height: 109,
            width: 109,
            decoration: BoxDecoration(
              color: MENU_BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(standardPadding / 2),
              child: Image.network(
                dish.url,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(width: 109, child: Text(dish.name, style: MENU_TEXT_STYLE)),
        ],
      ),
    );
  }
}
