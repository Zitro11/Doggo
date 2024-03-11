import 'package:flutter/material.dart';
//import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';  //Carruel
import 'package:flutter/animation.dart';  //Animaciones

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
                                                              //Para la animacion
class _PantallaInicioState extends State<PantallaInicio> with TickerProviderStateMixin {
  //Para el drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();//Es para acceder al estado del Scaffold desde cualquier parte de la app

  int indexMonumento = 0; //Identificar el monumento/imagen
  int longitudElementos = elementos.length; //longitud de la lista de objetos

  //variables para la animacion
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
    void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Duración de la animación (500 milisegundos)
    );
    _animation = Tween<double>(begin: 1.0, end: 0.6).animate(_animationController); // Tween para la animación
  }
  //Animacion

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
        SingleChildScrollView(  //Widget que permite dezplasar la pantalla cuando no cabe todo
          child:
            Column(
              children: [
                Stack(  //Stack para interponer widgets
                  children: [ //un array de widgets

                Row(    //un renglon para poner el primer texto
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //height: 40,
                      margin: const EdgeInsets.all(12.0),
                      child: const Text(
                        'Una vision al mundo...',
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
                          margin: const EdgeInsets.only(top: 80.0),
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
                    const SizedBox(height: 120), // Caja para separar
                    CarouselSlider.builder(
                        itemCount: elementos.length,  //le decimos la longitud con la cantidad de objetos
                        itemBuilder: (context, index, realIndex){
                          final urlImage = elementos[index].urlImage;   //le especificamos la imagen que se la trae dependiendo el index
                          return GestureDetector(
                            onTap: () {
                              _animationController.forward().then((_) {
                                // Detener la animación justo antes de navegar a la nueva pantalla
                                _animationController.stop();

                                // Esperar un breve momento antes de navegar
                                Future.delayed(const Duration(milliseconds: 500), () {
                                  // Navegar a la siguiente pantalla después de que la animación haya terminado
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => elementos[indexMonumento].screen),
                                  );
                                  
                                });
                                // Reiniciar la animación para la próxima vez
                                  _animationController.reset();
                              });
                            },
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _animation.value,
                                  child: BuildImageWidget(urlImage: urlImage, index: index),
                                );
                              },
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 380,
                          onPageChanged: (index, reason) =>
                            setState(()=>indexMonumento = index),
                        ),
                      ),
                    const SizedBox(height: 12), // Caja para separar                                    // Llamamos al widget indicador visual de la posición de la imagen
                    BuildIndicator(indexMonumento: indexMonumento, urlImagesLength: longitudElementos), //Le mandamos el index para q sepa en cual esta y el tama;o para la cantidad
                  ]
                ),
                Column(
                  children: [    //Texto de abajo (descripcion)
                    const SizedBox(height: 550),
                    Container(
                    
                    //color: Colors.blue.withOpacity(0.5), // Fondo semitransparente
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),  //separacion del texto con respecto a las orillas
                    margin: const EdgeInsets.only(bottom: 10.0),   //separacion del container de abajo
                    constraints: const BoxConstraints(maxHeight: 130),
                     // Altura máxima del contenedor
                    child: SingleChildScrollView(
                      child: Text(
                        elementos[indexMonumento].descripcion,  //le damos la descripcion del objeto seleccionado
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                    ),
                  ),
                  ],
                ),
              ],
            ),
              ]
            )
        ),
    );
  }
}

