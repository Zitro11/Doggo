import 'package:flutter/material.dart';

//Widgets importados
import 'package:doggoapp/Screens/pantalla_inicio.dart'; //Pantalla 1 Home_Screen
import 'package:doggoapp/Screens/pantalla_mapa.dart';    //Pantalla 2 Screen02
import 'package:doggoapp/Widgets/bottom_navigator_bar.dart'; //BtoomBar

void main(){
  runApp(const DoggoApp());
}

class DoggoApp extends StatelessWidget {
  const DoggoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Doggo",
      home: Main(), //Pantalla principal a partir de la cual reparte
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {  //Pantallas

  final List<Widget> pantallas = [
    const PantallaInicio(),
    const PantallaMapa(),
  ];

  int indexPantallaActual = 0;  //Item seleccionado default (pantalla)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('DOGGO')),
      body: IndexedStack(
        index: indexPantallaActual,
        children: pantallas,
      ),
      bottomNavigationBar: BottomNavigatorBarMenu(
        onTap: (index){ //se escucha el ontap de barmenu
          setState(() {
            indexPantallaActual = index;
          });
        }
      ),
    );
  }
}