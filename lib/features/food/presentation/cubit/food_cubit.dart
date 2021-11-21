import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/data/models/restaurant_model.dart';
import 'package:food_delivery/features/food/domain/usecases/food_usecase_implementation.dart';

class FoodCubit extends Cubit {
  FoodCubit(this._foodRepository) : super(null);
  final FoodUseCaseImplementation _foodRepository;

  Future<FoodModel> getFood(String name) async => await _foodRepository.searchFood(name);

  Future<void> addToFavourite(String name, String imageUrl) async => await _foodRepository.addToFavourite(name, imageUrl);

  Future<void> addToOrder(String food) async => await _foodRepository.addToOrder(food);

  Future<RestaurantModel> getRestaurants(double lat, double lon) async => await _foodRepository.getRestaurants(lat, lon);
}