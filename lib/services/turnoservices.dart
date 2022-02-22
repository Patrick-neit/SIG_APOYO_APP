import 'package:http/http.dart' as http;
import 'package:sig_proyect_apoyo/models/turno_register.dart';

class TurnoServices {
  Future<bool> turnoregister(Turno turno) async {
    const url = 'http://127.0.0.1:8000/api/registrar_turno_apoyo';
    var log = turnoToMap(turno);
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
