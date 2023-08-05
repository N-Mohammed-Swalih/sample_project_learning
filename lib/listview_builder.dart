import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: ListViewBuilder(),
  ));
}



class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.teal,
      title: Text('ListView Builder'),
    ),
    body: Center(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index)  {
        return Card(
          child: ListTile(
            tileColor: Colors.teal[100],
            title: Text("Product Name : "),
            subtitle: Text("Price : \$500"),
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/100"),
              radius: 35,
              backgroundColor: Colors.transparent,
            ),
          ),
        );
      } 

      ),
    ),
    );
  }
}