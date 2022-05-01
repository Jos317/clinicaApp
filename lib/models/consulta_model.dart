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
        required this.idpaciente,
        required this.medicoNombre,
    });

    int id;
    String motivo;
    String inicio;
    String fin;
    int idpaciente;
    String medicoNombre;

    factory ConsultaModel.fromJson(Map<String, dynamic> json) => ConsultaModel(
        id: json["id"],
        motivo: json["motivo"],
        inicio: json["inicio"],
        fin: json["fin"],
        idpaciente: json["idpaciente"],
        medicoNombre: json["medico_nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "motivo": motivo,
        "inicio": inicio,
        "fin": fin,
        "idpaciente": idpaciente,
        "medico_nombre": medicoNombre,
    };
}