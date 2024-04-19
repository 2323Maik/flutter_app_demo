import 'package:different_screen_spp/routs/meal_detail_scraan.dart';

import '../models/Meals.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  //const MealItem({super.key});
  final String id;
  final String title;
  final String imageUrl;
  final Affordebility affordebility;
  final Complexity complexity;
  final int duration;
  final Function removeItem;

  MealItem({
    required this.affordebility,
    required this.complexity,
    required this.duration,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.removeItem,
  });

  void selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: {
      'id': id,
      'title': title,
    }).then((value) {
      if (value != null) {
        removeItem(value);
      }
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordebility) {
      case Affordebility.Affordeble:
        return 'Affordeble';
        break;
      case Affordebility.Luxuries:
        return 'Expencive';
        break;
      case Affordebility.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectedMeal(context),
        child: Container(
          //height: MediaQuery.of(context).size.height * 0.4,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Column(
                children: [
                  Stack(children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        imageUrl,
                        height: 220, //MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black38,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                overflow: TextOverflow.fade,
                              )),
                        ))
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule),
                            const SizedBox(width: 6),
                            Text('$duration'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 6),
                            Text(complexityText),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(width: 6),
                            Text(affordabilityText),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
