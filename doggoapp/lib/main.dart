import 'package:flutter/material.dart';

//Widgets importados
import 'package:doggoapp/Screens/home_screen.dart'; //Pantalla 1 Home_Screen

void main(){
  runApp(const DoggoApp());
}

class DoggoApp extends StatelessWidget {
  const DoggoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Doggo",
      home: Inicio(),
    );
  }
}

