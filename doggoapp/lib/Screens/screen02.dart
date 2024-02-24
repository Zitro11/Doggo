import 'package:flutter/material.dart';


class Mapa extends StatelessWidget {
  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
        backgroundColor: Colors.indigo,
      ),

      body: const Center(
        child: Text("Hola")
      ),

    );
  }
}