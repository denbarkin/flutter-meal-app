import 'dart:developer';

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
      {super.key, required this.id, required this.title, required this.color});

  // void select(BuildContext ctx) {
  //   log("selected title is $title");
  //   Navigator.of(ctx).push(MaterialPageRoute(
  //       builder: (ctx) => CategoryMealScreen(id: id, title: title)));
  // }

  void select(BuildContext ctx) {
    log("selected title is $title");
    Navigator.of(ctx).pushNamed(
      '/category_meals',
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => select(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
          child: Text(title, style: Theme.of(context).textTheme.headline6)),
    );
  }
}
