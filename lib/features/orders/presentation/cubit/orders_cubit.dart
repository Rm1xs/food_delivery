import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/orders/domain/usecases/orders_usecase_implementation.dart';

class OrdersCubit extends Cubit {
  OrdersCubit(this._ordersRepository) : super(null);
  final OrdersUseCaseImplementation _ordersRepository;

  void addToOrders(String food){
    _ordersRepository.repository.addToOrder(food);
  }
}