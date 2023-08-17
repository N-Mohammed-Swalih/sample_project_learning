import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luminar_sample_project/passing_data_between_screens/dummy_data.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  const ProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Shop Here!',
            style: GoogleFonts.bigelowRules(
              color: Colors.pinkAccent,
              fontSize: 36,
            )),
        centerTitle: true,
      ),
      body: ListView(
        children: productslist
            .map((iteratedproducts) => Card(
              color: Color.fromARGB(255, 255, 239, 238),
                    child: ListTile(
                  leading: Container(
                    height: 100,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(iteratedproducts["image"])))),
                  title: Text(iteratedproducts['name']),
                  subtitle: Text(iteratedproducts["description"]),
                  trailing: Text(iteratedproducts["price"]),
                )))
            .toList(),
      ),
    );
  }
}
