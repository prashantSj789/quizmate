import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/Screens/QuizScreen.dart';
import 'package:quiz_app/Screens/Quiz_Splash_Screen.dart';
import 'package:quiz_app/repository/Qestion_repo.dart';

class CustomQuizScreen extends StatefulWidget {
  const CustomQuizScreen({super.key});

  @override
  State<CustomQuizScreen> createState() => CustomQuizScreenState();
}

class CustomQuizScreenState extends State<CustomQuizScreen> {
  late String category;
  late int easy ;
  late int hard ;
  late int medium;
  QuestionRepository repo = new QuestionRepository();
  @override
  var formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
     TextEditingController categorycontroller = new TextEditingController();
     TextEditingController easycontroller = new TextEditingController();
     TextEditingController mediumcontroller = new TextEditingController();
     TextEditingController hardcontroller = new TextEditingController();
     void givevalues(){
      category = categorycontroller.text.toString();
      easy= int.parse(easycontroller.text.toString());
      medium= int.parse(mediumcontroller.text.toString());
      hard= int.parse(hardcontroller.text.toString());
                 setState(() {
                  formkey.currentState?.validate();
                });
         print(category);
         print(easy);
         print(hard);
         print(medium);
     }
     
      var height = MediaQuery.sizeOf(context).height;
       var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
  appBar: AppBar(title: Text("Generate Your Quiz",style: GoogleFonts.rye(fontWeight: FontWeight.bold,fontSize: 17) ,),backgroundColor: Colors.blueAccent,),
  body: ListView(
    children: [
      Container(
        height: height*0.4,
        width: width*0.95,
        child: Lottie.network("https://lottie.host/0afc0b0b-7418-4a2a-8703-15cc4ec74884/JvxK4wYI63.json"),
      ),
      Form(key: formkey
        ,child: Column(
          children: [
            TextFormField(
              controller: categorycontroller,
              decoration: InputDecoration(
                hintText: "Category",
                labelText: "Category",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
              ),
              validator: (value) {
                if(value!.length<3)
                {
                  return "enter valid category";
                }
                else
                 return null;
              },
            ),
             const SizedBox(height: 30,),
               TextFormField(
                controller: easycontroller,
              decoration: InputDecoration(
                hintText: "easy questions",
                labelText: "easy questions",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
              ),
              keyboardType: TextInputType.number,
            ),
               const SizedBox(height: 30,),
              TextFormField(
                controller: mediumcontroller,
              decoration: InputDecoration(
                hintText: "medium questions",
                labelText: "medium questions",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
              ),
              keyboardType: TextInputType.number,
            ),
              const SizedBox(height: 30,),
              TextFormField(
                controller: hardcontroller,
              decoration: InputDecoration(
                hintText: "hard  questions",
                labelText: "hard questions",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
              ),
              keyboardType: TextInputType.number,
            ),const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: width,
              child: ElevatedButton(onPressed: givevalues,child: const Text("Generate Quiz"),),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: width,
              child: ElevatedButton(onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuizSplashScreen(category1: category, e: easy, m: medium, h: hard)));
              },child:   Text("Start"),),
            ),

          ],
        ))
    ],
  ),
    );
  }
}