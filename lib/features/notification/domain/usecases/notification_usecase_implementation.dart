import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/notification/domain/repositories/notification_repository.dart';

class NotificationUseCaseImplementation {
  NotificationUseCaseImplementation(this.repository);

  final NotificationRepository repository;

  @override
  Future<DocumentSnapshot> getAllNewNotifications() =>
      repository.getAllNewNotifications();

  @override
  Future<void> saveNotification(String title, String body) async =>
      repository.saveNotification(title, body);
}
