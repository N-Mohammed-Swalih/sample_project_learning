import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luminar_sample_project/home.dart';

class RegistrationPage extends StatefulWidget {
   const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var formkey = GlobalKey<FormState>();

  String? initpassword;
  String? confirmpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child 
             :Text("Registration Page"),
        ),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key : formkey,
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 0,
                  bottom: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.person),
                    labelText: "First Name",
                    hintText: "Enter your first name",
                    helperText: "*Cannot be empty"
                  ),
                   validator: (firstname) {
                      if (firstname!.isEmpty) {
                        return 'field is empty/Invalid';
                      } else {
                        return null;
                      }
                    },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 0,
                  bottom: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.person),
                    labelText: "Last Name",
                    hintText: "Enter your last name",
                    helperText: "*Cannot be empty"
                  ),
                   validator: (lastname) {
                      if (lastname!.isEmpty) {
                        return 'field is empty/Invalid';
                      } else {
                        return null;
                      }
                    },
                ),
              ),
              Padding(
               padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 0,
                  bottom: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.mail),
                    labelText: "Email",
                    hintText: "Enter your mail here",
                    helperText: "*Email must be valid"
                  ),
                  validator: (mail) {
                      if (mail!.isEmpty || !mail.contains('@')) {
                        return 'field is empty/Invalid';
                      } else {
                        return null;
                      }
                    },
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 0,
                  bottom: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Mobile Number",
                    hintText: "Enter your mobile number",
                    helperText: "*Mobile Number must contain 10 digits",
                  ),
                  validator: (mobile) {
                      if (mobile!.isEmpty || mobile.length == 10) {
                        return 'field is empty/Invalid';
                      } else {
                        return null;
                      }
                    },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 0,
                  bottom: 10,
                ),
              child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.password),
                    labelText: "Password",
                    hintText: "Enter Password",
                    helperText: "*Password must contain 8 characters",
                  ),
                    validator: (password) {
                      initpassword = password;
                      if (password!.isEmpty || password.length < 8) {
                      initpassword = password;
                        return 'field is empty / Invalid length';
                      } else {
                        return null;
                      }
                    },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 0,
                  bottom: 10,
                ),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.password),
                    labelText: "Confirm Password",
                    hintText: "Re-enter Password",
                    helperText: "*Re-enter your password",
                  ),
                   validator: (password) {
                    confirmpassword = password; ///to store the value inside the textfield
                      if (confirmpassword!.isEmpty || initpassword != confirmpassword) {
                        return 'Password does not match';
                      } else {
                        return null;
                      }
                    },
                ),
              ),
              ElevatedButton(
                     onPressed: () {
                    final valid = formkey.currentState!.validate();
                    if (valid) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      Fluttertoast.showToast(
                          msg: "Invalid Username or Password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_LEFT,
                          // timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                     },
        
                child: Text("Sign Up"),
              )
            ]),
          ),
        ));
  }
}
