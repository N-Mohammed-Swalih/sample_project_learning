import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridviewWork(),
  ));
}

class GridviewWork extends StatelessWidget {
  GridviewWork({super.key});

  var icons = [
    Icons.home,
    Icons.alarm,
    Icons.camera,
    Icons.airplane_ticket,
    Icons.wifi,
    Icons.book,
    Icons.phone,
    Icons.email,
    Icons.map,
    Icons.hardware,
    Icons.voice_chat,
    Icons.add_card
  ];

  var colors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.blueGrey,
    Colors.purple,
    Colors.teal,
    Colors.yellow,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemCount: 12,
      padding: EdgeInsets.only(top: 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 50,
          mainAxisExtent: 100,
          mainAxisSpacing: 15),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: colors[index],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Icon(icons[index],
            size: 36,),
            SizedBox(
              width: 50,
            ),
            Text("Heart\nShaker",
            style: GoogleFonts.roboto(
              fontSize: 18,
            ),)
          ],
        ),
      ),
    ));
  }
}
