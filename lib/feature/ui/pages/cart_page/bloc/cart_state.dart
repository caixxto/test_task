part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class UpdatedCartState extends CartState {
  final List<CartEntity> cart;
  final int total;

  UpdatedCartState({required this.cart, required this.total});
}
