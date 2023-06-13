part of 'menu_bloc.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoadedState extends MenuState {
  final List<DishModel> dish;
  final List<TagEntity> tags;

  MenuLoadedState({required this.dish, required this.tags});
}
