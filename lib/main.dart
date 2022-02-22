import 'package:flutter/material.dart';
import 'package:sig_proyect_apoyo/apoyo_information_page.dart';
import 'package:sig_proyect_apoyo/dashboard_apoyopage.dart';
import 'package:sig_proyect_apoyo/locations/mylocation_maps.dart';
import 'package:sig_proyect_apoyo/login_page.dart';
import 'package:sig_proyect_apoyo/solicitudes_apoyo.dart';

void main() {
  runApp(const SigAppApoyo());
}

class SigAppApoyo extends StatelessWidget {
  const SigAppApoyo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIGSUPPORT|MAPS',
      home: const SigSupportPage(),
      routes: <String, WidgetBuilder>{
        '/loginpage': (BuildContext context) => const SigSupportPage(),
        '/login_page': (BuildContext context) => const LoginPage(),
        '/dashboard_apoyopage': (BuildContext context) =>
            const DashboardApoyoPage(),
        '/solicitudes_apoyo': (BuildContext context) =>
            const SolicitudesApoyoPage(),
        '/location_client': (BuildContext context) => const EventLocation(),
        '/apoyo_information_page': (BuildContext context) =>
            const ApoyoInformationPage(),
      },
    );
  }
}

class SigSupportPage extends StatefulWidget {
  const SigSupportPage({Key? key}) : super(key: key);

  @override
  _SigLoginState createState() => _SigLoginState();
}

class _SigLoginState extends State<SigSupportPage> {
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('WELLCOME TO OUR SUPPORT CENTER'),
              const SizedBox(
                height: 25,
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/apoyoinicial.jpg',
                  height: 200.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              _bottomRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Registrate'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.lightBlueAccent,
          onPressed: () {
            //Aqui tenemos q llamar a la funcion login
            Navigator.pushReplacementNamed(context, '/login_page');
            // Login();
          });
    });
  }
}
