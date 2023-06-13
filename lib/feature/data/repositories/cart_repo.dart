import 'package:test_app_flutter/feature/data/models/dish_model.dart';

class CartRepo {
  final List<DishModel> _list = [];

  List<DishModel> get getCart => _list;

  void addDish(DishModel dish) => _list.add(dish);

  void removeDish(DishModel dishToRemove) {
    for (int i = _list.length - 1; i >= 0; i--) {
      if (_list[i] == dishToRemove) {
        _list.removeAt(i);
        break;
      }
    }
  }
}
