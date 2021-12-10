import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DeliveryUseCase {
  Future<void> saveDelivery(
      String id, List<String> items, String price, String adress, String date);

  Future<DocumentSnapshot> getDelivery();
}
