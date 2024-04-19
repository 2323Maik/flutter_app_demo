import 'package:flutter/material.dart';

import '../routs/filtersScreen.dart';

import '../demo_category.dart';
import '../models/Meals.dart';
import '../routs/meal_detail_scraan.dart';
import '../routs/Category_screen.dart';
import '../routs/tabs_screenWithDrawer.dart';
import '../routs/Category_mials_screen.dart';

void main() => runApp(DiffScreenApp());

class DiffScreenApp extends StatefulWidget {
  State<StatefulWidget> createState() => DiffScreenAppState();
}

//const MyWidget({super.key});
//something

class DiffScreenAppState extends State<DiffScreenApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegitarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterdMeal) {
    setState(() {
      _filters = filterdMeal;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isvegas) {
          return false;
        }
        if (_filters['vegitarian']! && !meal.isVegiterian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          errorColor: Colors.deepOrange,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                color: Color.fromRGBO(46, 106, 135, 1),
                fontSize: 15,
                fontFamily: 'Quicksand',
              ),
              bodyLarge: const TextStyle(
                  color: Color.fromRGBO(16, 76, 105, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand'),
              titleLarge: const TextStyle(
                  color: Color.fromRGBO(16, 76, 105, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans')),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Color.fromRGBO(16, 76, 105, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
            backgroundColor: Color.fromRGBO(0, 153, 202, 1),
          )),
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        NavigationMialsScreen.routeName: (context) =>
            NavigationMialsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => NavigationScreen(),
        );
      },
    );
  }
}
