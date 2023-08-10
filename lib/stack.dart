import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StackWidget(),
  ));
}

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        body: Stack(children: [
          Positioned(
            left: 50,
            top: 10,
            child: Container(
              height: 250,
              width: 400,
              color: Colors.teal,
              child: Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
           Positioned(
            left: 100,
            top: 75,
             child: Container(
              height: 120,
              width: 300,
              color: Colors.red,
              child: Text(
                "How Are you?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
                     ),
           ),
        ]));
  }
}
