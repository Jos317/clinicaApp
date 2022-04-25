// To parse this JSON data, do
//
//     final pacienteModel = pacienteModelFromJson(jsonString);

import 'dart:convert';

PacienteModel pacienteModelFromJson(String str) => PacienteModel.fromJson(json.decode(str));

String pacienteModelToJson(PacienteModel data) => json.encode(data.toJson());

class PacienteModel {
    PacienteModel({
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.ci,
        required this.telefono,
        required this.direccion,
        required this.sexo,
        required this.fechaNac,
        required this.email,
        required this.imagen,
        required this.estado,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String nombre;
    String apellido;
    String ci;
    String telefono;
    String direccion;
    String sexo;
    String fechaNac;
    String email;
    String imagen;
    int estado;
    DateTime createdAt;
    DateTime updatedAt;

    factory PacienteModel.fromJson(Map<String, dynamic> json) => PacienteModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        sexo: json["sexo"],
        fechaNac: json["fecha_nac"],
        email: json["email"],
        imagen: json["imagen"],
        estado: json["estado"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "telefono": telefono,
        "direccion": direccion,
        "sexo": sexo,
        "fecha_nac": fechaNac,
        "email": email,
        "imagen": imagen,
        "estado": estado,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
