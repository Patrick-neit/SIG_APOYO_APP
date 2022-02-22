import 'package:http/http.dart' as http;
import 'package:sig_proyect_apoyo/models/vehiculo_register.dart';

class VehiculoService {
  Future<bool> vehiculoregister(Vehiculo vehiculo) async {
    const url = 'http://127.0.0.1:8000/api/registrar_vehiculo_apoyo';
    var log = vehiculoToMap(vehiculo);
    final response = await http.post(
      Uri.parse(url),
      body: log,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
