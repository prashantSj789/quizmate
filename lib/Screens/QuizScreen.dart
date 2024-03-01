import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blueAccent,
      title: Center(child: Text("All the Best",style: GoogleFonts.rye(color: Colors.black,fontWeight: FontWeight.bold),)),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Card(
                  elevation: 5,
                    
            ),
          )
        ],
      )
    ,
    );
  }
}