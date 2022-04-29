import 'dart:convert';

import 'package:clinica/models/medico_model.dart';
import 'package:clinica/providers/server_provider.dart';
import 'package:http/http.dart' as http;

class MedicosService {
  static Future<List<MedicoModel>> getMedicos(String token) async {
    final urlPrincipal = ServerProvider().url;
    final url = Uri.parse(urlPrincipal + '/api/obtenerMedicos');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (200 == response.statusCode) {
      final respuesta = jsonDecode(response.body);
      // print('aeea');
      print(respuesta);
      final List<MedicoModel> medicos = medicoModelFromJson(jsonEncode(respuesta['data']));
      return medicos;
    } else {
      return List.empty();
    }
  }
}

