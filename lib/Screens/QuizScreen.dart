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
      body: Column(
        children: [
          SizedBox(
            height: height*0.3,
            width: width*095,
            child: Card(
                  elevation: 5,
                  child: Center(child: Text('Q1:What are objects in java??')),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Card(
                 child: Text("option 1"),
                ),
              ),
              Card(
               child: Text("option 2"),
              ),
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
               child: Text("option 1"),
              ),
              Card(
               child: Text("option 2"),
              ),
            ],
          ),
          

        ],
      )
    ,
    );
  }
}