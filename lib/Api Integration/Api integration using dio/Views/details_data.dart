import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luminar_sample_project/Api%20Integration/Api%20integration%20using%20dio/Controller/data_controller.dart';

class DetailData extends StatelessWidget {
  int index;
  DetailData({required this.index});

  DataController controller = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detailed data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.datas[index].id.toString(),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(controller.datas[index].title.toString(),
            style: TextStyle(
              fontSize: 20,
            ),),
            Text(controller.datas[index].body.toString()),
          ],
        ),
      ),
    );
  }
}
