import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_app_flutter/feature/data/models/category_model.dart';
import 'package:test_app_flutter/service/api_service.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  //final CategoryRepo _categoryRepository;
  final api = ApiService(Dio(BaseOptions(contentType: 'application/json')));

  MainPageBloc() : super(MainPageInitialState()) {
    on<MainPageLoadEvent>(_loadPageData);
  }

  _loadPageData(MainPageLoadEvent event, Emitter<MainPageState> emit) async {
    final categories = await api.getCategories();


    emit(MainPageLoadedState(categories: categories.models));
  }
}
