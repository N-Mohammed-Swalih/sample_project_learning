import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luminar_sample_project/Firebase%20Example/Email_password_Authentication/firebase_db.dart';

import '../home_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? LoginFirebase() : HomeFirebase(),
  ));
}

class LoginFirebase extends StatefulWidget {
  const LoginFirebase({super.key});

  @override
  State<LoginFirebase> createState() => _LoginFirebaseState();
}

class _LoginFirebaseState extends State<LoginFirebase> {
  final login_username_controller = TextEditingController();
  final login_password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Username"),
              controller: login_username_controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
              controller: login_password_controller,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                String email = login_username_controller.text.trim();
                String password = login_password_controller.text.trim();
                FirebaseHelper()
                    .login(email: email, password: password)
                    .then((value) => ((result) {
                          if (result == null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeFirebase()));
                          } else {
                            Get.snackbar('Error', "Login Failed");
                          }
                        }));
              },
              child: const Text('Login')),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Register Here'))
        ],
      ),
    );
  }
}