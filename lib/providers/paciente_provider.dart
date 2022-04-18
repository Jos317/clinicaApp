import 'package:clinica/models/paciente_model.dart';
import 'package:clinica/services/paciente_service.dart';
import 'package:flutter/material.dart';

class PacienteProvider extends ChangeNotifier {
  PacienteModel? paciente = null; 

  // String get imagen {
  //   return _imagen;
  // }

  // set imagen(String imagen) {
  //   _imagen = imagen;
  //   notifyListeners();
  // }

  setPaciente(String token) async
  {
    paciente = await PacienteService.getPaciente(token);
    notifyListeners();
  }

}
