import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: GridViewExtent1(),
  ));
}

class GridViewExtent1 extends StatelessWidget {
  const GridViewExtent1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Grid View Extents",
          style: GoogleFonts.bigelowRules(
            fontSize: 50,
          ),
        ),
      ),
      body: GridView.extent(maxCrossAxisExtent: 250,
      children: List.generate(
            60,
            (index) => Card(
            color: Colors.yellow,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "View Photo",
                    style: GoogleFonts.bigelowRules(),
                  ),
                ),
                Icon(Icons.photo_album,
                size: 20,),
              ],
            )
          )
      )
      )
      );
  }
}
