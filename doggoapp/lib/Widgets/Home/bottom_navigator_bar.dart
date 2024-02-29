import 'package:flutter/material.dart';

class BottomNavigatorBarMenu extends StatelessWidget {
  const BottomNavigatorBarMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
      BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa')
    ]);
  }
}