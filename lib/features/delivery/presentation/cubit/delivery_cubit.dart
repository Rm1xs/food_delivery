import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/delivery/data/repositories/delivery_repository_implementation.dart';

class DeliveryCubit extends Cubit<void> {
  DeliveryCubit(this._deliveryRepository) : super(null);
  final DeliveryRepositoryImplementation _deliveryRepository;

  Future<void> saveDeliveryOrder(String id, List<String> items, String price, String adress, String date) async => _deliveryRepository.saveDelivery(id, items, price, adress, date);
}