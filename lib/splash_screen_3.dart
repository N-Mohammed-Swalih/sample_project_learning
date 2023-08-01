import 'dart:async';
import 'package:flutter/material.dart';
import 'package:luminar_sample_project/stateful_login.dart';
import 'login_page.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
));

class SplashScreen extends StatefulWidget {
  // splash is initially immutable
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState(); //createState() will creating a mutable(that can occur changes)state for splashscreen
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //what will happen when the page / app is  first launched
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
             Login2())); //when timer completes it redirects to home
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //BuildContext would fetch and monitor the positon and animation of the widgets
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("assets/icons/blockchain1.png",
        color: Colors.white,),
      ),
    );
  }
}
