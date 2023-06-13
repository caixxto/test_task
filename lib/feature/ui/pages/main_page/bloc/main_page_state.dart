part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageInitialState extends MainPageState {}

class MainPageLoadedState extends MainPageState {
  final List<CategoryModel> categories;

  MainPageLoadedState({required this.categories});
}
