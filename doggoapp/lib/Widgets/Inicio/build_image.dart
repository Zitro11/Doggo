
import 'package:flutter/material.dart';

class BuildImageWidget extends StatelessWidget {
  const BuildImageWidget({
    super.key,
    required this.urlImage,
    required this.index,
  });

  final String urlImage;
  final int index;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),  //separacion horizontal entre cada container
    decoration: BoxDecoration(  //decoracion del contenedor
      borderRadius: BorderRadius.circular(40.0),  //El radio de los bordes del contenedor (sombra)
      boxShadow: [  //establecemos la sombra
        BoxShadow(
          color: Colors.black.withOpacity(0.2), //Color de la sombra
          spreadRadius: 2, //Radio de difusion de la sombra
          blurRadius: 4,  //Radio de desenfoque de la sombra
          offset: const Offset(-8, 10),  //Psicion de la sombra x, y (0, 2)
        )
      ],
    ),
    child: ClipRRect( //Para los bordes de la imagen
      borderRadius: BorderRadius.circular(50.0),  //Radio de los bordes de las imagenes
      child: Container(
        child: Padding(
        padding: const EdgeInsets.all(0.0), // Margen interno
        child: Image.network(urlImage, fit: BoxFit.cover),
        ),
      ),  
    )
  );
}