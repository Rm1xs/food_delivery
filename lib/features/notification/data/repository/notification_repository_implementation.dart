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
  Future<DocumentSnapshot> getAllNewNotifications() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final DocumentSnapshot<Map<String, dynamic>> document =
        await FirebaseFirestore.instance
            .collection('Notifications')
            .doc(idToken)
            .get();
    final CollectionReference card =
        FirebaseFirestore.instance.collection('Notifications');
    final NotificationModel post = NotificationModel('Login',
        'First login ${DateTime.now().day}/ ${DateTime.now().month}/ ${DateTime.now().year}');
    final Map<String, dynamic> postData = post.toJson();
    if (document.exists) {
      return document;
    } else {
      await card.doc(idToken.toString()).set(<String, dynamic>{
        'history': FieldValue.arrayUnion(<dynamic>[postData])
      });
      final DocumentSnapshot<Map<String, dynamic>> document =
          await FirebaseFirestore.instance
              .collection('Notifications')
              .doc(idToken)
              .get();
      return document;
    }
  }

  @override
  Future<void> saveNotification(String title, String body) async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final CollectionReference card =
        FirebaseFirestore.instance.collection('Notifications');
    final NotificationModel post = NotificationModel(title, body);
    final Map<String, dynamic> postData = post.toJson();

    final DocumentSnapshot<Map<String, dynamic>> snapShot =
        await FirebaseFirestore.instance
            .collection('Notifications')
            .doc(idToken)
            .get();

    if (snapShot.exists) {
      await card.doc(idToken.toString()).update(<String, dynamic>{
        'history': FieldValue.arrayUnion(<dynamic>[postData])
      });
    } else {
      await card.doc(idToken.toString()).set(<String, dynamic>{
        'history': FieldValue.arrayUnion(<dynamic>[postData])
      });
    }
  }
}
