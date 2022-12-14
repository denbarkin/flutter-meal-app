import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveHandler;
  final Map<String, bool> filters;
  const FiltersScreen(
      {super.key, required this.filters, required this.saveHandler});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] ?? true;
    _lactoseFree = widget.filters['lactose'] ?? false;
    _vegan = widget.filters['vegan'] ?? true;
    _vegetarian = widget.filters['vegetarian'] ?? false;

    super.initState();
  }

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, Function? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: ((value) {
        updateValue!(value);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: const Text('Filters:'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.filter),
          tooltip: 'Filter Meals',
          onPressed: () {
            Map<String, bool> selectedFilters = {
              "gluten": _glutenFree,
              "lactose": _lactoseFree,
              "vegan": _vegan,
              "vegetarian": _vegetarian,
            };
            print(selectedFilters);
            widget.saveHandler(selectedFilters);
          },
        ),
      ]),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your mail selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTitle(
                  "Gluten Free", "Filter Gluten Free Meals.", _glutenFree,
                  (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
              _buildSwitchListTitle(
                  "Lactose Free", "Filter Lactose Free Meals.", _lactoseFree,
                  (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
              _buildSwitchListTitle(
                  "Vegetarian", "Only include vegetarian meal.", _vegetarian,
                  (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
              _buildSwitchListTitle("Vegan", "Only include vegan meal.", _vegan,
                  (value) {
                setState(() {
                  _vegan = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
