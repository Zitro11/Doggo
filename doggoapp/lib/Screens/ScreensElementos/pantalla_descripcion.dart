import 'package:flutter/material.dart';

//Widgets pantallas
import 'package:doggoapp/main.dart'; //para volver al main
import 'package:doggoapp/Screens/pantalla_mapa.dart'; //para mandar al mapa
import 'package:doggoapp/Widgets/Inicio/datos.dart';  //para traer los datos
import 'package:doggoapp/Widgets/Elementos/descripcion.dart'; //traer imagenes

class ScreenDescripcion extends StatefulWidget {
  const ScreenDescripcion({super.key});

  @override
  State<ScreenDescripcion> createState() => _ScreenDescripcionState();
}

class _ScreenDescripcionState extends State<ScreenDescripcion> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 350,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage('https://www.enroma.com/wp-content/uploads/elementor/thumbs/Coliseo-Romano-p9hfybrrriyw7zyeoat3i5xq91dbuq09smp8uhsmrk.jpg'),
                      fit: BoxFit.cover,
                    )),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //Get.offAll(HomeScreen());
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Main()));
                                },
                                child: Container( //Container para la flecha de regreso a Home
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset: Offset(
                                            4,
                                            8,
                                          ), // Shadow position
                                        ),
                                      ]),
                                  child: const Icon(
                                      Icons.arrow_back_ios_new_outlined),
                                ),
                              ),
                              Container(  //Container posible para RA
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 4,
                                        offset: Offset(
                                          4,
                                          8,
                                        ), // Shadow position
                                      ),
                                    ]),
                                child: const Icon(
                                  Icons.add_to_queue_rounded,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 330),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF4F5F9),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 17, right: 17, top: 29),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Titulo',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    Text('4.5')
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "Lahore is the second most populous city in Pakistan after Karachi and 26th most populous city in the world, with a population of over 13 million. It is situated in north-east of the country close to the International border with India. It is the capital of the province of Punjab where it is the largest city.",
                                    style: TextStyle(
                                      color: Color(0xff868889),
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 150.0,
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: imagesList.length,
                                itemBuilder: (BuildContext context, int index) =>
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage(imagesList[index]),
                                              fit: BoxFit.cover,
                                            )
                                          ),
                                        child: Column(
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.image_search,
                                                  color: Color.fromARGB(255, 63, 62, 62),
                                                ),
                                              ],
                                            ),
                                            /*const Spacer(),
                                            Row( //Texto al pie de la imagen
                                              children: [
                                                Text(
                                                  CityList[index],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            )*/
                                          ],
                                        )
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PantallaMapa(),
                                      ),
                                    );
                                  },
                                    child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset: Offset(
                                            4,
                                            8,
                                          ), // Shadow position
                                        ),
                                      ],
                                    ),
                                      child: const Icon(Icons.map),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.redAccent,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 4,
                                              offset: Offset(
                                                4,
                                                8,
                                              ), // Shadow position
                                            ),
                                          ]),
                                      child: const Center(
                                          child: Text(
                                        "Accion",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))



              ],
            )
          ],
        ),
      ),

    );
  }
}