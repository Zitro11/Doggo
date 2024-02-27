import 'package:flutter/material.dart';
import 'package:doggoapp/Screens/screen02.dart'; //Pagina 2


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  //Para el drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();//Es para acceder al estado del Scaffold desde cualquier parte de la app

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

      backgroundColor: Colors.brown.shade400,
      
      body:
        ListView (  //Listview
          children: <Widget>[   //Tiene un hijo que es un arreglo de widgets

            Container(          //Container 1
              padding: const EdgeInsets.all(30.0),
              child: 
              Container(        //Container interior para manipular en tama;o mas peque;o
                width: 180,
                height: 180,
                color: Colors.brown.shade200,
                child: Stack(     //Ese container tiene un stack para agregar cosas encima al gusto
                  children: <Widget>[ //que a su vez tiene un arreglo de widgets 
                    Column( //Columna para alinear imagen y texto
                      children: <Widget>[
                        Padding(    //Imagen
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                                child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/b/b7/Monumento_Fundadores_Nuevo_Laredo.jpg",
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Padding(    //Texto del monumento
                          padding:  EdgeInsets.only(top: 10),
                          child: Text(
                            "Monumento 1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 177, 134, 6)
                            ),
                          )
                        ),
                      ],
                    ),
                    const Positioned( //Texto abajo a la derecha
                      bottom: 8.0,
                      right: 8.0,
                      child: Text(
                        "Nvo. Laredo",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Positioned( //Icono superior derecha
                      top: 8.0,
                      right: 8.0,
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                    ),
                    const Positioned( //Icono superior izquierda
                      top: 8.0,
                      left: 8.0,
                      child: Icon(
                        Icons.remove,
                        color: Colors.red,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(    //Container 2
              padding: const EdgeInsets.all(20.0),
              child: Image.network("https://i.pinimg.com/originals/ec/4f/37/ec4f3747460ff10af3ef47a67aa0472b.jpg"),
            ),

            Container(    //Container 3
              padding: const EdgeInsets.all(20.0),
              child: Image.network("https://elmanana.com.mx/u/fotografias/m/2022/3/8/f608x342-83798_113521_0.jpg"),
            ),

            Container(    //Container 4 Boton
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Mapa()));
                },
                style: (ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 4, 91, 117),
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                )),
                child: const Text(
                  "Mapa",
                  style: TextStyle(fontSize: 15)
                ),
              ),
            )

          ],
        ),

        drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown.shade200,
              ),
              child: const Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () {
                // Implementa la funcionalidad de la opción 1
              },
            ),
            ListTile(
              title: const Text('Opción 2'),
              onTap: () {
                // Implementa la funcionalidad de la opción 2
              },
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa')
      ]),


    );
  }
}