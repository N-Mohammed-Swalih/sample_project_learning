import 'package:flutter/material.dart';
import 'package:luminar_sample_project/whatsapp_ui.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TabBar2(),
  ));
}

class TabBar2 extends StatelessWidget {
  const TabBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title:const Text('Whatsapp'),
          actions: [
            const Icon(Icons.search),
            const SizedBox(width: 25,),
           const Icon(Icons.camera_alt),
           const SizedBox(width: 10,),
            PopupMenuButton(itemBuilder: (context) {
              return [PopupMenuItem(child: Text("Settings"))];
            })],
          bottom:TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.zero,
            tabs: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.1,
            child :
            Icon(Icons.people)),
            SizedBox(
              width : MediaQuery.of(context).size.width*.3,
            child :Center(child: Text("Chat")),),
            SizedBox(
              width : MediaQuery.of(context).size.width*.3,
            child :Center(child: Text("Status")),),
            SizedBox(
              width : MediaQuery.of(context).size.width*.3,
            child : Center(child: Text("Call"))),
          ]),
        ),
        body:TabBarView(children: [
          Center(child :Text("Community"),
          ),
          WhatsappChats(),
          Center(child :Text("Status"),
          ),
          Center(child :Text("Call"),
          ),

        ]),
      ),
    );
  }
}
