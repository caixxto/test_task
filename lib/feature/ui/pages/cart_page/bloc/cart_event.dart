part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class UpdateCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final DishModel dish;
  AddToCartEvent({required this.dish});
}

class RemoveFromCartEvent extends CartEvent {
  final DishModel dish;
  RemoveFromCartEvent({required this.dish});
}
