import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/delivery/domain/usecases/delivery_usecase_implemeentation.dart';

class DeliveryCubit extends Cubit<void> {
  DeliveryCubit(this._deliveryRepository) : super(null);
  final DeliveryUseCaseImplementation _deliveryRepository;

  Future<DocumentSnapshot> getDeliveryOrders() {
    return _deliveryRepository.repository.getDelivery();
  }

  Future<void> saveDeliveryOrder(String id, List<String>? items, String? price,
          String? adress, String? name, String? phone, String? date, String status) async =>
      _deliveryRepository.saveDelivery(
          id, items, price, adress, name, phone, date, status);
}
