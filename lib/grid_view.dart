import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: GridView1(),
  ));
}

class GridView1 extends StatelessWidget {
  const GridView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My Gridview",
        style: GoogleFonts.bigelowRules(
          fontSize: 50,
        ),),
      ),
      body: GridView(
        children: List.generate(
            60,
            (index) => Card(
              color: Colors.orange,
                  child: Center(
                    child: Icon(Icons.car_crash),
                  ),
                )),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
