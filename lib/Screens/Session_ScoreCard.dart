import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/session_scorecard_model.dart';

class Session_ScoreCard_Screen extends StatefulWidget {
   Session_ScoreCard_Screen({super.key,required this.session_score_card});
   Session_Score_card session_score_card;
  @override
  State<Session_ScoreCard_Screen> createState() => _Session_ScoreCard_ScreenState();
}

class _Session_ScoreCard_ScreenState extends State<Session_ScoreCard_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ScoreCard",style: GoogleFonts.rye(fontWeight:FontWeight.bold),),backgroundColor: Colors.blueAccent,),
      body: widget.session_score_card==null?Center(
        child: SpinKitCircle(color: Colors.amberAccent,),
      ):SingleChildScrollView(
        child: Column(
          children: [
            Text("Message:${widget.session_score_card.message}"),
            SizedBox(height: 20,),
            Text("Marks:${widget.session_score_card.marks}"),
            SizedBox(height: 20,),
            Text("Correct:${widget.session_score_card.correct}"),
            SizedBox(height: 20,),
            Text("TotalQuestions:${widget.session_score_card.totalQuestion}"),
            SizedBox(height: 20,),
            Text("WrorngQuestions:${widget.session_score_card.wrong}"),
            SizedBox(height: 20,),                                                

          ],
        ),
      ),
    );
  }
}