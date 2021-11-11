import 'package:food_delivery/features/food/data/models/food_model.dart';

abstract class FoodUseCase {

  Future<void> getRestaurants();

  Future<FoodModel> searchFood(String name);
}