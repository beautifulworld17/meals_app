import 'package:flutter/material.dart';

// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.currentFilters}) : super(key: key);

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegetarian = false;
  var isVegan = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isGlutenFree = widget.currentFilters[Filter.glutenFree]!;
    isLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    isVegetarian = widget.currentFilters[Filter.vegetarian]!;
    isVegan = widget.currentFilters[Filter.vegan]!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // drawer: MainDrawer(
      //   setScreen: (String identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: isGlutenFree,
            Filter.lactoseFree: isLactoseFree,
            Filter.vegetarian: isVegetarian,
            Filter.vegan: isVegan
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only include Gluten-free meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              value: isGlutenFree,
              onChanged: (bool value) {
                setState(() {
                  isGlutenFree = value;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only include Lactose-free meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              value: isLactoseFree,
              onChanged: (bool value) {
                setState(() {
                  isLactoseFree = value;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only include Vegetarian meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              value: isVegetarian,
              onChanged: (bool value) {
                setState(() {
                  isVegetarian = value;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only include Vegan meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              value: isVegan,
              onChanged: (bool value) {
                setState(() {
                  isVegan = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
