part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}

class MainPageInitialEvent extends MainPageEvent {}

class MainPageLoadEvent extends MainPageEvent {}
