import 'package:flutter/material.dart';

class PacienteProvider extends ChangeNotifier {
  String _token = '';

  String get token {
    return _token;
  }

  set token(String token) {
    _token = token;
    notifyListeners();
  }

}
