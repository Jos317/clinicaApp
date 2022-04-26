import 'package:clinica/screens/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';

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
            print('pusheeeeeeeer');
            initPusher();
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
    });
  }
}
