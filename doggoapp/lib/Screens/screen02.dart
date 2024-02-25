import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
        backgroundColor: Colors.indigo,
      ),

      body:  GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Coordenadas de San Francisco
          zoom: 12.0,
        ),
      ),
    );
  }
}