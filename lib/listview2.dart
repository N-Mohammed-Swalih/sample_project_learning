import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView2(),
  ));
}

class ListView2 extends StatelessWidget {
  var productname = [
    "Bat",
    "Ball",
    "Tennisball",
    "Stumper",
    "Football",
    "Stump",
    "Racquet",
    "Baseball",
    "Boots",
    "Jersey"
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sports World"),
          backgroundColor: Colors.red,
        ),
        body: ListView(
            children: List.generate(
                7,
                (index) => Card(
                    child: ListTile(
                        title: Text(productname[index]),
                        subtitle: Text("\$250"),
                        trailing: Wrap(children: [
                          Icon(Icons.favorite),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.shopping_cart)
                        ]),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(images[index]),
                        ))))));
  }
}
