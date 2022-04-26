import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotificacion() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
  
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid, 
          iOS: initializationSettingsIOS, 
          macOS: null
        );
  
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotificacion(int id, String title, String body, int seconds) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id, 
      title, 
      body, 
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'main_channel',
          'Main Channel',
          channelDescription: 'Main channel notifications',
          importance: Importance.max,
          priority: Priority.max,
          icon: 'app_icon'  
        ),
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }  
}