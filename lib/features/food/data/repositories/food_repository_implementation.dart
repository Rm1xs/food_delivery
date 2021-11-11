import 'dart:convert';

import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/domain/repositories/food_repository.dart';
import 'package:http/http.dart' as http;


class FoodRepositoryImplementation implements FoodRepository {
  @override
  Future<void> getRestaurants() {
    // TODO: implement getRestaurants
    throw UnimplementedError();
  }

  @override
  Future<FoodModel> searchFood(String name) async {
    String query = 'https://api.edamam.com/search?q=$name&app_id=f54d1c43&app_key=ea6e29f77ce572331ff618bee02f7ab8';
    final http.Client client = http.Client();
    final http.Response response = await client.get(
      Uri.parse(query),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final FoodModel data = FoodModel.fromJson(json.decode(response.body));

      // data.hits.sort((HitModel a, HitModel b) =>
      //     a.recipe.calories.compareTo(b.recipe.calories));
      return data;
    } else {
      throw Exception();
    }
  }
}
