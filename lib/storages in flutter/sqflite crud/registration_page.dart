import 'package:flutter/material.dart';
import 'package:luminar_sample_project/storages%20in%20flutter/sqflite%20crud/welcome_page.dart';

import 'sql_helper.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var formkey = GlobalKey<FormState>();
  final name_contrl = TextEditingController();
  final email_contrl = TextEditingController();
  final phone_contrl = TextEditingController();
  final password_contrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: formkey,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.9,
                      image: NetworkImage(
                          "https://images.pexels.com/photos/4110250/pexels-photo-4110250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Registration Page",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 100,
                            left: 15,
                            right: 15,
                            top: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextField(
                                controller: name_contrl,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Name"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: email_contrl,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Email'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: phone_contrl,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Phone Number'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: password_contrl,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Password'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 74, 14, 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await createAccount();
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                                  },
                                  child: Text("Sign-Up"),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Don't have an account?")
                            ]),
                      )
                    ]),
              )),
        ));
  }

  Future<void> createAccount() async {
    var id = await SQLHelperAssignment.create_user(name_contrl.text,
        phone_contrl.text, email_contrl.text, password_contrl.text);
        print(id);
  }
}
