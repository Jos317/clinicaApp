import 'dart:convert';

import 'package:clinica/screens/nav_bar.dart';
import 'package:clinica/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificacionScreen extends StatefulWidget {
  @override
  State<NotificacionScreen> createState() => _NotificacionScreenState();
}

class _NotificacionScreenState extends State<NotificacionScreen> {
  late PusherClient pusher;
  late Channel channel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
    initPusher();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('s'),
      ),
      drawer: NavBar(),
      body: Center(
        child: ElevatedButton(
          child: Text('Woolha.com'),
          onPressed: () async {
            NotificationService().showNotificacion(1, 'Botooon', 'Probandoooo', 5);
          },
        ),
      ),
    );
  }

  Future<void> initPusher() async {
    print('123');
    
    // var options = PusherOptions(
    //     host: '10.0.2.2',
    //     port: 6001,
    //     encrypted: false,
    //     cluster: 'us2'
    // );
  
    // LaravelFlutterPusher pusher = LaravelFlutterPusher('72febab278198d502232', options, enableLogging: true);
    // pusher
    //     .subscribe('my-channel')
    //     .bind('my-event', (data) => {
    //       print('456'),
    //       print((data ?? '').toString())
    //     });
    pusher = new PusherClient(
      "72febab278198d502232",
      PusherOptions(
        cluster: "us2"
      ),
      enableLogging: true,
    );

    channel = pusher.subscribe("my-channel");

    pusher.onConnectionStateChange((state) {
      print("previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });

    channel.bind('my-event', (event) {
      print('456');
      print(event!.data.toString());
      print('77777777');
      var respuesta = jsonDecode(event.data!);
      NotificationService().showNotificacion(1, 'Nueva Consulta', "Usuario: ${respuesta[0]['email']}", 5);
    });
  }
}
