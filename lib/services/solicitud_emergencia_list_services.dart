import 'package:http/http.dart' as http;
import 'package:sig_proyect_apoyo/global_var.dart';
import 'package:sig_proyect_apoyo/models/solicituds_emergencia_list.dart';

class SolicitudesServices {
  Future<List<Apoyo>>? getsolicitudesapoyo() async {
    // ignore: prefer_const_declarations
    final url =
        'http://127.0.0.1:8000/api/obtener_solicitudes_apoyo?personal_apoyo_id=' +
            idusuario.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final solicitudesresponse = solicitudesListApoyosFromMap(response.body);
      return solicitudesresponse.apoyo;
    }
    return [];
  }
}
