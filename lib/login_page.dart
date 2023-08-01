import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './home.dart';

class LoginPage extends StatelessWidget {

String username = "admin@gmail.com";
String password = 'admin123';

  // to fetch values from textfield
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  LoginPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.person_2),
                  labelText: "Username",
                  hintText: "Enter Username",
                  helperText: "Username must be an email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                top: 0,
                bottom: 20,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.password),
                  labelText: "Password",
                  hintText: "Enter Password",
                  helperText: "Password must contain 8 characters",
                ),
              ),
            ),
            ElevatedButton(
               onPressed: () {
                  if (username == usercontroller.text &&
                      password == passcontroller.text) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //   content: Text("inavlid username or password"),
                    //   backgroundColor: Colors.red,
                    // ));
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
            }, child: Text("Login"),)
          ]),
        ));
  }
}
