import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyQuizes extends StatelessWidget {
  const MyQuizes({
    super.key,
    required this.resultList,
  });

  final List<dynamic> resultList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "My Quizes",
          style:
              GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 660,
            width: 500,
            child: ListView.builder(
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                var res = resultList[index];
                var quiznumber= index+1;
                var totalQuestion = res['totalQuestion'];
                var totalAttemptQuestion = res['totalAttemptQuestion'];
                var nonAttemptQuestion = res['nonAttemptQuestion'];
                var rightAnswer = res['rightAnswer'];
                var wrongAnswer = res['wrongAnswer'];
                var category = res['category'];
                var totalMarks = res['totalMarks'];
                var timeStamp = res['timeStamp'];
                return Expansion(
                  quizNumber: quiznumber,
                  totalQuestion: totalQuestion,
                  totalAttemptQuestion: totalAttemptQuestion,
                  nonAttemptQuestion: nonAttemptQuestion,
                  rightAnswer: rightAnswer,
                  wrongAnswer: wrongAnswer,
                  category: category,
                  totalMarks: totalMarks,
                  timeStamp: timeStamp,
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
  
  final num quizNumber;
  final num totalQuestion;
  final num totalAttemptQuestion;
  final num nonAttemptQuestion;
  final num rightAnswer;
  final num wrongAnswer;
  final String category;
  final num totalMarks;
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
