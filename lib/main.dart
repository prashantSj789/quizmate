import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Screens/QuizScreen.dart';
import 'package:quiz_app/Screens/ScoreCard.dart';
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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Deo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 42, 27, 61),
           iconTheme: IconThemeData(color:Colors.white),
           titleTextStyle: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.bold,fontSize:20)
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black)
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      
      home:LoginScreen(),
    );
  }
}

