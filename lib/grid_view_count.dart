import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: GridViewCount(),
  ));
}

class GridViewCount extends StatelessWidget {
  const GridViewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Grid View Count",
          style: GoogleFonts.bigelowRules(
            fontSize: 50,
          ),
        ),
      ),
      body: GridView.count(crossAxisCount: 3,
      children: List.generate(
            60,
            (index) => Card(
            color: Colors.teal,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Add a Photo",
                    style: GoogleFonts.bigelowRules(fontSize: 20),
                  ),
                ),
                Icon(Icons.add_a_photo),
              ],
            )
          )
      )
      )
      );
  }
}
