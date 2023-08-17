import 'package:flutter/material.dart';
import 'package:luminar_sample_project/passing_data_between_screens/dummy_data.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
        //to collect/recieve values from previous page
    final iteratedproductId = ModalRoute.of(context)?.settings.arguments;  
    //fetch all the values from previous page/route
   final iteratedproductFromlist = productslist.firstWhere((element)=> element['id'] == iteratedproductId);
    return Scaffold(
      appBar: AppBar(
        title: Text(iteratedproductFromlist['name']),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(iteratedproductFromlist['image']))
            ),
          ),
        ],
      ),
    );
  }
}