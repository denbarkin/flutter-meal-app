import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = "/filters";

  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters:'),
      ),
      body: const Text('Filters Main'),
    );
  }
}
