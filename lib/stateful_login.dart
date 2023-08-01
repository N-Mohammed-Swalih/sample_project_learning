import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luminar_sample_project/registration_page.dart';

import 'home.dart';

class Login2 extends StatefulWidget {
  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {

String username = "admin@gmail.com";
String password = 'admin123';

  // to fetch values from textfield
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page")),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top : 20.0,left: 10,right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      labelText: "Username",
                      hintText : "Enter your mail"
                  ),
                  validator: (username) {
                    if (username!.isEmpty || !username.contains('@')) {
                      return 'field is empty/Invalid';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
                child: TextFormField(
                  validator: (password) {
                    if (password!.isEmpty || password.length == 8) {
                      return 'field is empty / invalid length';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      labelText: "Password"),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (username == usercontroller.text &&
                      password == passcontroller.text) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Invalid Username or Password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM_LEFT,
                       // timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                    },
                    child: Text("Login")),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                    },
                    child: Text("Not a User!!! Register Here!!")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
