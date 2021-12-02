import 'package:cloud_firestore/cloud_firestore.dart';

abstract class NotificationUseCase {

  Future<void> saveNotification(String title, String body);

  Future<void> archiveNotification();

  Future<DocumentSnapshot> getAllNewNotifications();
}
