import 'dart:convert';

SolicitudesListApoyos solicitudesListApoyosFromMap(String str) =>
    SolicitudesListApoyos.fromMap(json.decode(str));

String solicitudesListApoyosToMap(SolicitudesListApoyos data) =>
    json.encode(data.toMap());

class SolicitudesListApoyos {
  SolicitudesListApoyos({
    required this.succes,
    required this.apoyo,
  });

  final bool succes;
  final List<Apoyo> apoyo;

  factory SolicitudesListApoyos.fromMap(Map<String, dynamic> json) =>
      SolicitudesListApoyos(
        succes: json["succes"],
        apoyo: List<Apoyo>.from(json["apoyo"].map((x) => Apoyo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "succes": succes,
        "apoyo": List<dynamic>.from(apoyo.map((x) => x.toMap())),
      };
}

class Apoyo {
  Apoyo({
    required this.id,
    required this.nombreCompleto,
    required this.ubicacion,
    required this.estado,
    required this.tipoApoyo,
  });

  final int id;
  final String nombreCompleto;
  final String ubicacion;
  final String estado;
  final String tipoApoyo;

  factory Apoyo.fromMap(Map<String, dynamic> json) => Apoyo(
        id: json["id"],
        nombreCompleto: json["nombre_completo"],
        ubicacion: json["ubicacion"],
        estado: json["estado"],
        tipoApoyo: json["tipo_apoyo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre_completo": nombreCompleto,
        "ubicacion": ubicacion,
        "estado": estado,
        "tipo_apoyo": tipoApoyo,
      };
}
