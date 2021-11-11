class FoodModel{
  FoodModel({
    required this.hits,
  });

  List<HitModel> hits;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    hits: List<HitModel>.from(json['hits'].map((dynamic x) => HitModel.fromJson(x))),
  );
}

class HitModel {
  HitModel({
    required this.recipe,
  });

  factory HitModel.fromJson(Map<String, dynamic> json) => HitModel(
    recipe: RecipeClassModel.fromJson(json['recipe']),
  );

  RecipeClassModel recipe;
}

class RecipeClassModel {
  RecipeClassModel({
    required this.label,
    required this.image,
    required this.ingredientLines,
    required this.calories,
    required this.dietLabels,
  });

  factory RecipeClassModel.fromJson(Map<String, dynamic> json) =>
      RecipeClassModel(
        label: json['label'],
        image: json['image'],
        ingredientLines:
        List<String>.from(json['ingredientLines'].map((dynamic x) => x)),
        calories: json['calories'].toDouble(),
        dietLabels: List<String>.from(json['dietLabels'].map((dynamic x) => x)),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'label': label,
    'image': image,
    'dietLabels': List<dynamic>.from(dietLabels.map<dynamic>((dynamic x) => x)),
    'ingredientLines':
    List<String>.from(ingredientLines.map<String>((String x) => x)),
    'calories': calories,
  };

  String label;
  String image;
  List<String> ingredientLines;
  double calories;

  List<String> dietLabels;
}