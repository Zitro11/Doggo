import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';//Paquete googlemap


class PantallaMapa extends StatefulWidget {
  const PantallaMapa({super.key});

  @override
  State<PantallaMapa> createState() => _PantallaMapaState();
}

class _PantallaMapaState extends State<PantallaMapa> {
  
  late GoogleMapController mapController;

    //Conjunto para los Marcadores
  Set<Marker> markers = {};
  bool isPanelVisible = false;

  //Metodo para añadir marcadores
  void _addMarker(double lat, double lng, String title) {
  final MarkerId markerId = MarkerId(title);
  final Marker marker = Marker(
    markerId: markerId,
    position: LatLng(lat, lng),
    infoWindow: InfoWindow(title: title),
    onTap: () { //ontap de cada marcador
        setState(() {
          isPanelVisible = true;
        });
      },
  );

  setState(() {
    markers.add(marker);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
        backgroundColor: Colors.brown.shade200,
      ),

      body:  Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
              _addMarker(27.4531518769156, -99.51307663563921, 'Estadio');
              _addMarker(27.451572514753085, -99.51640818270816, 'Campo Baseball');
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(27.453148, -99.515074),
              zoom: 17.0,
              bearing: 28.0, // Ángulo de orientación en grados (en este caso, 45 grados)
            ),
            markers: markers,
            onTap: (LatLng latLng) {
              // Oculta la barra lateral al tocar cualquier parte del mapa
              setState(() {
                isPanelVisible = false;
              });
              
            },
          ),
          // Panel lateral con información adicional
          AnimatedPositioned(
            bottom: isPanelVisible ? 0 : -200, // Ajusta la posición para que aparezca en la parte inferior
            left: 0,
            right: 0,
            height: 200,
            duration: const Duration(milliseconds: 300),
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: markers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(markers.elementAt(index).infoWindow.title ?? ''),
                    // Puedes agregar más detalles aquí
                    // como descripciones, imágenes, etc.
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}