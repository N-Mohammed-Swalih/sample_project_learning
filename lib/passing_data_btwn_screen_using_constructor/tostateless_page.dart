import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  StatelessPage(
      {super.key,
      required this.color,
      required this.Contact,
      required this.location,
      required this.name});

  String name;
  Color color;
  String location;
  String Contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Page'),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: color),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              name,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              location,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              Contact,
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
