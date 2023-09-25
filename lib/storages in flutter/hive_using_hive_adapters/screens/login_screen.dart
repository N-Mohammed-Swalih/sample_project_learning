import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:luminar_sample_project/Mediaquery/home.dart';
import '../database/hive_db.dart';
import '../models/user_model.dart';
import 'home_page.dart';
import 'registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter();
  await Hive.openBox<User>('userData');
  runApp(GetMaterialApp(home: LoginPageScreen()));
}

class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({super.key});
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: username_controller,
              decoration: const InputDecoration(
                  hintText: "Username", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: password_controller,
              decoration: const InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                final userList = await HiveDb.instance.getUser();
                checkLogin(context, userList);
              },
              child: const Text("Login")),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationPageHive()));
              },
              child: const Text("Not a user ? Register Now"))
        ],
      ),
    );
  }

  Future<void> checkLogin(BuildContext context, List<User> userList) async {
    final userlogin = username_controller.text.trim();
    final userpass = password_controller.text.trim();
    bool userFound = false;
    if (userlogin != "" && userpass != "") {
      await Future.forEach(userList, (singleuser) {
        if (singleuser.email == userlogin && singleuser.password == userpass) {
          userFound = true;
        } else {
          userFound = false;
        }
        if (userFound = true) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => HomePageForHive(email: userlogin))));
        } else {
          Get.snackbar('Hey', "Invalid User");
        }
      });
    }
  }
}
