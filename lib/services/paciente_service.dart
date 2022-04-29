import 'dart:convert';

import 'package:clinica/models/paciente_model.dart';
import 'package:clinica/providers/server_provider.dart';
import 'package:clinica/services/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PacienteService {
  static Future<PacienteModel?> getPaciente() async {
    final urlPrincipal = ServerProvider().url;
    final token = SharedPreferencesMemory().obtenerToken();
    final url = Uri.parse(urlPrincipal + '/api/obtenerPaciente');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (200 == response.statusCode) {
      final respuesta = jsonDecode(response.body);
      // print('aeea');
      print(respuesta);
      return PacienteModel.fromJson(respuesta['data']);
    } else {
      return null;
    }
  }
}
