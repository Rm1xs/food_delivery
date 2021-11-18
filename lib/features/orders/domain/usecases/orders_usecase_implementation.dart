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
  Future<void> removeFromOrder() {
    // TODO: implement removeFromOrder
    throw UnimplementedError();
  }

  @override
  Future<void> saveOrder() {
    // TODO: implement saveOrder
    throw UnimplementedError();
  }
}
