import 'package:cloud_firestore/cloud_firestore.dart';

abstract class OrderUseCase {
  Future<DocumentSnapshot> getItemsInOrder();

  Future<void> addToOrder(String food);

  Future<void> removeFromOrder();

  Future<void> saveOrder();

  Future<void> getStatusOrder();
}
