import 'package:flutter/material.dart';

class SplashTwo extends StatelessWidget {
  const SplashTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   Colors.red,
          //   Colors.white,
          //   Colors.yellow
          //   ])
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.jpg"))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: [
         Image.asset("assets/icons/blockchain1.png",
         color: Colors.white,
         height: 120,
         ),
            Text("Chain connect",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                )),
          ]),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashTwo(),
  ));
}
