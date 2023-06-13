// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModelList _$CategoryModelListFromJson(Map<String, dynamic> json) =>
    CategoryModelList(
      models: (json['сategories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelListToJson(CategoryModelList instance) =>
    <String, dynamic>{
      'сategories': instance.models.map((e) => e.toJson()).toList(),
    };
