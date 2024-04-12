import 'package:flutter/material.dart';

import '../widgets/category_Items.dart';
import '../demo_category.dart';

//import 'package:different_screen_spp/models/categories.dart';
class NavigationScreen extends StatelessWidget {
  //const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      children: [
        ...DEMMY_CATEGORY.map((val) {
          return CategoryItem(val.id, val.title, val.Color);
        }).toList(),
      ],
    );
  }
}
