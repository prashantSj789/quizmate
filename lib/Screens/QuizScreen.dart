import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiz_app/models/Question_Paper_model.dart';
import 'package:quiz_app/models/question_view_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionView questionView = new QuestionView();

  @override
  Widget build(BuildContext context) {
      final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children:[
          
           FutureBuilder<Question_paper_model>(future: questionView.fetchquestionfromapi(), builder: (context,snapshot){
            print(snapshot.data!.questionList[0].question.toString());
           if(snapshot.connectionState==ConnectionState.waiting)
          {
           return const Center(child: SpinKitCircle(color: Colors.blue,size: 50,));
          }
          else{
            return ListView.builder( itemCount: snapshot.data!.questionList.length , itemBuilder: (context,index){
                return SizedBox(
                  height: height*0.1,
                  child: Text(snapshot.data!.questionList[index].question.toString()),
                );
            });
          }
           } ),
          
        ]
      )
      
    );
  }
}