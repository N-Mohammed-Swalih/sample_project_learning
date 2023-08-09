import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridViewCustom(),
  ));
}

class GridViewCustom extends StatelessWidget {
  const GridViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Grid Custom"),
      ),
      body: GridView.custom(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          childrenDelegate: SliverChildListDelegate(List.generate(
              12,
              (index) => Center(
                    child: Column(children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1658538363111-523c8bc435ed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=347&q=80"),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Text("Item 1"),
                      Text("\$250"),
                    ]),
                  )))),
    );
  }
}
