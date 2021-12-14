import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DeliveryRepository {
  Future<void> saveDelivery(
      String id, List<String>? items, String? price, String? adress, String? name, String? phone, String? date);

  Future<DocumentSnapshot> getDelivery();
}
