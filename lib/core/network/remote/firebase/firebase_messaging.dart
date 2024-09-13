
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../../../main.dart';
import '../../../utils/app_navigation.dart';
import '../../local/cache/cache_helper.dart';
import '../../local/notifications/local_notifications.dart';

/// BACKGROUND HANDLER NOTIFICATION
Future backgroundHandler(RemoteMessage message) async {
  debugPrint('back ground message = ${message.notification?.title}');
  AppNavigator.push(
    screen: const NotificationsScreen(),
    context:navigatorKey.currentState!.context,
  );
}

class FirebaseNotifications {
  /// OBJECT FROM FCM
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// GET FCM NOTIFICATION TOKEN AND SAVE IT AN CACHE
  static Future getFcmToken() async {
    /// GET AND SAVE FCM NOTIFICATION TOKEN IN CACHE
    await messaging
        .getToken()
        .then((token) async {
      if(!CacheHelper.sharedPreferences.containsKey('fcm_token')) {
        await CacheHelper.saveData('fcm_token', token);
      }
      debugPrint('fcm_token $token');
    });
  }

  static Future init() async {
   /// REQUEST PERMISSION
    await messaging.getNotificationSettings();

    /// HANDLING WHEN APPLICATION IN BACKGROUND
    FirebaseMessaging.onBackgroundMessage(backgroundHandler,);

    await LocalNotificationService.initialize();

    /// GET FCM TOKEN
    await getFcmToken();

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true ,
      badge: true,
      sound: true,
    );

    /// WHEN APP IS KILL [CLOSED]
    await messaging.getInitialMessage().then(
      (RemoteMessage? message) async {
        if (message != null) {
          await LocalNotificationService.createNotification(message);
        }
      },
    );

    /// NOTIFICATION WHEN APPLICATION IN [BACKGROUND]
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) async {
        if (message.notification != null) {
          await LocalNotificationService.createNotification(message);
          backgroundHandler(message);
        }
      },
    );

    /// NOTIFICATION WHEN APPLICATION IN [FOREGROUND]
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        if (message.notification != null) {
          await LocalNotificationService.createNotification(message);
        }
      },
    );

  }

  static Future<void> requestNotificationPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
