import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luminar_sample_project/Api%20Integration/Api%20Integration%20using%20http/Controller/product_controller.dart';
import 'package:luminar_sample_project/passing_data_between_screens/dummy_data.dart';
import 'Home/Widgets/product_tile.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  ProductHome({super.key});
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: SizedBox(
        child: Obx(() {
          //obx is to make the widgets observable
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              itemCount: productslist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 400,
                ),
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                });
          }
        }),
      ),
    );
  }
}
