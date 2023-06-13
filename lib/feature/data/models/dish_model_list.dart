import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_flutter/feature/data/models/dish_model.dart';
part 'dish_model_list.g.dart';

@JsonSerializable(explicitToJson: true)
class DishModelList  {
  final List<DishModel> models;
  DishModelList({required this.models});


  factory DishModelList.fromJson(Map<String, dynamic> json) => _$DishModelListFromJson(json);
  Map<String, dynamic> toJson() => _$DishModelListToJson(this);

}

