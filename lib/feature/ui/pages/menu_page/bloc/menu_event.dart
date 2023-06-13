part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class MenuLoadedEvent extends MenuEvent {}

class MenuLoadedByTagsEvent extends MenuEvent {
  final int index;
  final TagEntity tag;

  MenuLoadedByTagsEvent({required this.tag, required this.index});
}
