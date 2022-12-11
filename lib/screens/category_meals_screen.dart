import 'package:flutter/material.dart';
import 'package:mealapp/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String id;
  // final String title;

  // const CategoryMealScreen({super.key, required this.id, required this.title});
  const CategoryMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'] ?? "0";
    final String categoryTitle = routeArgs['title'] ?? 'title';
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: ((context, index) => MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability))));
  }
}
