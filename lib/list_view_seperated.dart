import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: ListViewSeperated(),
  ));
}

class ListViewSeperated extends StatelessWidget {
  const ListViewSeperated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Seperate'),
        centerTitle: true,
      ),
      body  : ListView.separated(itemBuilder: (context , index){
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/100")
            ),
          ),
        );
      }, separatorBuilder: (context, index){
        if(index % 3 ==0){
        return Divider(
          color: Colors.red[300],
          thickness:15,
        );
      }else{
        return SizedBox();
   } 
  },
  itemCount: 20)
      );
}
}