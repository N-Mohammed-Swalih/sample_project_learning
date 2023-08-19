import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RiveAnim(),
  ));
}

class RiveAnim extends StatelessWidget {
  const RiveAnim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rive Animation'),
      ),
      body: Center(
        child: Container(
          height:450,
          width: 450,
          child: RiveAnimation.network("https://public.rive.app/community/runtime-files/4786-9652-eyes-following-cursor.riv"),
        ),
      ),
    );
  }
}