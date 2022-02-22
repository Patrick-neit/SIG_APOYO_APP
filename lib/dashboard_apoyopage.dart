import 'package:flutter/material.dart';
import 'package:sig_proyect_apoyo/Drawer/drawer_apoyo.dart';

class DashboardApoyoPage extends StatefulWidget {
  const DashboardApoyoPage({Key? key}) : super(key: key);

  @override
  _DashboardApoyoPageState createState() => _DashboardApoyoPageState();
}

class _DashboardApoyoPageState extends State<DashboardApoyoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wellcome Back!'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('We are here, to protect u!'),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/dashboardapoyo.jpg',
                height: 160.0,
              ),
            ],
          ),
        ),
        drawer: const MenuApoyo(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/solicitudes_apoyo');
          },
          label: const Text('Ver Solicitudes'),
          icon: const Icon(Icons.emoji_food_beverage_outlined),
        ),
      ),
    );
  }
}
