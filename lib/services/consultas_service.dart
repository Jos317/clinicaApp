import 'dart:convert';

import 'package:clinica/models/consulta_model.dart';
import 'package:clinica/providers/server_provider.dart';
import 'package:clinica/services/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ConsultasService {
  static Future<List<ConsultaModel>> getConsultas() async {
    final urlPrincipal = ServerProvider().url;
    final token = SharedPreferencesMemory().obtenerToken();
    final url = Uri.parse(urlPrincipal + '/api/obtenerConsultas');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (200 == response.statusCode) {
      final respuesta = jsonDecode(response.body);
      // print('aeea');
      final List<ConsultaModel> consultas = consultaModelFromJson(jsonEncode(respuesta['data']));
      print(respuesta['data']);
      return consultas;
    } else {
      return List.empty();
    }
  }
}

