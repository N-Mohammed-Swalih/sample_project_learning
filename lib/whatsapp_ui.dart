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
    "Dad",
    "Mom",
    "Sahal",
    "Sana",
    "Loolan Nisham",
    "Loolan Anas",
    "Brazil Kottaram",
    "Fasal",
    "Shuhaib"
    "Aliyan",
    "Shibili"
  ];
  var images = [
    "https://contents.mediadecathlon.com/p2228143/94732b959354b247071e4387b3732ff1/p2228143.jpg",
    "https://www.gray-nicolls.co.uk/cdn/shop/products/CDBK15Ball_20Velocity_20Ball_20Red_1500x.jpg?v=1689163173",
    "https://5.imimg.com/data5/SELLER/Default/2022/9/SJ/IM/LL/2457433/light-weight-tennis-ball.jpg",
    "https://5.imimg.com/data5/JO/HL/MY-33538270/cricket-rubber-ball-500x500.jpg",
    "https://rukminim2.flixcart.com/image/850/1000/xif0q/ball/8/u/7/430-454-black-white-5-22-1-278-n-football-nivia-original-imaghazbngfcrbzg.jpeg?q=20",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZurJnNglFbCxBMTzCeYQJI_V-vfEcuuHxuA&usqp=CAU",
    "https://5.imimg.com/data5/SELLER/Default/2022/3/KV/PE/PD/38255385/yonex-nanoray-light-18i-graphite-badminton-racquet-77g-30-lbs-tension--500x500.jpg",
  ];
  var messages = ["hello","hey","evden"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Whatsapp",
            style: GoogleFonts.roboto(
              fontSize: 20,
            ),),

          actions: [
            Icon(Icons.camera_alt),
            SizedBox(width: 25,),
            Icon(Icons.search),
            SizedBox(width: 10,),
            PopupMenuButton(itemBuilder: (context){
              return [
                PopupMenuItem(child: Text("New Groups")),
                PopupMenuItem(child: Text("New Broadcast")),
                PopupMenuItem(child: Text("New Contact")),
                PopupMenuItem(child: Text("New Community")),
              ];
            } )
          ],
          backgroundColor: Colors.teal,
        ),
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
