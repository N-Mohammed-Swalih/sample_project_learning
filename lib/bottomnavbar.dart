import 'package:flutter/material.dart';

import 'Expanded.dart';
import 'grid_view.dart';
import 'grid_view_count.dart';
import 'listview.dart';
void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home : BottomNavBar(),
  ));
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int index  =0;
dynamic screens = [
  ListView1(),
const GridViewCount(),
ExpandedWidget(),
GridView1(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Nav Bar')
      ),
      bottomNavigationBar: BottomNavigationBar(
      //  backgroundColor: Colors.yellow,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (tappedindex){
           setState(() {
          index = tappedindex;
        });},
        items: 
      [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.home),
          label:'Home'
          ) ,
           BottomNavigationBarItem(
              backgroundColor: Colors.black,
          icon: Icon(Icons.search),
          label:'Search'
          ) ,
           BottomNavigationBarItem(
              backgroundColor: Colors.black,
          icon: Icon(Icons.video_library_outlined),
          label:'Reels'
          ) ,
           BottomNavigationBarItem(
              backgroundColor: Colors.black,
          icon: Icon(Icons.person),
          label:'Profile'
          ) ,
      ]),
      body:Center(
        child: screens[index],
    ));
  }
}