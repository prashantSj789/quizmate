import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/QuizScreen.dart';
import 'package:quiz_app/Screens/homeScreen.dart';
import 'package:quiz_app/Screens/loginscreen.dart';
import 'package:http/http.dart'as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    title: 'flutter deo',
      
      home:QuizScreen(),
    );
  }
}

