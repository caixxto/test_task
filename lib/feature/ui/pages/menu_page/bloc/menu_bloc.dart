import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_app_flutter/feature/data/models/dish_model.dart';
import 'package:test_app_flutter/feature/data/repositories/tags_repo.dart';
import 'package:test_app_flutter/feature/domain/entities/tag_entity.dart';
import 'package:test_app_flutter/service/api_service.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final api = ApiService(Dio(BaseOptions(contentType: 'application/json')));
  final TagsRepo _tagsRepo = TagsRepo();

  MenuBloc() : super(MenuInitial()) {
    on<MenuLoadedEvent>(_loadMenu);
    on<MenuLoadedByTagsEvent>(_loadMenuByTags);
  }

  _loadMenu(MenuLoadedEvent event, Emitter<MenuState> emit) async {
    final dishList = await api.getDishes();
    final dishes = dishList.models;
    final tags = _tagsRepo.getTags;

    emit(MenuLoadedState(dish: dishes, tags: tags));
  }

  _loadMenuByTags(MenuLoadedByTagsEvent event, Emitter<MenuState> emit) async {
    final dishList = await api.getDishes();
    final dishes = dishList.models;
    final tags = _tagsRepo.getTags;
    _tagsRepo.changeTag(event.index, event.tag);

    List<String> selectedTags =
        tags.where((tag) => tag.isSelected).map((tag) => tag.title).toList();

    List<DishModel> filteredDishModels = dishes.where((dish) {
      return selectedTags.every((tag) => dish.tags.contains(tag));
    }).toList();

    emit(MenuLoadedState(dish: filteredDishModels, tags: tags));
  }
}
