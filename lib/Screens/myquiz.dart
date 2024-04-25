import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/Dash_Board_Model.dart';

class MyQuizes extends StatelessWidget {
  const MyQuizes({
    super.key,
    required this.resultList,
  });

  final List<ResultList> resultList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "My Quizes",
        )),
    
      ),
      body: Column(
        children: [
          SizedBox(
            height: 660,
            width: 500,
            child: ListView.builder(
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                var quiznumber= index+1;
                var totalQuestion = resultList.elementAt(index).totalQuestion;
                var totalAttemptQuestion = resultList.elementAt(index).totalAttemptQuestion;
                var nonAttemptQuestion = resultList.elementAt(index).nonAttemptQuestion;
                var rightAnswer = resultList.elementAt(index).rightAnswer;
                var wrongAnswer = resultList.elementAt(index).wrongAnswer;
                var category = resultList.elementAt(index).category;
                var totalMarks = resultList.elementAt(index).totalMarks;
                var timeStamp = resultList.elementAt(index).timeStamp;
                return Expansion(
                  quizNumber: quiznumber,
                  totalQuestion: int.parse(totalQuestion.toString()),
                  totalAttemptQuestion: int.parse(totalAttemptQuestion.toString()),
                  nonAttemptQuestion: int.parse(nonAttemptQuestion.toString()),
                  rightAnswer: int.parse(rightAnswer.toString()),
                  wrongAnswer: int.parse(wrongAnswer.toString()),
                  category: category.toString(),
                  totalMarks: int.parse(totalMarks.toString()),
                  timeStamp: timeStamp.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Expansion extends StatefulWidget {
  const Expansion(
      {super.key,
      required this.quizNumber,
      required this.totalQuestion,
      required this.totalAttemptQuestion,
      required this.nonAttemptQuestion,
      required this.rightAnswer,
      required this.wrongAnswer,
      required this.category,
      required this.totalMarks,
      required this.timeStamp});
  
  final int  quizNumber;
  final int  totalQuestion;
  final int totalAttemptQuestion;
  final int nonAttemptQuestion;
  final int rightAnswer;
  final int wrongAnswer;
  final String category;
  final int totalMarks;
  final String timeStamp;

  @override
  State<Expansion> createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {
  bool customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey),
                BoxShadow(color: Colors.grey),
              ],
            ),
            child: Material(
                color: Colors.white,
                child: ExpansionTile(
                  title:  Text("Quiz: ${widget.quizNumber}"),
                  trailing: Icon(customIcon
                      ? Icons.arrow_drop_down_circle
                      : Icons.arrow_drop_down),
                  children:  [
                    ListTile(
                      title: Text('Total Question: ${widget.totalQuestion}'),
                    ),
                    ListTile(
                      title: Text('Total Attempted Question: ${widget.totalAttemptQuestion}'),
                    ),
                    ListTile(
                      title: Text('Total Nonattempted Question: ${widget.nonAttemptQuestion}'),
                    ),
                    ListTile(
                      title: Text('Right Answers: ${widget.rightAnswer}'),
                    ),
                    ListTile(
                      title: Text('Wrong Answers: ${widget.wrongAnswer}'),
                    ),
                    ListTile(
                      title: Text('Category: ${widget.category}'),
                    ),
                    ListTile(
                      title: Text('Total Marks: ${widget.totalMarks}'),
                    ),
                    ListTile(
                      title: Text('Time Stamp: ${widget.timeStamp}'),
                    ),

                  ],
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      customIcon = expanded;
                    });
                  },
                )),
          ),
        ],
      ),
    );
  }
}
