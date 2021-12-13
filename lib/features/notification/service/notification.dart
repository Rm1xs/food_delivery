import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/notification/data/models/push_notification.dart';
import 'package:overlay_support/overlay_support.dart';
import '../presentation/cubit/notification_cubit.dart';
import '../../../injection.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}

Future<void> init() async {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final NotificationSettings settings = await _messaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(
          'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');

      final PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );

      showSimpleNotification(
        Text(notification.title!),
        subtitle: Text(notification.body!),
        background: Colors.cyan.shade700,
        duration: const Duration(seconds: 2),
      );
      await sl<NotificationCubit>()
          .saveNotification(notification.title!, notification.body!);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
    });
  } else {
    print('User not receive notification');
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
    });
  }
}

