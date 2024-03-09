import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/dummydata/dummy.dart';
import 'package:quiz_app/models/Question_Paper_model.dart';
import 'package:quiz_app/repository/Qestion_repo.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key,required this.category1,required this.e,required this.m,required this.h});
  String category1;

  int e;
  int m;
  int h;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List list = object;
  int toggle = 0;

Question_Paper_Model response = new Question_Paper_Model();

  @override
  void initState() {
    callfunction();
    super.initState();
  }

  void callfunction() async {
    print('questions called');
    QuestionRepository repo1 = QuestionRepository();

    response = await repo1.fetchquestion(widget.category1,widget.e,widget.m,widget.h);

     print(response.questionList);
     
    setState(() {
      
    });
  }

  int index = 0;
  void optionchoose1() {
    setState(() {
      toggle = 1;
    });
  }

  void optionchoose2() {
    setState(() {
      toggle = 2;
    });
  }

  void optionchoose3() {
    setState(() {
      toggle = 3;
    });
  }

  void optionchoose4() {
    setState(() {
      toggle = 4;
    });
  }

  void nextQuestion() {
    if (index != response.questionList!.length-1) {
      setState(() {
        index++;
        toggle = 0;
      });
    }
  }

  void prevQuestion() {
    if (index != 0) {
      setState(() {
        index--;
        toggle = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
            child: Text(
          "All the Best",
          style:
              GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [
          response==null?
          const Center(child: CircularProgressIndicator()):
          SizedBox(
            height: height * 0.3,
            width: width * 0.95,
            child: Card(
              elevation: 5,
              child: Center(
                  child: Text(
                    response.questionList!.elementAt(index).question.toString(),
                style: GoogleFonts.merriweather(
                    fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: optionchoose1,
                child: SizedBox(
                  height: height * 0.08,
                  width: width * 0.95,
                  child: Card(
                    color: toggle == 1 ? Colors.green : Colors.white70,
                    elevation: toggle == 1 ? 30 : 5,
                    child: Center(
                      child: Text(  response.questionList!.elementAt(index).options1.toString(),
                              style: GoogleFonts.merriweather(
                                fontSize: 15,
                              )),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: optionchoose2,
                child: SizedBox(
                  height: height * 0.08,
                  width: width * 0.95,
                  child: Card(
                    color: toggle == 2 ? Colors.green : Colors.white70,
                    elevation: toggle == 2 ? 30 : 5,
                    child: Center(
                        child: Text( response.questionList!.elementAt(index).options2.toString(),
                            style: GoogleFonts.merriweather(
                              fontSize: 15,
                            ))),
                  ),
                ),
              ),
              InkWell(
                onTap: optionchoose3,
                child: SizedBox(
                  height: height * 0.08,
                  width: width * 0.95,
                  child: Card(
                    color: toggle == 3 ? Colors.green : Colors.white70,
                    elevation: toggle == 3 ? 30 : 5,
                    child: Center(
                        child: Text(response.questionList!.elementAt(index).options3.toString(),
                            style: GoogleFonts.merriweather(
                              fontSize: 15,
                            ))),
                  ),
                ),
              ),
              InkWell(
                onTap: optionchoose4,
                child: SizedBox(
                  height: height * 0.08,
                  width: width * 0.95,
                  child: Card(
                    color: toggle == 4 ? Colors.green : Colors.white70,
                    elevation: toggle == 4 ? 30 : 5,
                    child: Center(
                        child: Text(response.questionList!.elementAt(index).options4.toString(),
                            style: GoogleFonts.merriweather(
                              fontSize: 15,
                            ))),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: prevQuestion,
                icon: const Icon(Icons.arrow_circle_left_sharp),
                iconSize: 60,
              ),
              IconButton(
                onPressed: nextQuestion,
                icon: const Icon(Icons.arrow_circle_right_sharp),
                iconSize: 60,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Submit")),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Finish Quiz")),
            ],
          )
        ],
      ),
    );
  }
}
