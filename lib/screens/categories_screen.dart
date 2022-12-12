import 'package:flutter/material.dart';
import 'package:mealapp/widgets/category_item.dart';
import 'package:mealapp/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((data) =>
              CategoryItem(id: data.id, title: data.title, color: data.color))
          .toList(),
    );
  }
}
