import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: Steaggerdgridexample(),
  ));
}

class Steaggerdgridexample extends StatelessWidget {
  const Steaggerdgridexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("staggered"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Container(
                color: Colors.orange,
                child: Center(
                  child: Icon(Icons.home),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 4,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Icon(Icons.cabin),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 3,
              child: Container(
                color: Colors.yellow,
                child: Center(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Icon(Icons.dangerous),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Container(
                color: Colors.pink,
                child: Center(
                  child: Icon(Icons.favorite),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 3,
              child: Container(
                color: Colors.greenAccent,
                child: Center(
                  child: Icon(Icons.message),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 3,
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Icon(Icons.face),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Container(
                color: Colors.indigo,
                child: Center(
                  child: Icon(Icons.face),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}