// To parse this JSON data, do
//
//     final wMedicoModel = wMedicoModelFromJson(jsonString);

import 'dart:convert';

List<MedicoModel> medicoModelFromJson(String str) => List<MedicoModel>.from(json.decode(str).map((x) => MedicoModel.fromJson(x)));

String medicoModelToJson(List<MedicoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicoModel {
    MedicoModel({
        required this.id,
        required this.nombre,
    });

    int id;
    String nombre;

    factory MedicoModel.fromJson(Map<String, dynamic> json) => MedicoModel(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
