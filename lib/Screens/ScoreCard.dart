import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/Score_Card_Model.dart';

class ScoreCardScreen extends StatelessWidget {
   ScoreCardScreen( {super.key, required this.scorecard});
   Score_Card_Model scorecard;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text("ScoreCard",
        style: GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blueAccent,
      ),
      body: scorecard==null?Center(
        child: SpinKitCircle(color: Colors.blueAccent,),
      ):SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
               children: [
                Text("maximum marks : ${scorecard.result!.maximumMarks.toString()}",style:GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold) ,),
                SizedBox(height: 10,), 
                Text("total mark : ${scorecard.result!.totalMarks.toString()}",style: GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("total Questions : ${scorecard.result!.totalQuestion.toString()}",style: GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Questions Attempted : ${scorecard.result!.totalAttemptQuestion.toString()}",style: GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Not Attempted questions : ${scorecard.result!.nonAttemptQuestion.toString()}",style: GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Right Answer : ${scorecard.result!.rightAnswer.toString()}",style: GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Wrong Answer : ${scorecard.result!.wrongAnswer.toString()}",style: GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),                                                                                                            
               ],
              ),
            ),
            
          ],
        ),
        ),
      );
  }
}