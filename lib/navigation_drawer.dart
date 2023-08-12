import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: NavigationDrawer(),
  ));
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(
              color: Colors.black87,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=872&q=80",
                ),
              )),
          accountName: Text("N Mohammed Swalih"),
          accountEmail: Text("mohdswalih003@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1541535881962-3bb380b08458?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnVzaW5lc3MlMjBtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
          ),
          otherAccountsPictures: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/flagged/photo-1553642618-de0381320ff3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
            )
          ],
        ),
        ListTile(
          leading: IconButton(
            onPressed: () {},
            iconSize: 24,
            icon: Icon(Icons.home),
          ),
          title: Text("Home"),
        ),
         ListTile(
          leading: IconButton(
            onPressed: () {},
            iconSize: 24,
            icon: Icon(Icons.settings),
          ),
          title: Text("Settings"),
        ),
      ])),
    );
  }
}
