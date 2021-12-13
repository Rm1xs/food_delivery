import 'dart:convert';

class FoodModel {
  FoodModel({
    required this.hits,
  });

  List<HitModel> hits;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        hits: List<HitModel>.from(
            json['hits'].map((dynamic x) => HitModel.fromJson(x))),
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
    required this.dish,
  });

  factory RecipeClassModel.fromJson(Map<String, dynamic> json) =>
      RecipeClassModel(
        label: json['label'],
        image: json['image'],
        ingredientLines:
            List<String>.from(json['ingredientLines'].map((dynamic x) => x)),
        calories: json['calories'].toDouble(),
        dietLabels: List<String>.from(json['dietLabels'].map((dynamic x) => x)),
        dish: json['dishType'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'label': label,
        'image': image,
        'dietLabels':
            List<dynamic>.from(dietLabels.map<dynamic>((dynamic x) => x)),
        'ingredientLines':
            List<String>.from(ingredientLines.map<String>((String x) => x)),
        'calories': calories,
        'dish': dish,
      };

  static String encode(List<RecipeClassModel> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>(
                (RecipeClassModel music) => RecipeClassModel.toMap(music))
            .toList(),
      );

  static List<RecipeClassModel> decode(String musics) => (json.decode(musics)
          as List<dynamic>)
      .map<RecipeClassModel>((dynamic item) => RecipeClassModel.fromJson(item))
      .toList();

  static Map<String, dynamic> toMap(RecipeClassModel music) =>
      <String, dynamic>{
        'label': music.label,
        'image': music.image,
        'ingredientLines': music.ingredientLines,
        'calories': music.calories,
        'dish': music.dish,
        'dietLabels': music.dietLabels,
      };

  String label;
  String image;
  List<String> ingredientLines;
  double calories;
  List<dynamic> dish;
  List<String> dietLabels;
}
