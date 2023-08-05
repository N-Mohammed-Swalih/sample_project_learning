import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(const MaterialApp(
    home:  ListViewCustomSliverbuilder(),
  ));
}

class ListViewCustomSliverbuilder extends StatelessWidget {
  const ListViewCustomSliverbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Custom'),
      ),
      body  : ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 20,
          (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
        )) 
        ),
      ),
      )
    );
  }
}