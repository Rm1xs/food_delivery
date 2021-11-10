import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileUseCase {
  Future<void> crateDeliveryProfile();

  Future<DocumentSnapshot<Map<String, dynamic>>> checkDeliveryProfile();

  Future<DocumentSnapshot> getDeliveryProfile();

  Future<void> saveImageProfile(File path);

  Future<void> updateImageProfile();

  Future<void> getMembership();

  Future<void> saveFavourite();

  Future<void> removeFavourite();

  // Future<void> currentVouchers();
  //
  // Future<void> currentOrders();
  //
  // Future<void> finishedOrders();
}
