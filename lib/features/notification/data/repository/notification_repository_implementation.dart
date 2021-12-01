import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/notification/data/models/notification_model.dart';
import 'package:food_delivery/features/notification/domain/repositories/notification_repository.dart';

class NotificationRepositoryImplementation implements NotificationRepository {
  @override
  Future<void> archiveNotification() {
    // TODO: implement archiveNotification
    throw UnimplementedError();
  }

  @override
  Future<void> getAllNewNotifications() {
    // TODO: implement getAllNewNotifications
    throw UnimplementedError();
  }

  @override
  Future<void> saveNotification(String title, String body) async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final CollectionReference card =
    FirebaseFirestore.instance.collection('Notifications');
    NotificationModel post = NotificationModel(title, body);
    Map<String, dynamic> postData = post.toJson();
    await card.doc(idToken.toString()).set(postData);
  }
}