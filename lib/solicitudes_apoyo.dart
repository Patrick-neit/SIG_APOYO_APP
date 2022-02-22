import 'package:flutter/material.dart';
import 'package:sig_proyect_apoyo/Drawer/drawer_apoyo.dart';
import 'package:sig_proyect_apoyo/models/solicituds_emergencia_list.dart';
import 'package:sig_proyect_apoyo/services/solicitud_emergencia_list_services.dart';

class SolicitudesApoyoPage extends StatefulWidget {
  const SolicitudesApoyoPage({Key? key}) : super(key: key);

  @override
  _SolicitudesApoyoPageState createState() => _SolicitudesApoyoPageState();
}

class _SolicitudesApoyoPageState extends State<SolicitudesApoyoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Solicitudes Recibidas'),
          actions: const <Widget>[],
        ),
        drawer: const MenuApoyo(),
        body: FutureBuilder<List<Apoyo>>(
          future: SolicitudesServices().getsolicitudesapoyo(),
          builder: (BuildContext context, AsyncSnapshot<List<Apoyo>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Apoyo item = snapshot.data![index];
                  return Column(children: [
                    ListTile(
                        leading:
                            const Icon(Icons.format_list_numbered_rtl_outlined),
                        title: Text('Identificador Solicitud #:   ' +
                            item.id.toString())),
                    ListTile(
                        leading: const Icon(Icons.verified_user_rounded),
                        title: Text(
                          'Nombre de la persona que solicito:   ' +
                              item.nombreCompleto,
                        )),
                    ListTile(
                        leading: const Icon(Icons.money_off_csred_sharp),
                        title: Text('Ubicacion:   ' + item.ubicacion),
                        subtitle: const Text('Click para ver Recorrido'),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/location_client');
                        }),
                    ListTile(
                        leading: const Icon(Icons.photo_album_outlined),
                        title: Text('Estado de la solicitud:   ' + item.estado),
                        //subtitle: const Text('Click para ver fotos'),
                        onTap: () {}),
                    ListTile(
                      leading: const Icon(Icons.monetization_on_rounded),
                      title: Text('Ayuda que necesita:   ' + item.tipoApoyo),
                      //subtitle: const Text('Click para comprar album'),
                      //tileColor: (Colors.greenAccent),
                      /*onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/payment_stack');
                      },*/
                    ),
                    const ListTile(
                        title: Text(
                            '-------------------------------------------------------------------')),
                  ]);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
