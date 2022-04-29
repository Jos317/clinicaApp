
import 'package:clinica/models/medico_model.dart';
import 'package:clinica/services/medicos_service.dart';
import 'package:flutter/material.dart';

class MedicoProvider extends ChangeNotifier {
  List<MedicoModel>? medicos = null; 

  setMedicos() async
  {
    medicos = await MedicosService.getMedicos();
    notifyListeners();
  }

}
