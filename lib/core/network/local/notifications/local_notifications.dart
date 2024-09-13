import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../../../main.dart';
import '../../../utils/app_navigation.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  static Future initialize() async {
    notifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher',),
      ),
      onDidReceiveBackgroundNotificationResponse:onDidReceiveLocalNotification ,
      onDidReceiveNotificationResponse: onDidReceiveLocalNotification,
    );
  }

  static void onDidReceiveLocalNotification(
    NotificationResponse notificationResponse,
  ) async {
    AppNavigator.push(
      screen: const NotificationsScreen(),
      context:navigatorKey.currentState!.context,
    );
  }

  static Future createNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await notifications.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
      );

    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
