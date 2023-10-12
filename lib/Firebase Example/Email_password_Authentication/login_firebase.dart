import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luminar_sample_project/Firebase%20Example/Email_password_Authentication/firebase_db.dart';
import 'package:luminar_sample_project/Firebase%20Example/Email_password_Authentication/registration_fir.dart';

import '../home_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDt-fGL6T4paXZy5aCH_XLPqRSkqhMN9ZU",
    projectId: "movieapp-b8922",
    appId: '1:34070684426:android:9d31a348611f77ac2850f3',
    messagingSenderId: '',
    storageBucket: "movieapp-b8922.appspot.com",
  ));
  // to get the currently logined in user
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(home: user == null ? LoginFire() : HomeFire()));
}

class LoginFire extends StatefulWidget {
  const LoginFire({super.key});

  @override
  State<LoginFire> createState() => _LoginFireState();
}

class _LoginFireState extends State<LoginFire> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "UserName"),
              controller: email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "PassWord"),
              controller: pass,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                String mail = email.text.trim();
                String pwd = pass.text.trim();

                FirebaseHelper()
                    .signIn(email: mail, password: pwd)
                    .then((result) {
                  if (result == null) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeFire()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              },
              child: const Text('Login')),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Register_fire()));
              },
              child: Text("Not a user ? register here!!"))
        ],
      ),
    );
  }
}
