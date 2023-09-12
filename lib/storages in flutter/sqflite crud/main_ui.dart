import 'package:flutter/material.dart';

import 'sqflite_operatios.dart';

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
  void initState() {
    loadui();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(contacts[index]['cname']),
                    subtitle: Text(contacts[index]['cnumber']),
                    trailing: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            updateContact(contacts[index]['id']);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                            onPressed: () {
                              deleteContact(contacts[index]['id']);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        //creating a new data so that the id will be null
        onPressed: () => showSheet(null),
        child: const Icon(Icons.add),
      ),
    );
  }

  final name_contrl = TextEditingController();
  final phone_contrl = TextEditingController();
  void showSheet(int? id) async {
    if (id != null) {
      final existingcontact =
          contacts.firstWhere((element) => element['id'] == id);
      name_contrl.text = existingcontact['cname'];
      phone_contrl.text = existingcontact['cnumber'];
    }
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
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name_contrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phone_contrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Phone Number'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        await createContact();
                      }
                      if (id != null) {
                        // await updateContact();
                      }
                      name_contrl.text = "";
                      phone_contrl.text = "";
                      Navigator.pop(context);
                    },
                    child: Text(id == null ? "Create Contact" : "Update"))
              ],
            ),
          );
        });
  }

//to add a new data or contact to sqflite db
  Future<void> createContact() async {
    var id =
        await SQLHelper.create_contact(name_contrl.text, phone_contrl.text);
    loadui(); //refresh the list each time
  }

  void loadui() async {
    final data = await SQLHelper.readContacts();
    setState(() {
      contacts =
          data; //we are performing crud in this list so it must be inside setstate
      isLoading = false;
    });
  }

  Future<void> updateContact(int id) async {
    await SQLHelper.updateContact(id, name_contrl.text, phone_contrl.text);
    loadui();
  }

  Future<void> deleteContact(int id) async {
    await SQLHelper.deleteContact(id);
    loadui();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Successfully Deleted")));
  }
}
