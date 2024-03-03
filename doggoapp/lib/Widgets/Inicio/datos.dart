//Arreglos para los datos de cada elemento

//Final: Palabra reservada que hace referencia a que ese valor no va a cambiar

//aqui las relaconamos en que cada dato del elemento esta en la misma posicion en todos los arrays

import 'package:doggoapp/Screens/ScreensElementos/elemento1.dart';
import 'package:doggoapp/Screens/ScreensElementos/elemento2.dart';
import 'package:doggoapp/Screens/ScreensElementos/elemento3.dart';
import 'package:doggoapp/Screens/ScreensElementos/elemento4.dart';
import 'package:doggoapp/Screens/ScreensElementos/elemento5.dart';
import 'package:flutter/material.dart';


class Elemento {  //Definimos la clase
  final String urlImage;    //El final es para que una vez que se asigne el valor, no cambie (inmutablee)
  final String titulo;
  final String descripcion;
  final Widget screen;

  const Elemento({  //Creamos el contructor
    required this.urlImage,   //required hace que los parametros son olbigatorios para crear la instancia
    required this.titulo,
    required this.descripcion,
    required this.screen,
  });

}

//Creamos una lista llamada elementos
final List<Elemento> elementos = [    //cada elemento de esta lista, es un objeto, una instancia creada de mi clase
  const Elemento(
    urlImage: 'https://www.infobae.com/new-resizer/JCs2kAWl8JJTof38sUHrj7jHKBc=/992x744/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170301/monumentos-mas-famosos-del-mundo-9.jpg',
    titulo: 'Coliseo Romano',
    descripcion: 'Lorem ipsum dolor sit amet consectetur adipiscing elit condimentum, augue vitae diam ridiculus ad in pulvinar dui habitasse, imperdiet vestibulum praesent semper vulputate fusce facilisi. Eu neque suspendisse viverra pharetra tellus sodales ullamcorper aenean nisi, id faucibus erat enim semper platea interdum tristique, eget metus sociosqu duis tincidunt fames porta aliquet. ',
    screen: Elemento1(),
  ),
  const Elemento(
    urlImage: 'https://www.infobae.com/new-resizer/1Wphr5DmlXFEwJcZEMUEcUEHGMs=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170254/monumentos-mas-famosos-del-mundo-7.jpg',
    titulo: 'Pirámides de Giza',
    descripcion: 'Pirámides de Giza (Egipto)',
    screen: Elemento2(),
  ),
  const Elemento(
    urlImage: 'https://www.infobae.com/new-resizer/Xu8r72M2iXVhmAndzq81E_KrAII=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170326/monumentos-mas-famosos-del-mundo-15.jpg',
    titulo: 'Chichen Itza',
    descripcion: 'Chichén Itzá (México)',
    screen: Elemento3(),
  ),
  const Elemento(
    urlImage: 'https://www.infobae.com/new-resizer/YJMsxGe-c__KFI2YApXBZcFqwPA=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170345/monumentos-mas-famosos-del-mundo-21.jpg',
    titulo: 'Machu Picchu',
    descripcion: 'Machu Picchu (Perú)',
    screen: Elemento4(),
  ),
  const Elemento(
    urlImage: 'https://www.infobae.com/new-resizer/gK4YQlUzAxZxDzLXCJDanCJf0pc=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170417/monumentos-mas-famosos-del-mundo-26.jpg',
    titulo: 'Cataratas del Niágara',
    descripcion: 'Cataratas del Niágara (Canadá)',
    screen: Elemento5(),
  ),
];




/*final List<String> urlImages = [   //Imagenes Swider
    'https://www.infobae.com/new-resizer/JCs2kAWl8JJTof38sUHrj7jHKBc=/992x744/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170301/monumentos-mas-famosos-del-mundo-9.jpg',
    'https://www.infobae.com/new-resizer/1Wphr5DmlXFEwJcZEMUEcUEHGMs=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170254/monumentos-mas-famosos-del-mundo-7.jpg',
    'https://www.infobae.com/new-resizer/Xu8r72M2iXVhmAndzq81E_KrAII=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170326/monumentos-mas-famosos-del-mundo-15.jpg',
    'https://www.infobae.com/new-resizer/YJMsxGe-c__KFI2YApXBZcFqwPA=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170345/monumentos-mas-famosos-del-mundo-21.jpg',
    'https://www.infobae.com/new-resizer/gK4YQlUzAxZxDzLXCJDanCJf0pc=/992x661/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/18170417/monumentos-mas-famosos-del-mundo-26.jpg',
  ];

  final List<String> titulosMonumentos = [  //Titulos de cada uno
    'Coliseo Romano',
    'Pramides de Giza',
    'Chichen Itza',
    'Machu Picchu',
    'Cataratas del Niagara'
  ];

  final List<String> descripcionMonumentos = [    //Descripcion corta de cada una
    'Lorem ipsum dolor sit amet consectetur adipiscing elit condimentum, augue vitae diam ridiculus ad in pulvinar dui habitasse, imperdiet vestibulum praesent semper vulputate fusce facilisi. Eu neque suspendisse viverra pharetra tellus sodales ullamcorper aenean nisi, id faucibus erat enim semper platea interdum tristique, eget metus sociosqu duis tincidunt fames porta aliquet. ',
    'Pirámides de Giza (Egipto)',
    'Chichén Itzá (México)',
    'Machu Picchu (Perú)',
    'Cataratas del Niágara (Canadá)'
  ];

  final screensElementos = [  //Pantallas de cada elemento
    const Elemento1(),
    const Elemento2(),
    const Elemento3(),
    const Elemento4(),
    const Elemento5(),
  ];*/