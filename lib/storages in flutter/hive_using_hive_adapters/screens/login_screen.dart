import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_model.dart';
import 'registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter();
  await Hive.openBox<User>('userData');
  runApp(MaterialApp(home: LoginPageScreen()));
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
          ElevatedButton(onPressed: () {}, child: const Text("Login")),
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
}
