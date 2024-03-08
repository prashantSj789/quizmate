import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
 String category = "";
 int easy= 1;
 int medium=1;
 int hard =1;
 TextEditingController cat = TextEditingController();
  TextEditingController e = TextEditingController();
  TextEditingController m =  TextEditingController();
   TextEditingController h = TextEditingController();
   void givevalues(){
    print("enter");
      print(cat.text.toString());
   category= cat.text.toString();
   easy=int.parse(e.text.toString());
   medium=int.parse(m.text.toString());
   hard =  int.parse(h.text.toString());
   print(category);
   print(easy);
   print(medium);
   print(hard);
   }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Generate Your Custom Quiz",style: GoogleFonts.rye(fontSize: 17,fontWeight: FontWeight.bold))),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
            SizedBox(
              height: height*0.4,
              width: width*0.95,
              child: Lottie.network("https://lottie.host/0afc0b0b-7418-4a2a-8703-15cc4ec74884/JvxK4wYI63.json"),
            ),
                    TextField(decoration: InputDecoration(hintText:"Category",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: const TextStyle(color: Colors.white),labelText: "Category"),
                 controller: cat,),
                 const SizedBox(height: 50,),
                TextField(decoration: InputDecoration(hintText:"easy questions",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: const TextStyle(color: Colors.white),labelText: "easy Questions"),
                controller: e,
),
                 const SizedBox(height: 50,),
                                 TextField(decoration: InputDecoration(hintText:"medium question",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: const TextStyle(color: Colors.white),labelText: "medium questions"),
                  controller: m,
),
                const SizedBox(height: 50,),
                TextField(decoration: InputDecoration(hintText:"hard question",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: const TextStyle(color: Colors.white),labelText: "hard questions"),
               
                
                 controller: h,),
                 const SizedBox(height: 30,),
                 ElevatedButton(onPressed: givevalues,
                
               child: const Text("Generate Quiz")),
                 ElevatedButton(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuizSplashScreen(category1: category, e: easy, m: medium, h: hard)));
                 }, child: Text("start"))
        ],
      ),
    );
  }
}