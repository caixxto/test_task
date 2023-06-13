import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/domain/entities/tag_entity.dart';
import 'package:test_app_flutter/feature/ui/pages/menu_page/bloc/menu_bloc.dart';

class SelectorItem extends StatefulWidget {
  final int selectedIndex;
  bool isSelected;
  final String title;
  final void Function(String title) onTap;

  SelectorItem(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.onTap,
      required this.selectedIndex});

  @override
  State<StatefulWidget> createState() => _SelectorItemState();
}

class _SelectorItemState extends State<SelectorItem> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: widget.isSelected
          ? Text(widget.title,
              style: CHIP_TEXT_STYLE_ON)
          : Text(widget.title,
              style: CHIP_TEXT_STYLE_OFF),
      elevation: 0,
      selectedColor: BUTTON_COLOR,
      disabledColor: MENU_BACKGROUND_COLOR,
      showCheckmark: false,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: standardPadding),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      onSelected: (isSelected) {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        BlocProvider.of<MenuBloc>(context).add(MenuLoadedByTagsEvent(
            tag: TagEntity(title: widget.title, isSelected: widget.isSelected),
            index: widget.selectedIndex));
      },
      selected: widget.isSelected,
    );
  }
}
