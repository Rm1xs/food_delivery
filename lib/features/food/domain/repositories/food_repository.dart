import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/data/models/restaurant_model.dart';

abstract class FoodRepository {
  Future<RestaurantModel> getRestaurants(double lat, double lon);

  Future<FoodModel> searchFood(String name);

  Future<void> addToFavourite(String name, String imageUrl);

  Future<void> addToOrder(String food);
}