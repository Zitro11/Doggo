import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//Widgets paginas


class BottomNavigatorBarMenu extends StatefulWidget {
  final ValueChanged<int> onTap; //on tap que cambia para que cambie el main

  const BottomNavigatorBarMenu({
    super.key,
    required this.onTap, // Actualiza la firma del constructor
  });

  @override
  State<BottomNavigatorBarMenu> createState() => _BottomNavigatorBarMenuState();
}

class _BottomNavigatorBarMenuState extends State<BottomNavigatorBarMenu> {

  int indexItemActual = 0;  //Inicia con el item 0 seleccionado

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.white, //color de la barra
      backgroundColor: const Color.fromARGB(176, 215, 204, 200),  //color de la burbuja
      buttonBackgroundColor: Colors.orangeAccent, //color del circulo del item
      
      //animacion
      animationCurve: Curves.fastEaseInToSlowEaseOut,
      animationDuration: const Duration(milliseconds: 500),

      index: indexItemActual,
      items: const <Widget>[
      Icon(Icons.home, size: 30,),
      Icon(Icons.map, size: 30,),
      ],

      onTap: (index) {
        setState(() {
          indexItemActual = index;
        });
        widget.onTap(index); // Llama a la función onTap pasada como parámetro
      },
    );
  }
}