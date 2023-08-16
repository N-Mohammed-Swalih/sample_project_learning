import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Sliverexample(),
  ));
}

class Sliverexample extends StatelessWidget {
  const Sliverexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.green,
              floating: true,
              pinned: false,
              title: Text("sliver example"),
              bottom: AppBar(
                elevation: 0,
                backgroundColor: Colors.green,
                title: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "search here",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.camera_alt),
                    ),
                  ),
                ),
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) => Container(
            //       height: 50,
            //       decoration: BoxDecoration(
            //         // color: Colors.indigo,
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //       child: Text("data $index"),
            //     ),
            //   ),
            // ),
            SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  color: Colors.yellow,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      // color: Colors.indigo,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text(
                      " $index",
                      style: GoogleFonts.satisfy(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}