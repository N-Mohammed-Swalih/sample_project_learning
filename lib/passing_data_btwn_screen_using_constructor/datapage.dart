import 'package:flutter/material.dart';
import 'package:luminar_sample_project/passing_data_btwn_screen_using_constructor/tostateful_page.dart';
import 'package:luminar_sample_project/passing_data_btwn_screen_using_constructor/tostateless_page.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: DataPage()));
}

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('passing data between the screen using user constructor'),
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StatelessPage(
                        name: 'Luminar',
                        location: "Kakkanad",
                        Contact: "9876543201",
                        color: Colors.purple,
                      ))),
              child: Text('To Stateless page'),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StatefulPage(
                        name: 'Luminar',
                        location: "Kakkanad",
                        Contact: "9876543201",
                        color: Colors.black,
                      ))),
              child: Text('To Stateful page'),
            ),
          ]),
        ),
      ),
    );
  }
}
