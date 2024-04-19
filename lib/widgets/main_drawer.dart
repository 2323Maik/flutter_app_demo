import 'package:flutter/material.dart';

import '../routs/filtersScreen.dart';

class MainDrawer extends StatelessWidget {
  //const MyWidget({super.key});

  Widget buildListTil(
      BuildContext context, String title, IconData icon, Function tabHandler) {
    return ListTile(
      hoverColor: const Color.fromRGBO(230, 230, 230, 1),
      leading: Icon(
        icon,
        size: 24,
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "OpenSans",
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () => tabHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //surfaceTintColor: Colors.amber,

      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: const Text(
              "Cooking Up!",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Quicksand",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildListTil(context, "Meals", Icons.restaurant, () {
            ////////////////// use  pushReplacementNamed insted of pushNamed to delete stack////////////////
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTil(context, "Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
