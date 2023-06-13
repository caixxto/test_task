import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/data/models/dish_model.dart';
import 'package:test_app_flutter/feature/ui/pages/cart_page/bloc/cart_bloc.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key, required this.dish});

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: standardPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(standardPadding),
        ),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(standardPadding),
                color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.all(standardPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(children: [
                    Container(
                      height: 232,
                      decoration: BoxDecoration(
                          color: MENU_BACKGROUND_COLOR,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(dish.url!),
                              fit: BoxFit.contain)),
                    ),
                    Positioned(
                      top: standardPadding / 2,
                      right: standardPadding / 2,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: const ImageIcon(
                                AssetImage("assets/icons/heart.png"),
                                size: 48,
                              ),
                            ),
                          ),
                          const SizedBox(width: standardPadding / 2),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: const ImageIcon(
                                AssetImage("assets/icons/close.png"),
                                size: 48,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  const SizedBox(height: standardPadding / 2),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(dish.name,
                          style: TITLE_TEXT_STYLE)),
                  const SizedBox(height: standardPadding / 2),
                  Row(
                    children: [
                      Text('${dish.price} ₽', style: MENU_TEXT_STYLE),
                      Text(' · ${dish.weight} г', style: MENU_TEXT_STYLE_OP),
                    ],
                  ),
                  const SizedBox(height: standardPadding / 2),
                  Text(dish.description,
                      style: MENU_DESCRIPTION_STYLE),
                  const SizedBox(height: standardPadding),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: BUTTON_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(AddToCartEvent(dish: dish));
                          Navigator.pop(context);
                        },
                        child: const Text('Добавить в корзину',
                            style: BUTTON_TEXT_STYLE)),
                  )
                ],
              ),
            )));
  }
}
