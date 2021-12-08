import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DeliveryCase {

  Future<void> saveDelivery(String id, List<String> items, String price, String card, String adress);

  Future<DocumentSnapshot> getDelivery();

}