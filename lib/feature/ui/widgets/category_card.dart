import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/domain/entities/category_entity.dart';
import 'package:test_app_flutter/feature/ui/pages/menu_page/menu_page.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MenuPage(title: category.name),
          ),
        );
      },
      child: Stack(
        children: [
          Image.network(category.imageUrl, fit: BoxFit.fitHeight),
          Positioned(
              top: 12,
              left: standardPadding,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    category.name,
                    style: MAIN_PAGE_TEXT_STYLE,
                  )))
        ],
      ),
    );
  }
}
