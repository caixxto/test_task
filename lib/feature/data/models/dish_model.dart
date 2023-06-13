import 'package:test_app_flutter/feature/domain/entities/dish_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dish_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DishModel extends DishEntity {
  const DishModel({
    required id,
    required name,
    required price,
    required weight,
    required description,
    required url,
    required tags,
  }) : super(
            id: id,
            name: name,
            price: price,
            weight: weight,
            description: description,
            url: url,
            tags: tags);

  factory DishModel.fromJson(Map<String, dynamic> json) => _$DishModelFromJson(json);
  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}
