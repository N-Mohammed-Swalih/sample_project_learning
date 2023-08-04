import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView1(),
  ));
}

class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(
            "Shibili Chaya Kada",
            style: GoogleFonts.bigelowRules(
              fontSize: 50,
            ),
          ),
        ),
        body: ListView(children: [
          Center(
              child: Text(
            "Coffee Shop!",
            style: GoogleFonts.bigelowRules(
              color: Colors.brown[500],
              fontSize: 50,
            ),
          )),
          Card(
            color: Colors.brown[300],
            child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg",
              )),
              title: Text("Cappuccino"),
              subtitle: Text("Price : \$299"),
              trailing: Icon(Icons.shopping_cart),
            ),
          ),
          Card(
            color: Colors.brown[300],
            child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/c/c6/Latte_art_3.jpg")),
              title: Text("Latte"),
              subtitle: Text("Price : \$199"),
              trailing: Icon(Icons.shopping_cart),
            ),
          ),
          Card(
            color: Colors.brown[300],
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
              ),
              title: Text("Mocha Cookie Crumble Latte"),
              subtitle: Text("Price : \$249"),
              trailing: Icon(Icons.shopping_cart),
            ),
          ),
          Card(
            color: Colors.brown[300],
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/a/a5/Tazzina_di_caff%C3%A8_a_Ventimiglia.jpg"),
              ),
              title: Text("Espresso"),
              subtitle: Text("Price : \$299"),
              trailing: Icon(Icons.shopping_cart),
            ),
          ),
          Card(
            color: Colors.brown[300],
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1517958911667-09c05f6cd698?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=388&q=80",
                ),
              ),
              title: Text("Caramel Hot Chocolate Delight"),
              subtitle: Text("Price : \$149"),
              trailing: Icon(Icons.shopping_cart),
            ),
          ),
          
        ]));
  }
}
