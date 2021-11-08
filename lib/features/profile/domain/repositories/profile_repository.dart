import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileRepository {
  Future<void> crateDeliveryProfile();

  Future<DocumentSnapshot<Map<String, dynamic>>> checkDeliveryProfile();

  Future<void> saveImageProfile();

  Future<void> updateImageProfile();

  Future<void> getMembership();

  Future<void> saveFavourite();

  Future<void> removeFavourite();

  Future<void> currentVouchers();

  Future<void> currentOrders();

  Future<void> finishedOrders();
}
