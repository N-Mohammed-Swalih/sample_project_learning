import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
void main(){
  runApp(const MaterialApp(
    home: AnimLotti(),
  ));
}
class AnimLotti extends StatelessWidget {
  const AnimLotti({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animations/nike.json",),
      ),
    );
  }
}