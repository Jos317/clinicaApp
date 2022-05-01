import 'package:clinica/models/consulta_model.dart';
import 'package:clinica/services/consultas_service.dart';
import 'package:flutter/material.dart';

class ConsultaProvider extends ChangeNotifier {
  List<ConsultaModel>? consultas = null; 

  setConsultas() async
  {
    consultas = await ConsultasService.getConsultas();
    notifyListeners();
  }

}