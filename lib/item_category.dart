import 'package:flutter/material.dart';

class CategoryGridWidget extends StatelessWidget {
  Category category;
  int index;
  Function onCategoryClick;

  CategoryGridWidget(this.category, this.index, this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClick(category);
      },
      child: Container(
        decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
                bottomRight: Radius.circular(index % 2 == 0 ? 0 : 24),
                bottomLeft: Radius.circular(index % 2 == 0 ? 24 : 0))),
        child: Column(
          children: [
            Image.asset(
              category.imagePath,
              height: 120,
            ),
            Text(
              category.categoryName,
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}

class Category {
  String categoryId;
  String categoryName;
  String imagePath;
  Color color;

  Category(
      {required this.categoryId,
      required this.categoryName,
      required this.imagePath,
      required this.color});
}
