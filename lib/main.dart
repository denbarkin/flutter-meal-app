import 'package:flutter/material.dart';
import 'package:mealapp/screens/category_meals_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';

import 'screens/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      home: const CategoriesScreen(),
      routes: <String, WidgetBuilder>{
        '/category_meals': (ctx) => const CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        MaterialPageRoute(
          builder: (context) => const CategoryMealScreen(),
        );
      },
    );
  }
}
