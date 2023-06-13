import 'package:equatable/equatable.dart';
import 'package:test_app_flutter/feature/data/models/dish_model.dart';

class CartEntity extends Equatable {
  final DishModel dish;
  final int count;

  const CartEntity({
    required this.dish,
    required this.count,
  });


  @override
  List<Object?> get props => [dish, count];
}