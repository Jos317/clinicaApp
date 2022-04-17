import 'package:flutter/material.dart';

class ServerProvider extends ChangeNotifier {
  final String _url = 'http://192.168.100.85:8000';
  // final String _url = 'http://192.168.100.126:8000';

  String get url {
    return _url;
  }
}
