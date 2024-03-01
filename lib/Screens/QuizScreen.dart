import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
 int toggle=0;
  @override
  void optionchoose1()
  {
 setState(() {
   toggle=1;
 });
  }
    void optionchoose2()
  {
    setState(() {
   toggle=2;
 });
  }
  void optionchoose3()
  {
setState(() {
   toggle=3;
 });
  }
  void optionchoose4()
  {
setState(() {
   toggle=4;
 });
  }

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
            width: width*0.95,
            child: Card(
                  elevation: 5,
                  child: Center(child: Text('Q1:What are objects in java??',style: GoogleFonts.merriweather(fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
          ),
          SizedBox(
                height: 20,
              ),
           Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            InkWell(
               onTap: optionchoose1,
              child: SizedBox(
                height: height*0.08,
                width: width*0.95,
                
                  child: Card(
                     color: toggle==1?Colors.green:Colors.white70,
                     child: Center(child: Text("option 1",style: GoogleFonts.merriweather(fontSize: 15,))),
                     elevation: toggle==1?30:5,
                    ),
                
              ),
            ),
              InkWell(
                onTap: optionchoose2,
                child: SizedBox(
                height: height*0.08,
                width: width*0.95,
              
                child:  Card(
                   color: toggle==2?Colors.green:Colors.white70,
                   child: Center(child: Text("option 2",style: GoogleFonts.merriweather(fontSize: 15,))),
                   elevation: toggle==2?30:5,
                  ),
                            ),
              ),
            InkWell(
              onTap: optionchoose3,
              child: SizedBox(
                height: height*0.08,
                width: width*0.95,
                child:  Card(
                    color: toggle==3?Colors.green:Colors.white70,
                   child: Center(child: Text("option 3",style: GoogleFonts.merriweather(fontSize: 15,))),
                   elevation: toggle==3?30:5,
                  ),
              ),
            ),
              InkWell(
                onTap: optionchoose4,
                child: SizedBox(
                height: height*0.08,
                width: width*0.95,
                child:  Card(
                  color: toggle==4?Colors.green:Colors.white70,
                   child: Center(child: Text("option 4",style: GoogleFonts.merriweather(fontSize: 15,))),
                   elevation: toggle==4?30:5,
                  ),
                            ),
              ),
           ],),
          SizedBox(
            height: 20,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_left_sharp),iconSize: 60,),
           IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_sharp),iconSize: 60,),
          ],
        ),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){}, child: Text("Submit"))

        ],
      )
    ,
    );
  }
}