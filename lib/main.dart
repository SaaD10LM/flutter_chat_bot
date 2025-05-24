import 'package:bot/pages/chatbot.page.dart';
import 'package:bot/pages/login.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        "/bot": (context) => ChabotPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
    );
  }
}
