import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;
  final String url;
  final List<String> tags;

  const DishEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.url,
    required this.tags
});

  @override
  List<Object?> get props => [id, name, price, weight, description, url, tags];
}