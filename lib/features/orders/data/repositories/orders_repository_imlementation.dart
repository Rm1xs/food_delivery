import 'package:food_delivery/features/orders/domain/repositories/orders_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersRepositoryImplementation implements OrdersRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> addToOrder(String food) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('orders', food);
    print(prefs.get('orders'));
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