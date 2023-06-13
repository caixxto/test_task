import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app_flutter/feature/data/models/dish_model.dart';
import 'package:test_app_flutter/feature/data/repositories/cart_repo.dart';
import 'package:test_app_flutter/feature/domain/entities/cart_entity.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo _cartRepo;

  CartBloc(this._cartRepo) : super(CartInitial()) {
    on<AddToCartEvent>(_addToCart);
    on<UpdateCartEvent>(_updateCart);
    on<RemoveFromCartEvent>(_removeFromCart);
  }

  _addToCart(AddToCartEvent event, Emitter<CartState> emit) {
    _cartRepo.addDish(event.dish);
    _update();
  }

  _updateCart(UpdateCartEvent event, Emitter<CartState> emit) {
    _update();
  }

  _removeFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    _cartRepo.removeDish(event.dish);
    _update();
  }

  void _update() {
    final List<DishModel> dishes = _cartRepo.getCart;
    List<CartEntity> cart = [];

    for (var dish in dishes) {
      bool isAlreadyAdded =
          cart.any((cartItem) => cartItem.dish.name == dish.name);
      if (!isAlreadyAdded) {
        int count = dishes.where((e) => e.name == dish.name).length;
        cart.add(CartEntity(dish: dish, count: count));
      }
    }

    final total = calculateTotal(cart);

    emit(UpdatedCartState(cart: cart, total: total));
  }

  int calculateTotal(List<CartEntity> cart) {
    int total = 0;
    for (var cartItem in cart) {
      total += cartItem.dish.price * cartItem.count;
    }
    return total;
  }
}
