import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/orders/domain/usecases/orders_usecase_implementation.dart';

class OrdersCubit extends Cubit<void> {
  OrdersCubit(this._ordersRepository) : super(null);
  final OrdersUseCaseImplementation _ordersRepository;

  void addToOrders(String food){
    _ordersRepository.repository.addToOrder(food);
  }


  Future<DocumentSnapshot> getItemsInOrder(){
    return _ordersRepository.getItemsInOrder();
  }

  Future<int> getOrderPrice() {
    return _ordersRepository.getOrderPrice();
  }

  Future<void> removeFromOrder(String id){

    return _ordersRepository.removeFromOrder(id);
  }
}