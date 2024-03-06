import 'package:flutter/material.dart';
import 'package:doggoapp/main.dart';

class ScreenBienvenida extends StatelessWidget {
  const ScreenBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://static.vecteezy.com/system/resources/previews/030/317/761/non_2x/coastal-cairn-stones-arranged-in-a-seaside-pyramid-a-tranquil-and-natural-monument-vertical-mobile-wallpaper-ai-generated-free-photo.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 27, right: 20, bottom: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 96,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to\n",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 17,
                      ),
                      Flexible(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sed feugiat metus, placerat congue magna. Donec ornare dictum lectus, eu venenatis mauris malesuada ut. Vestibulum pharetra, eros eget vulputate auctor, mi quam laoreet libero, in iaculis tortor diam eget dui. Donec rutrum dolor nec pharetra porttitor.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Main()));
                        },
                        child: Container(
                          width: 70,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "POWERED BY",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "DOGGO",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );







  }
}