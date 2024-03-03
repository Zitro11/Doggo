import 'package:flutter/material.dart';
//import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';  //Carruel

//Widgets
import 'package:doggoapp/Widgets/drawer.dart';
import 'package:doggoapp/Widgets/Inicio/build_image.dart';
import 'package:doggoapp/Widgets/Inicio/build_indicator.dart';



class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  //Para el drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();//Es para acceder al estado del Scaffold desde cualquier parte de la app

  int indexMonumento = 0; //Identificar el monumento/imagen
  
  final urlImages = [   //Imagenes Swider
    'https://www.infobae.com/new-resizer/JCs2kAWl8JJTof38sUHrj7jHKBc=/992x744/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170301/monumentos-mas-famosos-del-mundo-9.jpg',
    'https://www.infobae.com/new-resizer/1Wphr5DmlXFEwJcZEMUEcUEHGMs=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170254/monumentos-mas-famosos-del-mundo-7.jpg',
    'https://www.infobae.com/new-resizer/Xu8r72M2iXVhmAndzq81E_KrAII=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170326/monumentos-mas-famosos-del-mundo-15.jpg',
    'https://www.infobae.com/new-resizer/YJMsxGe-c__KFI2YApXBZcFqwPA=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170345/monumentos-mas-famosos-del-mundo-21.jpg',
    'https://www.infobae.com/new-resizer/gK4YQlUzAxZxDzLXCJDanCJf0pc=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170417/monumentos-mas-famosos-del-mundo-26.jpg',
  ];

  final titulosMonumentos = [
    'Coliseo Romano',
    'Pramides de Giza',
    'Chichen Itza',
    'Machu Picchu',
    'Cataratas del Niagara'
  ];

  final descripcionMonumentos = [
    'Coliseo (Roma, Italia)',
    'Pirámides de Giza (Egipto)',
    'Chichén Itzá (México)',
    'Machu Picchu (Perú)',
    'Cataratas del Niágara (Canadá)'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, //para el drawer
      appBar: AppBar(
        title: const Text("Doggo"),
        backgroundColor: Colors.brown.shade100,
        leading: IconButton(            //Agregamos el boton del menu
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),

      //backgroundColor: Image.network(urlImages[indexMonumento]),

      drawer: const BarraLateral(), //Barra lateral

      body:
        Stack(  //Stack para interponer widgets
          children: [ //un array de widgets
            /*Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(urlImages[indexMonumento]),
                  fit: BoxFit.cover, 
                  //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop)
                )
              ),
            ),
            BackdropFilter( //Hacer borrosa la imagen de fondo
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),*/
            Row(    //un renglon para poner el primer texto
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: const Text(
                    'Una vision al mundo',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0, color: Colors.brown),
                  ),
                )
              ],
            ),
            Column( //Una columna con un renglon para poder alinear el nombre del monumento
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 90.0),
                      //decoration: const BoxDecoration(color: Colors.blue),
                      child: Text(titulosMonumentos[indexMonumento], style: const TextStyle(fontFamily: '', fontSize: 20.0, color: Colors.black),),
                    ),
                  ],
                ),
              ],
            ),
            Column(     //La columna para posicionar el carouselSlider
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //const SizedBox(height: 12), // Caja para separar
                CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex){
                      final urlImage = urlImages[index];
                      return BuildImageWidget(urlImage: urlImage, index: index);  //Llamamos al widget para crear la imagen
                    },
                    options: CarouselOptions(
                      height: 400,
                      onPageChanged: (index, reason) =>
                        setState(()=>indexMonumento = index),
                    ),
                  ),
                const SizedBox(height: 12), // Caja para separar
                BuildIndicator(indexMonumento: indexMonumento, urlImages: urlImages), // Llamamos al widget indicador visual de la posición de la imagen
              ]
            ),
            Column(   //Columna para poner el texto de la descripcion
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 80.0),
                      child: Text(descripcionMonumentos[indexMonumento]),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      
    );
  }
}

