import 'package:food_delivery/features/food/data/models/food_model.dart';

abstract class FoodRepository {
  Future<void> getRestaurants();

  Future<FoodModel> searchFood(String name);

  Future<void> addToFavourite(String name, String imageUrl);

  Future<void> addToOrder(String food);
}