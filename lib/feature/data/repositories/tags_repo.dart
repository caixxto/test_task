import 'package:test_app_flutter/feature/domain/entities/tag_entity.dart';

class TagsRepo {

   final List<TagEntity> _list = [
     const TagEntity(title: 'Все меню', isSelected: true),
     const TagEntity(title: 'С рыбой', isSelected: false),
     const TagEntity(title: 'Салаты', isSelected: false),
     const TagEntity(title: 'С рисом', isSelected: false),
   ];

  List<TagEntity> get getTags => _list;

  void changeTag(int index, TagEntity tag) {
    _list[index] = tag;
  }

}
