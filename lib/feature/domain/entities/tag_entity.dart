import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final String title;
  final bool isSelected;
  const TagEntity({
    required this.title,
    required this.isSelected
});

  @override
  List<Object?> get props => [title, isSelected];
}