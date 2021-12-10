import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/core/domain/usescase/delivery_usecase.dart';
import 'package:food_delivery/features/delivery/domain/repositories/delivery_repository.dart';

class DeliveryUseCaseImplementation extends DeliveryUseCase {

  final DeliveryRepository repository;

  DeliveryUseCaseImplementation(this.repository);

  @override
  Future<DocumentSnapshot<Object?>> getDelivery() {
    return repository.getDelivery();
  }

  @override
  Future<void> saveDelivery(String id, List<String> items, String price, String adress, String date) {
    return repository.saveDelivery(id, items, price, adress, date);
  }

}