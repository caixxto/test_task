import 'package:test_app_flutter/feature/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required id,
    required name,
    required imageUrl
  }) : super(
      id: id,
      name: name,
      imageUrl: imageUrl);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}
