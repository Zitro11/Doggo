import 'package:flutter/material.dart';

//Widgets paginas


class BottomNavigatorBarMenu extends StatefulWidget {
  const BottomNavigatorBarMenu({
    super.key,
  });

  @override
  State<BottomNavigatorBarMenu> createState() => _BottomNavigatorBarMenuState();
}

class _BottomNavigatorBarMenuState extends State<BottomNavigatorBarMenu> {

  int indexPaginaActual = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          indexPaginaActual = index;
        });
      },
      currentIndex: indexPaginaActual,
      items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
      BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa')
      ]
    );
  }
}