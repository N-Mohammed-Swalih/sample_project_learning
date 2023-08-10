import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: ExpandedWidget(),
  ));
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(children: [
        Expanded(child: Image.network("https://images.unsplash.com/photo-1615125468484-088e3dfcabb6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cG9yc2NoZSUyMDkxMXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")),
                Expanded(child: Image.network("https://images.unsplash.com/photo-1615125468484-088e3dfcabb6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cG9yc2NoZSUyMDkxMXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")),
                        Expanded(child: Image.network("https://images.unsplash.com/photo-1615125468484-088e3dfcabb6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cG9yc2NoZSUyMDkxMXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")),



      ]),
    );
  }
}