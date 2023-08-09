import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp( MaterialApp(
    home: GridStaggered(),
  ));
}

class GridStaggered extends StatelessWidget {
   GridStaggered({super.key});

  dynamic crosscount = [1,2,3,2,4,2,3];
  dynamic maincount =[2,1,2,3,4,5,6,2,1];
  dynamic icons = [Icons.abc];
  dynamic colors = [
    Colors.red,
    Colors.green,
    Colors.accents,
    Colors.black38,
    Colors.blueAccent,
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Grid Staggered'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
               StaggeredGridTile.count(
                crossAxisCellCount: crosscount,
                mainAxisCellCount: maincount,
                child: Container(
                  color: colors,
                  child: Center(child: Icon(icons)),
                ),
              ),
            ],
          ),
        ));
  }
}
