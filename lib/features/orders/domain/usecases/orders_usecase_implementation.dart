import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/orders/domain/repositories/orders_repository.dart';

class OrdersUseCaseImplementation {
  OrdersUseCaseImplementation(this.repository);

  final OrdersRepository repository;

  @override
  Future<void> removeFromOrder(String id) {
    return repository.removeFromOrder(id);
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
