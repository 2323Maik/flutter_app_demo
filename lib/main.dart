import 'package:flutter/material.dart';

import '../routs/meal_detail_scraan.dart';
import 'package:different_screen_spp/routs/navigation_screen.dart';
import 'package:different_screen_spp/routs/tabs_screen.dart';
import '../routs/navigation_mials_screen.dart';

void main() => runApp(DiffScreenApp());

class DiffScreenApp extends StatelessWidget {
  //const MyWidget({super.key});

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
                fontSize: 16,
                fontFamily: 'Quicksand',
              ),
              bodyLarge: const TextStyle(
                  color: Color.fromRGBO(16, 76, 105, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand'),
              titleLarge: const TextStyle(
                  color: Color.fromRGBO(16, 76, 105, 1),
                  fontSize: 16,
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
        '/': (context) => TabsScreen(),
        NavigationMialsScreen.routeName: (context) => NavigationMialsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => NavigationScreen(),
        );
      },
    );
  }
}
