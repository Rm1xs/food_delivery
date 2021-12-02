import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/notification/domain/usecases/notification_usecase_implementation.dart';

class NotificationCubit extends Cubit<void> {
  NotificationCubit(this._notifyRepository) : super(null);
  final NotificationUseCaseImplementation _notifyRepository;

  Future<void> saveNotification(String title, String body) async =>
      _notifyRepository.saveNotification(title, body);

  Future<DocumentSnapshot> getNotifications() => _notifyRepository.getAllNewNotifications();
}
