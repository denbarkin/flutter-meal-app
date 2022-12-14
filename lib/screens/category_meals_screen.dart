import 'package:flutter/material.dart';
import 'package:mealapp/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  // final String id;
  // final String title;
  static const routeName = '/category_meals';

  final List<Meal> availableMeals;

  // const CategoryMealScreen({super.key, required this.id, required this.title});
  const CategoryMealScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void initState() {
    // Runs too ealy before global context.
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final String categoryId = routeArgs['id'] ?? "0";
    // categoryTitle = routeArgs['title'] ?? 'title';
    // categoryMeals = DUMMY_MEALS.where((element) {
    //   return element.categories.contains(categoryId);
    // }).toList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'] ?? "0";
    setState(() {
      categoryTitle = routeArgs['title'] ?? 'title';
      categoryMeals = widget.availableMeals.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
    });

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  affordability: categoryMeals[index].affordability,
                  removeItem: (result) {
                    _removeMeal(result);
                  },
                ))));
  }
}
