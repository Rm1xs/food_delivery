import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/core/domain/usescase/order_usecase.dart';
import 'package:food_delivery/features/orders/domain/repositories/orders_repository.dart';

class OrdersUseCaseImplementation extends OrderUseCase {
  final OrdersRepository repository;

  OrdersUseCaseImplementation(this.repository);

  @override
  Future<void> addToOrder(String food) {
    // TODO: implement addToOrder
    throw UnimplementedError();
  }

  @override
  Future<void> getStatusOrder() {
    // TODO: implement getStatusOrder
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromOrder(String id) {

    return repository.removeFromOrder(id);
  }

  @override
  Future<void> saveOrder() {
    // TODO: implement saveOrder
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot> getItemsInOrder() {
    return repository.getItemsInOrder();
  }

  @override
  Future<int> getOrderPrice() {
    return repository.getOrderPrice();
  }
}
