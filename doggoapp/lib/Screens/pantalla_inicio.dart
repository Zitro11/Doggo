import 'package:flutter/material.dart';
//import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';  //Carruel

//Widgets
import 'package:doggoapp/Widgets/drawer.dart';
import 'package:doggoapp/Widgets/Inicio/build_image.dart';  //Constructor de los elementos
import 'package:doggoapp/Widgets/Inicio/build_indicator.dart';  //construtor del indicador
import 'package:doggoapp/Widgets/Inicio/datos.dart';  //datos de cada elemento



class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  //Para el drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();//Es para acceder al estado del Scaffold desde cualquier parte de la app

  int indexMonumento = 0; //Identificar el monumento/imagen
  int longitudElementos = elementos.length;

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
                      //decoration: const BoxDecoration(color: Colors.blue),  //llamamos del objeto el titulo dependiendo la posicion en el array con el index
                      child: Text(elementos[indexMonumento].titulo, style: const TextStyle(fontFamily: '', fontSize: 20.0, color: Colors.black),),
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
                    itemCount: elementos.length,  //le decimos la longitud con la cantidad de objetos
                    itemBuilder: (context, index, realIndex){
                      final urlImage = elementos[index].urlImage;   //le especificamos la imagen que se la trae dependiendo el index
                      return GestureDetector(   //Detector de gestos
                        onTap: (){    //detectamos el gesto tap
                          Navigator.push( //Hacemos la navegacion
                            context,
                            MaterialPageRoute(builder: (context) => elementos[indexMonumento].screen) //le damos de la lista, la posicion del objeto y la propiedad pantalla
                          );
                          print('elemento $indexMonumento presionado');
                        },
                        child: BuildImageWidget(urlImage: urlImage, index: index), //Llamamos al widget para crear la imagen
                      );
                    },
                    options: CarouselOptions(
                      height: 400,
                      onPageChanged: (index, reason) =>
                        setState(()=>indexMonumento = index),
                    ),
                  ),
                const SizedBox(height: 12), // Caja para separar                                    // Llamamos al widget indicador visual de la posición de la imagen
                BuildIndicator(indexMonumento: indexMonumento, urlImagesLength: longitudElementos), //Le mandamos el index para q sepa en cual esta y el tama;o para la cantidad
              ]
            ),
            Align(    //Texto de abajo (descripcion)
              alignment: Alignment.bottomCenter,
              child: Container(
                //color: Colors.blue.withOpacity(0.5), // Fondo semitransparente
                padding: const EdgeInsets.symmetric(horizontal: 30.0),  //separacion del texto con respecto a las orillas
                margin: const EdgeInsets.only(bottom: 2.0),   //separacion del container de abajo
                constraints: const BoxConstraints(maxHeight: 130), // Altura máxima del contenedor
                child: SingleChildScrollView(
                  child: Text(
                    elementos[indexMonumento].descripcion,  //le damos la descripcion del objeto seleccionado
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }
}

