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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doggo"),
        backgroundColor: Colors.brown.shade100,
      ),
      body: 
      ListView (
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Image.network("https://cdn.eldestapeweb.com/eldestape/052022/1653754014410.jpg?cw=1200&ch=675"),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_FpnqxsXgJFKH9WQVI-FpzOA2KR5GilGMgg&usqp=CAU"),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Image.network("https://es.rollingstone.com/wp-content/uploads/2022/08/Tiago-PZK-se-abre-a-un-mundo-de-posibilidades-con-Portales.jpg"),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Image.network("https://blog.ticketmaster.es/wp-content/uploads/2023/03/mejores-canciones-de-Emilia-1-1-738x415.jpeg"),
          ),
          
        ],
      ),
    );
  }
}