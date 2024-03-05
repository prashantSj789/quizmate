import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/Screens/QuizScreen.dart';

class QuizSplashScreen extends StatefulWidget {
   QuizSplashScreen({super.key,required this.category1,required this.e, required this.m, required this.h});
  String category1;

  int e;
  int m;
  int h;
  @override
  State<QuizSplashScreen> createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {
    @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> QuizScreen(category1: widget.category1, e: widget.e, m: widget.m, h: widget.h,) ));});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.network("https://lottie.host/cb66f80e-3176-4021-a027-0564c894c372/f36HwMmQku.json")),
    );
  }
}