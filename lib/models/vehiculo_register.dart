import 'dart:convert';

Vehiculo vehiculoFromMap(String str) => Vehiculo.fromMap(json.decode(str));

String vehiculoToMap(Vehiculo data) => json.encode(data.toMap());

class Vehiculo {
  Vehiculo({
    required this.nombre,
    required this.placa,
  });

  final String nombre;
  final String placa;

  factory Vehiculo.fromMap(Map<String, dynamic> json) => Vehiculo(
        nombre: json["nombre"],
        placa: json["placa"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "placa": placa,
      };
}
