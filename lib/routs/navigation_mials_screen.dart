import 'package:flutter/material.dart';

import '../widgets/meals_items.dart';
import '../demo_category.dart';

class NavigationMialsScreen extends StatelessWidget {
  static const routeName = '/category-mials';

  //const NavigationMialsScreen({super.key});
  // final String catId;
  // final String catTitle;

  // NavigationMialsScreen(this.catId, this.catTitle);

  @override
  Widget build(BuildContext context) {
    final pageRouts =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catTitle = pageRouts['title'];
    final catId = pageRouts['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categoryId.contains(catId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle as String),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: MealItem(
                affordebility: categoryMeals[index].affordebility,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration,
                id: categoryMeals[index].id,
                imageUrl: categoryMeals[index].imageUrl,
                title: categoryMeals[index].title,
              ),
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
