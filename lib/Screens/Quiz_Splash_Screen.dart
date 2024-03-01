import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/Screens/QuizScreen.dart';

class QuizSplashScreen extends StatefulWidget {
  const QuizSplashScreen({super.key});

  @override
  State<QuizSplashScreen> createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>QuizScreen() ));});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Center(child: Lottie.network("https://lottie.host/cb66f80e-3176-4021-a027-0564c894c372/f36HwMmQku.json")),
      ),
    );
  }
}