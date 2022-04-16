import 'package:flutter/material.dart';

class UsuarioProvider extends ChangeNotifier {
  String _email = '';
  int _id = 0;

  String get email {
    return _email;
  }

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  int get id {
    return _id;
  }

  set id(int id) {
    _id = id;
    notifyListeners();
  }
}
