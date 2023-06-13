// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModelList _$DishModelListFromJson(Map<String, dynamic> json) =>
    DishModelList(
      models: (json['dishes'] as List<dynamic>)
          .map((e) => DishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishModelListToJson(DishModelList instance) =>
    <String, dynamic>{
      'dishes': instance.models.map((e) => e.toJson()).toList(),
    };
