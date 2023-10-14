import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luminar_sample_project/Firebase%20Example/Phone_Authentication/login_page.dart';

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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[900],
    );
  }
}
