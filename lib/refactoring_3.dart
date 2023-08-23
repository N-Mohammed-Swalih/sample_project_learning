import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Refractoring3(),
  ));
}

class Refractoring3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Refactoring 3"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return MyRefractoringWidget(
              rimage: Image.network(
                "https://images.unsplash.com/photo-1631143070457-c1aecc92abbc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                fit: BoxFit.fill,
              ),
            );
          }),
    );
  }
}

class MyRefractoringWidget extends StatelessWidget {
  final Color? bgcolor;
  final Image? rimage;
  VoidCallback? onClick;
  Widget? label;
  Widget? ricon;

  MyRefractoringWidget(
      {this.bgcolor,
      required this.rimage,
      this.label,
      this.onClick,
      this.ricon});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgcolor,
      child: ListTile(
        title: label,
        leading: rimage,
        onTap: onClick,
        trailing: ricon,
      ),
    );
  }
}
