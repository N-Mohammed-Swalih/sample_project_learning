import 'package:flutter/material.dart';
import 'package:luminar_sample_project/splash2.dart';
import 'package:luminar_sample_project/splash_screen.dart';

void main() {
  //attach our widget tree to the ui
  runApp(const MaterialApp());//default theme of our app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
home : SplashTwo(),//initila page to be executed
    );
  }
}
