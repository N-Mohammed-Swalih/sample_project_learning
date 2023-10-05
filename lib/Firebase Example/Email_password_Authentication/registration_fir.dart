import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luminar_sample_project/Firebase%20Example/Email_password_Authentication/firebase_db.dart';
import 'package:luminar_sample_project/Firebase%20Example/Email_password_Authentication/login_firebase.dart';

class RegistrationFirebase extends StatefulWidget {
  const RegistrationFirebase({super.key});

  @override
  State<RegistrationFirebase> createState() => _RegistrationFirebaseState();
}

class _RegistrationFirebaseState extends State<RegistrationFirebase> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registration"),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Username"),
              controller: username_controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
              controller: password_controller,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String email = username_controller.text.trim();
              String password = password_controller.text.trim();
              FirebaseHelper()
                  .register(email: email, password: password)
                  .then((result) {
                if (result == null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginFirebase()));
                } else {
                  Get.snackbar('Error', 'Registration Failed');
                }
              });
            },
            child: Text("Register"),
          ),
        ]));
  }
}
