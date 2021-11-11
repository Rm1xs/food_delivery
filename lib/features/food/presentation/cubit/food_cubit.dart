import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/domain/usecases/food_usecase_implementation.dart';

class FoodCubit extends Cubit {
  FoodCubit(this._foodRepository) : super(null);
  final FoodUseCaseImplementation _foodRepository;


  Future<FoodModel> getFood(String name) async {
    return await _foodRepository.searchFood(name);
  }
}