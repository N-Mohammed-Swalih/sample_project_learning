import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luminar_sample_project/storages%20in%20flutter/sqflite%20crud/main_ui.dart';


class LoginPageSq extends StatefulWidget {
  LoginPageSq({super.key});

  @override
  State<LoginPageSq> createState() => _LoginPageSqState();
}

class _LoginPageSqState extends State<LoginPageSq> {
  var formkey = GlobalKey<FormState>();
  bool nopasswordvisibility = true;

  // to fetch values from textfield
  TextEditingController usercontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Form(
                key: formkey,
                child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.7,
                          image: NetworkImage(
                              "https://images.pexels.com/photos/4110250/pexels-photo-4110250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
                    ),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login Here!",
                              style: GoogleFonts.raleway(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.person_2,
                                    color: Colors.white,
                                  ),
                                  labelText: "Username",
                                  hintText: "Enter Username",
                                  helperText: "Username must be an email",
                                ),
                                validator: (username) {
                                  if (username!.isEmpty ||
                                      !username.contains('@')) {
                                    return 'field is empty/Invalid';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20,
                                top: 0,
                                bottom: 20,
                              ),
                              child: TextFormField(
                                obscureText: nopasswordvisibility,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (nopasswordvisibility == true) {
                                            nopasswordvisibility = false;
                                          } else {
                                            nopasswordvisibility = true;
                                          }
                                        });
                                      },
                                      icon: Icon(nopasswordvisibility == true
                                          ? Icons.visibility_off_sharp
                                          : Icons.visibility)),
                                  prefixIcon: const Icon(
                                    Icons.password,
                                    color: Colors.white,
                                  ),
                                  labelText: "Password",
                                  hintText: "Enter Password",
                                  helperText:
                                      "Password must contain 8 characters",
                                ),
                                validator: (password) {
                                  if (password!.isEmpty ||
                                      password.length < 8) {
                                    return 'field is empty / invalid length';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  final valid =
                                      formkey.currentState!.validate();
                                  if (valid) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ContactSqflite()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Invalid Username or Password",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM_LEFT,
                                        // timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: const Text("Login"),
                              ),
                            )
                          ]),
                    )))));
  }
}
