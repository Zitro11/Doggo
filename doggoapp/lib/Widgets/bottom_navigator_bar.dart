import 'package:flutter/material.dart';

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

  int indexPaginaActual = 0;  //Inicia con el item 0 seleccionado

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indexPaginaActual,
      items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa')
      ],
      onTap: (index) {
        setState(() {
          indexPaginaActual = index;
        });
        widget.onTap(index); // Llama a la función onTap pasada como parámetro
      },
    );
  }
}