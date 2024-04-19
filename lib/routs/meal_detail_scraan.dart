import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../demo_category.dart';

class MealDetailScreen extends StatelessWidget {
  //const MealDetail({super.key});
  static const routeName = '/meal-details';

  Widget buildTextContiner(BuildContext context, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildContiner(BuildContext context, Widget child) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.all(3),
      margin: EdgeInsets.all(5),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealId = args['id'];
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeals.title}',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: selectedMeals.id.isEmpty
            ? Text("No date")
            : Column(children: [
                ///// Container for Image  ///////////////////////////
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Image.network(
                    selectedMeals.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),

                ///// Container for Ingredient Text ///////////////////////////
                buildTextContiner(context, 'Ingredients'),
                ///// Container for Ingredient list ///////////////////////////
                buildContiner(
                    context,
                    ListView.builder(
                      itemBuilder: ((ctx, index) {
                        return Card(
                            color: Theme.of(context).secondaryHeaderColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5),
                              child: Text(
                                '${index + 1}. ${selectedMeals.ingredients[index]}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ));
                      }),
                      itemCount: selectedMeals.ingredients.length,
                    )),
                ///// Container for Step Text ///////////////////////////
                buildTextContiner(context, 'Steps'),
                ///// Container for Step list ///////////////////////////
                buildContiner(
                    context,
                    ListView.builder(
                      itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 0),
                        child: ListTile(
                          leading: CircleAvatar(
                            maxRadius: 18,
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                            child: Text('${index + 1}'),
                          ),
                          title: Text(
                            ' ${selectedMeals.steps[index]}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      itemCount: selectedMeals.steps.length,
                    )),
              ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                //backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                backgroundColor: Colors.redAccent,
                child: const Icon(Icons.delete),
                onPressed: () {
                  Navigator.of(context).pop(mealId);
                },
              ),
              FloatingActionButton(
                //backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                backgroundColor: Colors.amberAccent,
                child: const Icon(Icons.star),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
