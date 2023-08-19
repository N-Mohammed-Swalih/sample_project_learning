import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home : DataPage()
  ));
}

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('passing data between the screen using user constructor'),
      ),
      body: Container(
        height: 250,
        width: 200,
        child: Column(children: [
          ElevatedButton(
            onPressed: () => () {},
            child: Text('To Stateless page'),
          ),
          ElevatedButton(
            onPressed: () => () {
              
            },
            child: Text('To Stateless page'),
          ),
        ]),
      ),
    );
  }
}
