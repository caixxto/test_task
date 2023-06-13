import 'package:test_app_flutter/feature/data/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model_list.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModelList  {
  final List<CategoryModel> models;
  CategoryModelList({required this.models});


  factory CategoryModelList.fromJson(Map<String, dynamic> json) => _$CategoryModelListFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelListToJson(this);

}
