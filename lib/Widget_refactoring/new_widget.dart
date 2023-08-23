import 'package:flutter/material.dart';
class NewWidget extends StatelessWidget {
  final ImageProvider myimage;
  final String name;
  final String price;

  NewWidget({super.key, required this.myimage, required this.name,required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            fit: BoxFit.cover,
            image: myimage,
            width: MediaQuery.of(context).size.width,
            height: 150,
            
          ),
          Text(name),
          Text(price),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  label: Text("Wishlist")),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                  label: Text("Add to Cart"))
            ],
          )
        ],
      ),
    );
  }
}