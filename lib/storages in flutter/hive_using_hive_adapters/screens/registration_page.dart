import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:luminar_sample_project/storages%20in%20flutter/hive_using_hive_adapters/database/hive_db.dart';
import 'package:luminar_sample_project/storages%20in%20flutter/hive_using_hive_adapters/models/user_model.dart';

import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('userData');
  runApp(GetMaterialApp(home: RegistrationPageHive()));
}

class RegistrationPageHive extends StatelessWidget {
  RegistrationPageHive({super.key});

  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final mobilenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Registration Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: username,
              decoration: const InputDecoration(
                  hintText: "Username", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                  hintText: "Email", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: mobilenumber,
              decoration: const InputDecoration(
                  hintText: "Mobile Number", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: password,
              decoration: const InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                //fetch all users from db
                final userList = await HiveDb.instance.getUser();
                validateSignUp(context, userList);
              },
              child: const Text(
                "Register",
              ))
        ],
      ),
    );
  }

//to check whether the data already exist or not
  void validateSignUp(BuildContext context, List<User> userList) async {
    final uname = email.text.trim();
    final pass = password.text.trim();

    bool isuserfound = false;
    final validateEmail = EmailValidator.validate(uname);
    if (uname != "" && pass != "") {
      if (validateEmail == true) {
        await Future.forEach(userList, (singleUser) {
          if (singleUser.email == uname) {
            isuserfound = true;
          } else {
            isuserfound = false;
          }
        });
        if (isuserfound == true) {
          Get.snackbar('Hey', 'User Already Exists');
        } else {
          final validatePassword = validatePassWord(context, pass);
          if (validatePassword == true) {
            final user = User(email: uname, password: pass);
            await HiveDb.instance.addUser(user);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginPageScreen()));
            Get.snackbar('Hey User', 'User Registration Success');
          }
        }
      } else {
        Get.snackbar('Error', 'Enter Valid email');
      }
    } else {
      Get.snackbar("Error", "All Fields are required");
    }
  }

  validatePassWord(BuildContext context, String pwd) {
    if (pwd.length < 6) {
      Get.snackbar(
          "Error", "Password Length must be greater than 6 characters");
    } else {
      return true;
    }
  }
}
