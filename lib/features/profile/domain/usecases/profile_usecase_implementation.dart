import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/core/domain/usescase/profile_usecase.dart';
import 'package:food_delivery/features/profile/domain/repositories/profile_repository.dart';

class ProfileUseCaseImplementation extends ProfileUseCase {
  final ProfileRepository repository;

  ProfileUseCaseImplementation(this.repository);

  @override
  Future<void> crateDeliveryProfile() async {
    await repository.crateDeliveryProfile();
  }

  @override
  Future<void> currentOrders() {
    // TODO: implement currentOrders
    throw UnimplementedError();
  }

  @override
  Future<void> currentVouchers() {
    // TODO: implement currentVouchers
    throw UnimplementedError();
  }

  @override
  Future<void> finishedOrders() {
    // TODO: implement finishedOrders
    throw UnimplementedError();
  }

  @override
  Future<void> getMembership() {
    // TODO: implement getMembership
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavourite() {
    // TODO: implement removeFavourite
    throw UnimplementedError();
  }

  @override
  Future<void> saveFavourite() {
    // TODO: implement saveFavourite
    throw UnimplementedError();
  }

  @override
  Future<void> saveImageProfile() {
    // TODO: implement saveImageProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateImageProfile() {
    // TODO: implement updateImageProfile
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> checkDeliveryProfile() {
    return repository.checkDeliveryProfile();
  }
}
