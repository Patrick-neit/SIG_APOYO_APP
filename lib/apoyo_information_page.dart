import 'package:flutter/material.dart';
import 'package:sig_proyect_apoyo/models/turno_register.dart';
import 'package:sig_proyect_apoyo/models/vehiculo_register.dart';
import 'package:sig_proyect_apoyo/services/turnoservices.dart';
import 'package:sig_proyect_apoyo/services/vehiculoservices.dart';

class ApoyoInformationPage extends StatefulWidget {
  const ApoyoInformationPage({Key? key}) : super(key: key);

  @override
  _ApoyoInformationPageState createState() => _ApoyoInformationPageState();
}

class _ApoyoInformationPageState extends State<ApoyoInformationPage> {
  TextEditingController controllerTurnoNombre = TextEditingController();
  TextEditingController controllerVehiculoNombre = TextEditingController();
  TextEditingController controllerVehiculoPlaca = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register extra information!'),
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        const Text('Ingrese los datos '),
                        const SizedBox(
                          height: 15.0,
                        ),
                        _turnonombretextfield(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        _vehiculonombretextfield(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _vehiculoplacatextfield(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        _bottomSubmit(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/dashboard_apoyopage');
                          },
                          label: const Text('Volver'),
                          icon: const Icon(Icons.app_registration_outlined),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Widget _turnonombretextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerTurnoNombre,
          decoration: const InputDecoration(
            icon: Icon(Icons.turned_in_not_sharp),
            // hintText: 'ejemplo@gmail.com',
            labelText: 'Turno',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _vehiculonombretextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerVehiculoNombre,
          decoration: const InputDecoration(
            icon: Icon(Icons.car_rental_sharp),
            //hintText: 'ejemplo@gmail.com',
            labelText: 'Nombre del Vehiculo',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _vehiculoplacatextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerVehiculoPlaca,
          decoration: const InputDecoration(
            icon: Icon(Icons.car_rental_outlined),
            //hintText: 'ejemplo@gmail.com',
            labelText: 'Placa del vehiculo',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottomSubmit() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Enviar Inf'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.greenAccent,
          onPressed: () async {
            Turno turno = Turno(nombre: controllerTurnoNombre.text);
            Vehiculo vehiculo = Vehiculo(
                nombre: controllerVehiculoNombre.text,
                placa: controllerVehiculoPlaca.text);

            bool turnosuccess = await TurnoServices().turnoregister(turno);
            bool vehiculosuccess =
                await VehiculoService().vehiculoregister(vehiculo);

            if (turnosuccess && vehiculosuccess) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => const AlertDialog(
                    title: Text('Registrado con exito'), content: Text('Back')

                    //backgroundColor: Colors.redAccent,
                    //shape: CircleBorder(),
                    ),
              );
            } else {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => const AlertDialog(
                    title: Text('Re check your information||Empty Values'),
                    content: Text('Back')

                    //backgroundColor: Colors.redAccent,
                    //shape: CircleBorder(),
                    ),
              );
            }
          });
    });
  }
}
