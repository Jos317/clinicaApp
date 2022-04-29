// To parse this JSON data, do
//
//     final ConsultaModel = ConsultaModelFromJson(jsonString);

import 'dart:convert';

List<ConsultaModel> consultaModelFromJson(String str) => List<ConsultaModel>.from(json.decode(str).map((x) => ConsultaModel.fromJson(x)));

String consultaModelToJson(List<ConsultaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConsultaModel {
    ConsultaModel({
        required this.id,
        required this.motivo,
        required this.inicio,
        required this.fin,
        required this.idusuario,
        required this.idpaciente,
    });

    int id;
    String motivo;
    DateTime inicio;
    DateTime fin;
    int idusuario;
    int idpaciente;

    factory ConsultaModel.fromJson(Map<String, dynamic> json) => ConsultaModel(
        id: json["id"],
        motivo: json["motivo"],
        inicio: DateTime.parse(json["inicio"]),
        fin: DateTime.parse(json["fin"]),
        idusuario: json["idusuario"],
        idpaciente: json["idpaciente"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "motivo": motivo,
        "inicio": inicio.toIso8601String(),
        "fin": fin.toIso8601String(),
        "idusuario": idusuario,
        "idpaciente": idpaciente,
    };
}
