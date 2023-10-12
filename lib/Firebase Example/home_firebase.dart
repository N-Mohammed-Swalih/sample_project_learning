import 'package:flutter/material.dart';
import 'package:luminar_sample_project/Firebase%20Example/Email_password_Authentication/login_firebase.dart';

import 'Email_password_Authentication/firebase_db.dart';

class HomeFire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FirebaseHelper().signOut().then((result) => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginFire())));
            },
            child: Text("SignOut")),
      ),
    );
  }
}
