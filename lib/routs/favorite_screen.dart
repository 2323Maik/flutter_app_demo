import 'package:different_screen_spp/models/Meals.dart';
import 'package:flutter/material.dart';
import '../widgets/meals_items.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  //const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.favoriteMeals.isEmpty
            ? const Center(
                child: Text("Not yet favorite meals are selected"),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Center(
                    child: MealItem(
                      affordebility: widget.favoriteMeals[index].affordebility,
                      complexity: widget.favoriteMeals[index].complexity,
                      duration: widget.favoriteMeals[index].duration,
                      id: widget.favoriteMeals[index].id,
                      imageUrl: widget.favoriteMeals[index].imageUrl,
                      title: widget.favoriteMeals[index].title,
                    ),
                  );
                },
                itemCount: widget.favoriteMeals.length,
              ));
  }
}
