abstract class OrderUseCase {
  Future<void> addToOrder(String food);

  Future<void> removeFromOrder();

  Future<void> saveOrder();

  Future<void> getStatusOrder();
}
