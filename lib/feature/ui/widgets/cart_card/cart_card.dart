import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/data/models/dish_model.dart';
import 'package:test_app_flutter/feature/ui/pages/cart_page/bloc/cart_bloc.dart';

class CartCard extends StatelessWidget {
  final DishModel dish;
  final int count;
   const CartCard({super.key, required this.dish, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 62,
          width: 62,
          decoration: BoxDecoration(
            color: MENU_BACKGROUND_COLOR,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(standardPadding / 2),
            child: Image.network(
              dish.url!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: standardPadding / 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dish.name, style: TITLE_TEXT_STYLE),
            Row(
              children: [
                Text('${dish.price} ₽', style: MENU_TEXT_STYLE),
                Text(' · ${dish.weight} г', style: MENU_TEXT_STYLE_OP),
              ],
            )
          ],
        ),
        const Spacer(),
        Container(
          height: 32,
          width: 32 * 3,
          decoration: BoxDecoration(
            color: const Color(0XFFEFEEEC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<CartBloc>().add(RemoveFromCartEvent(dish: dish));
                },
                child: const Icon(Icons.remove),
              ),
              Text(
                  count.toString(),
                  style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: 'SF-Pro',
                  fontWeight: FontWeight.w500)),
              GestureDetector(
                onTap: () {
                  context.read<CartBloc>().add(AddToCartEvent(dish: dish));
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        )
      ],
    );
  }

}