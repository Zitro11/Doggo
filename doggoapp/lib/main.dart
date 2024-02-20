import 'package:flutter/material.dart';

void main(){
  runApp(const DoggoApp());
}

class DoggoApp extends StatelessWidget {
  const DoggoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Doggo",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();//Es para acceder al estado del Scaffold desde cualquier parte de la app

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: 180,
                height: 180,
                color: Colors.brown.shade200,
                child: Stack(
                  children: <Widget>[
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
                      children: <Widget>[
                        Padding(
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
                        const SizedBox(height: 10),
                        const Text(
                          "Monumento 1",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
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
                    const Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                    ),
                    const Positioned(
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
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Image.network("https://i.pinimg.com/originals/ec/4f/37/ec4f3747460ff10af3ef47a67aa0472b.jpg"),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Image.network("https://elmanana.com.mx/u/fotografias/m/2022/3/8/f608x342-83798_113521_0.jpg"),
            ),
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
    );
  }
}