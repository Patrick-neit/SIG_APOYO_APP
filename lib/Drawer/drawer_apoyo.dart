import 'package:flutter/material.dart';

class MenuApoyo extends StatelessWidget {
  const MenuApoyo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //Drawer para crear el menu
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/apoyoinicial.jpg'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context, '/dashboard_apoyopage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Solicitudes Pendientes'),
            onTap: () {
              Navigator.pushNamed(context, '/solicitudes_apoyo');
            },
          ),
          ListTile(
            leading: const Icon(Icons.event_available_sharp),
            title: const Text('Marcar Turno'),
            onTap: () {
              Navigator.pushNamed(context, '/apoyo_information_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.car_rental_sharp),
            title: const Text('Asignar Vehiculo'),
            onTap: () {
              Navigator.pushNamed(context, '/apoyo_information_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.enhanced_encryption),
            title: const Text('Finalizar Turno'),
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: const Text('Desea terminar turno?'),
                  content: const Text(
                      'Una vez haya asistido la emergencia debe terminar su turno'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/loginpage');
                        },
                        child: const Text('Si')),
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/dashboard_apoyopage');
                        },
                        child: const Text('Volver')),
                  ],

                  //backgroundColor: Colors.redAccent,
                  //shape: CircleBorder(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bedtime_rounded),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login_page', (Route<dynamic> route) => false);
              //Navigator.pushNamed(context, '/login_page');
            },
          ),
        ],
      ),
    );
  }
}
