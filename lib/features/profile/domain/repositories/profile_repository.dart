import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileRepository {
  Future<void> crateDeliveryProfile();

  Future<DocumentSnapshot<Map<String, dynamic>>> checkDeliveryProfile();

  Future<DocumentSnapshot> getDeliveryProfile();

  Future<void> saveImageProfile(File path);

  Future<void> getImageProfile();

  Future<void> updateImageProfile();

  Future<void> getMembership();

  Future<void> saveFavourite();

  Future<void> removeFavourite();
}
