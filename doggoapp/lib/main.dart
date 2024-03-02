import 'package:flutter/material.dart';

//Widgets importados
import 'package:doggoapp/Screens/home_screen.dart'; //Pantalla 1 Home_Screen
import 'package:doggoapp/Screens/screen02.dart';    //Pantalla 2 Screen02
import 'package:doggoapp/Widgets/Home/bottom_navigator_bar.dart'; //BtoomBar

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
    const HomeScreen(),
    const ScreenMapa(),
  ];

  int indexPaginaActual = 0;  //Item seleccionado default (pantalla)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('DOGGO')),
      body: IndexedStack(
        index: indexPaginaActual,
        children: pantallas,
      ),
      bottomNavigationBar: BottomNavigatorBarMenu(
        onTap: (index){
          setState(() {
            indexPaginaActual = index;
          });
        }
      ),
    );
  }
}