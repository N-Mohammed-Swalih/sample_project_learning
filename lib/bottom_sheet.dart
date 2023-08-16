import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(
    MaterialApp(home: BottomSheet()),
  );
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet'),
      ),
      body: Column(
        children: [
          GestureDetector(
              //we can also use inwell for performing events in an widgets
              onTap: () => showSheet(context),
              child: Image.network(
                  "https://images.unsplash.com/photo-1615125468484-088e3dfcabb6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80")),
        ],
      ),
    );
  }
}

void showSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white24,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Text(
                  "Share to : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.facebook),
                title: Text(
                  "Facebook",
                ),
                iconColor: Colors.blue,
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.whatsapp),
                title: Text(
                  "Whatsapp",
                ),
                iconColor: Colors.teal,
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.instagram),
                title: Text(
                  "Instagram",
                ),
                iconColor: Colors.red,
              ),
            ],
          ),
        );
      });
}
