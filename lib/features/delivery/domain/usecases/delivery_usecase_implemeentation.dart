import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/delivery/domain/repositories/delivery_repository.dart';

class DeliveryUseCaseImplementation {
  DeliveryUseCaseImplementation(this.repository);

  final DeliveryRepository repository;

  @override
  Future<DocumentSnapshot<Object?>> getDelivery() {
    return repository.getDelivery();
  }

  @override
  Future<void> saveDelivery(
      String id, List<String>? items, String? price, String? adress, String? name, String? phone, String? date, String status) {
    return repository.saveDelivery(id, items, price, adress, name, phone, date, status);
  }
}
