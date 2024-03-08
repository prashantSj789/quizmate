import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/QuizScreen.dart';
import 'package:quiz_app/Screens/custom_quiz_generatre.dart';
import 'package:quiz_app/Screens/homeScreen.dart';
import 'package:quiz_app/Screens/loginscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Deo',
      
      home:MainHomeScreen(),
    );
  }
}

