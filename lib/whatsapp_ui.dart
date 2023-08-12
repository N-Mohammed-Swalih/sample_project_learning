import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WhatsappChats(),
  ));
}

class WhatsappChats extends StatelessWidget {
  var productname = [
    "Bat",
    "Ball",
    "Tennis Ball",
  ];
  var images = [
    "https://contents.mediadecathlon.com/p2228143/94732b959354b247071e4387b3732ff1/p2228143.jpg",
    "https://www.gray-nicolls.co.uk/cdn/shop/products/CDBK15Ball_20Velocity_20Ball_20Red_1500x.jpg?v=1689163173",
    "https://5.imimg.com/data5/SELLER/Default/2022/9/SJ/IM/LL/2457433/light-weight-tennis-ball.jpg",
  ];
  var messages = ["hello","hey","evden"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: List.generate(
                3,
                (index) => Card(
                    child: ListTile(
                        title: Text(productname[index]),
                        subtitle: Text(messages[index]),
                        trailing: Text("12:05"),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(images[index]),
                        ))))));
  }
}
