import 'package:food_delivery/core/domain/usescase/food_usecase.dart';
import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/data/models/restaurant_model.dart';
import 'package:food_delivery/features/food/domain/repositories/food_repository.dart';

class FoodUseCaseImplementation extends FoodUseCase{
  final FoodRepository repository;

  FoodUseCaseImplementation(this.repository);
  @override
  Future<RestaurantModel> getRestaurants(double lat, double lon) {
    return repository.getRestaurants(lat, lon);
  }

  @override
  Future<FoodModel> searchFood(String name) {
    return repository.searchFood(name);
  }

  @override
  Future<void> addToFavourite(String name, String imageUrl) {
    return repository.addToFavourite(name, imageUrl);
  }

  @override
  Future<void> addToOrder(String name, String image, String price) {
    return repository.addToOrder(name, image, price);
  }
}