import 'package:flutter/material.dart';

import '../routs/Category_mials_screen.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({super.key});
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectedCategoy(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(NavigationMialsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    }
        // MaterialPageRoute(builder: (_) {
        //   return NavigationMialsScreen(id, title);
        // }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategoy(context),
      splashColor: Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.3),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
