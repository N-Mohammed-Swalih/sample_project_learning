import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ContactSqflite(),
  ));
}

class ContactSqflite extends StatefulWidget {
  ContactSqflite({super.key});

  @override
  State<ContactSqflite> createState() => _ContactSqfliteState();
}

class _ContactSqfliteState extends State<ContactSqflite> {
  var isLoading = true;
  List<Map<String, dynamic>> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(),
                );
              }),
      floatingActionButton: FloatingActionButton(
        //creating a new data so that the id will be null
        onPressed: () => showSheet(null),
        child: Icon(Icons.add),
      ),
    );
  }

  final name_contrl = TextEditingController();
  final phonr_contrl = TextEditingController();
  void showSheet(int? id) async {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 100,
                left: 15,
                right: 15,
                top: 15),
            child: Column(
              children: [
                TextField(
                  controller: name_contrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phonr_contrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Phone Number'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {}, child: Text(id == null ? "Create Contact" : "Update"))
              ],
            ),
          );
        });
  }
}
