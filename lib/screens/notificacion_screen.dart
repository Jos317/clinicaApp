import 'package:clinica/screens/nav_bar.dart';
import 'package:clinica/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificacionScreen extends StatefulWidget {
  @override
  State<NotificacionScreen> createState() => _NotificacionScreenState();
}

class _NotificacionScreenState extends State<NotificacionScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            
          },
        ),
      ),
    );
  }

  
}
