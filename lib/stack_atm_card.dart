import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StackAtm(),
  ));
}

class StackAtm extends StatelessWidget {
  const StackAtm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Stack(children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal,
            ),
            height: 250,
            width: 400,
          ),
        ),
        Positioned(
          top: 300,
          left: 100,
          child: Row(
            children: [
              Positioned(
                top: 300,
                left: 85,
                child: Image.asset(
                  "assets/images/atmchip.jpg",
                  height: 36,
                  width: 36,
                ),
              ),
              Transform.rotate(
                angle: 90 * pi / 4,
                child: Positioned(
                    top: 150,
                    left: 50,
                    child: Icon(
                      Icons.wifi,
                      color: Colors.white24,
                      size: 40,
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: 340,
          top: 370,
          child: Image.asset(
            "assets/images/visa.png",
            height: 100,
            width: 100,
          ),
        ),
        Positioned(
          top: 410,
          left: 70,
          child: Text(
            "N Mohammed Swalih",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
