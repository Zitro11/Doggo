import 'package:flutter/material.dart';
//import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//Widgets
import 'package:doggoapp/Widgets/drawer.dart';



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

      //backgroundColor: Colors.brown.shade400,

      drawer: const BarraLateral(), //Barra lateral

      body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                itemCount: urlImages.length,    //se define la cantidad de elementos (array)
                itemBuilder: (context, index, realIndex){ //Contexto actual de la app || Indice del elemento que se esta construyendo || Indice real del elemento en la lista
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                  height: 400,
                  onPageChanged: (index, reason) =>
                    setState(()=>indexMonumento = index)
                ),
              ),
              const SizedBox(height: 12),
              buildIndicator()
            ],
          ),
        )
      

    );
  }

  Widget buildImage(String urlImage, int index) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Image.network(urlImage, fit: BoxFit.cover),
    );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    effect: const ExpandingDotsEffect(
      dotWidth: 15,
      activeDotColor: Colors.blue
    ),
    activeIndex: indexMonumento,
    count: urlImages.length,
  );


}

