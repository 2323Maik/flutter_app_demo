import 'package:different_screen_spp/models/Meals.dart';
import 'package:flutter/material.dart';

import '../widgets/meals_items.dart';

class NavigationMialsScreen extends StatefulWidget {
  static const routeName = '/category-mials';
  List<Meal> availableMeal;
  NavigationMialsScreen(this.availableMeal);

  State<StatefulWidget> createState() => NavigationMialsScreenState();
}

class NavigationMialsScreenState extends State<NavigationMialsScreen> {
  //const NavigationMialsScreen({super.key});
  // final String catId;
  // final String catTitle;

  // NavigationMialsScreen(this.catId, this.catTitle);
  late String categoryTitle;
  late List<Meal> displayedMeal;
  var isInitialLoding = false;

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!isInitialLoding) {
      final pageRouts =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = pageRouts['title'].toString();
      final catId = pageRouts['id'];
      displayedMeal = widget.availableMeal.where((meal) {
        return meal.categoryId.contains(catId);
      }).toList();
      isInitialLoding = true;
    }

    super.didChangeDependencies();
  }

  void removeMeals(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle as String),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: MealItem(
                affordebility: displayedMeal[index].affordebility,
                complexity: displayedMeal[index].complexity,
                duration: displayedMeal[index].duration,
                id: displayedMeal[index].id,
                imageUrl: displayedMeal[index].imageUrl,
                title: displayedMeal[index].title,
                removeItem: removeMeals,
              ),
            );
          },
          itemCount: displayedMeal.length,
        ));
  }
}
