import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: GridViewBuilder1(),
  ));
}

class GridViewBuilder1 extends StatelessWidget {
  const GridViewBuilder1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Grid View Builder",
          style: GoogleFonts.bigelowRules(
            fontSize: 50,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: ((context, index) {
          return Card(
            color: Colors.orange,
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
            ),
          );
        }),
      ),
    );
  }
}
