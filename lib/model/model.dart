class Meal {
  final String idMeal;
  final String meal;
  final String mealAlternate;
  final String category;
  final String area;
  final String instructions;
  final String mealThumb;
  final String tags;
  final String youtube;
  final List<String> ingredients;
  final List<String> measures;

  Meal({
    required this.idMeal,
    required this.meal,
    required this.mealAlternate,
    required this.category,
    required this.area,
    required this.instructions,
    required this.mealThumb,
    required this.tags,
    required this.youtube,
    required this.ingredients,
    required this.measures,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];
    for (int i = 0; i <= 20; i++) {
      final ing = json['strIngredient$i'];
      final mea = json['strMeasure$i'];
      if (ing != null && ing.toString().trim().isNotEmpty) {
        ingredients.add(ing);
        measures.add(mea ?? '');
      }
    }
    return Meal(
      idMeal: json['idMeal'],
      meal: json['strMeal'],
      mealAlternate: json['strMealAlternate'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      mealThumb: json['strMealThumb'],
      tags: json['strTags'],
      youtube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }
}
