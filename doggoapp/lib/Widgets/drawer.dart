import 'package:flutter/material.dart';

class BarraLateral extends StatelessWidget {
  const BarraLateral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.brown.shade200,
          ),
          child: const Text(
            'Menú',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: const Text('Opción 1'),
          onTap: () {
            // Implementa la funcionalidad de la opción 1
          },
        ),
        ListTile(
          title: const Text('Opción 2'),
          onTap: () {
            // Implementa la funcionalidad de la opción 2
          },
        ),
      ],
    ),
  );
  }
}