import 'dart:convert';

import 'package:clinica/main.dart';
import 'package:clinica/services/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();
  late PusherClient pusher;
  late Channel channel;

  factory NotificationService() {
    return _notificationService;
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
            macOS: null);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        keyNavegacionNotificacion.currentState!.pushNamed('consulta');
      },
    );

    await initPusher();
  }

  Future<void> showNotificacion(
      int id, String title, String body, int seconds) async {
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
          icon: 'app_icon',
        ),
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: 'test',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> initPusher() async {
    print('123');

    pusher = new PusherClient(
      "72febab278198d502232",
      PusherOptions(cluster: "us2"),
      enableLogging: true,
    );

    channel = pusher.subscribe("my-channel");

    pusher.onConnectionStateChange((state) {
      print(
          "previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });

    final id = SharedPreferencesMemory().obtenerId();
    print('hola');
    print(id);
    var pusherbind = "my-event_paciente_${id}";
    print(pusherbind);

    channel.bind(pusherbind, (event) {
      print('456');
      print(event!.data.toString());
      print('77777777');
      var respuesta = jsonDecode(event.data!);
      showNotificacion(
          1,
          'Creaste una nueva consulta',
          "Motivo: ${respuesta[0]['motivo']} Fecha y Hora de inicio: ${respuesta[0]['inicio']}",
          5);
    });
  }
}
