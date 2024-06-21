import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:luminar_sample_project/Supabase/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseLoginPage extends StatefulWidget {
  const SupabaseLoginPage({super.key});

  @override
  State<SupabaseLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SupabaseLoginPage> {
  final _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authSubscription;

  @override
  void initState() {
    super.initState();
    _authSubscription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if (session != null) {
        Navigator.of(context).pushReplacementNamed('/account');
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: ListView(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              label: Text("Email"),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  final email = _emailController.text.trim();
                  await supabase.auth.signInWithOtp(
                      email: email,
                      emailRedirectTo: kIsWeb
                          ? null
                          : 'io.supabase.flutter://signin-callback/');

                  if (!mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Check Your Inbox')));
                  }
                } on AuthException catch (error) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error.message)));
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Error occured, Please Retry'),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ));
                }
              },
              child: const Text("Login")),
        ],
      ),
    );
  }
}
