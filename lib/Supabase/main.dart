import 'package:flutter/material.dart';
import 'package:luminar_sample_project/Supabase/Pages/account_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Pages/login_page.dart';
import 'Pages/splash_page.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://eksucuarcywfvaiblkjn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVrc3VjdWFyY3l3ZnZhaWJsa2puIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc0ODI3NjgsImV4cCI6MjAzMzA1ODc2OH0.-2D5Z1enXRhTzfhh6fKFnH6AbDE_VXgYDzyI9QLSVYE',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Supabase Login Demo App',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) =>const  SupabaseLoginPage(),
          '/account':(context)=> const AccountPage(),
        });
  }
}
