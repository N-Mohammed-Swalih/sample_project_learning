import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
 StatefulPage({super.key, required this.name, required this.location, required this.Contact , required this.color});

  String name;
  String location;
  String Contact;
  Color color;

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Page"),
      ),
      body: Center(
        child: Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: widget.color),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
               widget.name,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                widget.location,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                widget.Contact,
                style: TextStyle(fontSize: 15, color: Colors.white),
              )
            ]),
        ),
      ),


    );
  }
}