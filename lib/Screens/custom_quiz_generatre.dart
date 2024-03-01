import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/Screens/Quiz_Splash_Screen.dart';

class CustomQuizScreen extends StatefulWidget {
  const CustomQuizScreen({super.key});

  @override
  State<CustomQuizScreen> createState() => _CustomQuizScreenState();
}

class _CustomQuizScreenState extends State<CustomQuizScreen> {
  @override
  
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Generate Your Custom Quiz",style: GoogleFonts.rye(fontSize: 30,fontWeight: FontWeight.bold))),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
            SizedBox(
              height: height*0.4,
              width: width*0.95,
              child: Lottie.network("https://lottie.host/0afc0b0b-7418-4a2a-8703-15cc4ec74884/JvxK4wYI63.json"),
            ),
                    TextField(decoration: InputDecoration(hintText:"No of Ouestions",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: TextStyle(color: Colors.white),labelText: "No of Question"),
                 ),
                 SizedBox(height: 50,),
                TextField(decoration: InputDecoration(hintText:"Duration Of Quiz",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: TextStyle(color: Colors.white),labelText: "Duration Of Quiz")
                 ),
                 SizedBox(height: 50,),
                                 TextField(decoration: InputDecoration(hintText:"Programing Language",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: TextStyle(color: Colors.white),labelText: "Programing Language")
                 ),
                 SizedBox(height: 30,),
                 ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuizSplashScreen()));
                 }, child: Text("Generate Quiz"))
        ],
      ),
    );
  }
}