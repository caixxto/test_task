import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/data/models/address_model.dart';
import 'package:test_app_flutter/feature/ui/pages/cart_page/bloc/cart_bloc.dart';
import 'package:test_app_flutter/feature/ui/widgets/cart_card/cart_card.dart';
import 'package:test_app_flutter/feature/ui/widgets/main_scaffold/appbars/main_appbar.dart';

class CartPage extends StatelessWidget {
  final String date;
  final AddressModel city;

  const CartPage({super.key, required this.date, required this.city});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is UpdatedCartState) {
          final cart = state.cart;

          return Scaffold(
            appBar: MainAppBar(date: date, city: city),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: standardPadding, vertical: standardPadding),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                      child: Column(
                          children: List.generate(cart.length, (index) {
                    return CartCard(
                        dish: cart[index].dish, count: cart[index].count);
                  }))),
                  const Spacer(),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: BUTTON_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text('Оплатить' ' ' '${state.total} ₽',
                            style: BUTTON_TEXT_STYLE)),
                  )
                ],
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
