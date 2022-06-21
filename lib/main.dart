import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_hiring_dot/pages/home_page.dart';
import 'package:test_hiring_dot/pages/login_screen.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = SharedPreferences.getInstance();

    return MaterialApp(
      title: 'Test Hiring',
      home: Scaffold(
        body: FutureBuilder<bool?>(
            future: prefs.then((pref) => pref.getBool('mykey')),
            builder: (context, snapshot) {
              final result = snapshot.data;
              if (result == null) return const LoginScreen();
              return const HomeScreen();
            }),
      ),
    );
  }
}
