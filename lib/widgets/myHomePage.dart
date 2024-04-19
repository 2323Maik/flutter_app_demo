import '../routs/Category_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return NavigationScreen();
    /*Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meal Items',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: NavigationScreen(),
    );*/
  }
}
