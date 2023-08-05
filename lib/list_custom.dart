import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(const MaterialApp(
    home:  ListViewCustom(),
  ));
}

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Custom'),
      ),
      body  : ListView.custom(
        childrenDelegate: SliverChildListDelegate(
 //[]
  List.generate(10, (index) => Card(
    child: Text("Shibili vazha",
    style: GoogleFonts.bigelowRules(
      color: Colors.grey,
      fontSize: 30,
    ),)))
 ),
      
      ),
    );
  }
}