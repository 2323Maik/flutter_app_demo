enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordebility {
  Affordeble,
  Pricey,
  Luxuries,
}

class Meal {
  final String id;
  final List<String> categoryId;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordebility affordebility;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isvegas;
  final bool isVegiterian;

  const Meal({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordebility,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegiterian,
    required this.isvegas,
  });
}
