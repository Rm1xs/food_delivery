import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/profile/domain/repositories/profile_repository.dart';

class ProfileUseCaseImplementation {
  ProfileUseCaseImplementation(this.repository);

  final ProfileRepository repository;

  @override
  Future<void> crateDeliveryProfile() async {
    await repository.crateDeliveryProfile();
  }

  @override
  Future<void> saveImageProfile(File path) async {
    await repository.saveImageProfile(path);
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> checkDeliveryProfile() {
    return repository.checkDeliveryProfile();
  }

  @override
  Future<DocumentSnapshot> getDeliveryProfile() {
    return repository.getDeliveryProfile();
  }

  @override
  Future<String> getImageProfile() {
    return repository.getImageProfile();
  }
}
