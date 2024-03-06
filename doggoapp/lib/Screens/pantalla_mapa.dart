import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';//Paquete googlemap
//import 'package:location/location.dart';  //Paquete para la locacion
//import 'package:permission_handler/permission_handler.dart'; //paquete para pedir permiso de locacion

class PantallaMapa extends StatefulWidget {
  const PantallaMapa({super.key});

  @override
  State<PantallaMapa> createState() => _PantallaMapaState();
}

class _PantallaMapaState extends State<PantallaMapa> {
  
  late GoogleMapController mapController;
  /*Location location = Location();
  late LocationData currentLocation;*/


  /*@override
  void initState() {
    super.initState();
    _getLocation();
    //_requestLocationPermission(); Para los permisos
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      _getLocation();
    } else {
      // Permiso denegado, puedes mostrar un mensaje o tomar otra acción
    }
  }

  Future<void> _getLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
      });
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }*/



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
          target: LatLng(27.453148, -99.515074), // Coordenadas de San Francisco
          zoom: 17.0,
          bearing: 32.0, // Ángulo de orientación en grados (en este caso, 45 grados)
          tilt: 50.0, // Ángulo de inclinación de la cámara en grados (en este caso, 30 grados)
        ),
        //myLocationEnabled: true,
      ),
    );
  }
}