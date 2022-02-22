import 'dart:convert';

Turno turnoFromMap(String str) => Turno.fromMap(json.decode(str));

String turnoToMap(Turno data) => json.encode(data.toMap());

class Turno {
  Turno({
    required this.nombre,
  });

  final String nombre;

  factory Turno.fromMap(Map<String, dynamic> json) => Turno(
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
      };
}
