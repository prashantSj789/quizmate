import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:quiz_app/Screens/homeScreen.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/repository/session_repo.dart';
import 'package:quiz_app/repository/user_repo.dart';

class SessionCreateScreen extends StatefulWidget {
  const SessionCreateScreen({
    super.key,
  });

  @override
  State<SessionCreateScreen> createState() => _SessionCreateScreenState();
}

class _SessionCreateScreenState extends State<SessionCreateScreen> {
  Session_Repository session_repository = Session_Repository();
  UserRepository repo = UserRepository();
  List<Map<String, dynamic>> SessionUserlist = [];
  List<Map<String, dynamic>> SessionQuestionList = [];
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController right = TextEditingController();
  TextEditingController topic = TextEditingController();
  TextEditingController marks = TextEditingController();
  TextEditingController difficulty = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController delay = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController user = TextEditingController();
  void adduser() {
    int n = int.parse(user.text.toString());
    SessionUserlist.add({"userId": n});
  }

  void add() {
    String Question = question.text.toString();
    String Option1 = option1.text.toString();
    String Option2 = option2.text.toString();
    String Option3 = option3.text.toString();
    String Option4 = option4.text.toString();
    String Category = category.text.toString();
    String Right = right.text.toString();
    String Topic = topic.text.toString();
    String Marks = marks.text.toString();
    String Difficulty = difficulty.text.toString();
    SessionQuestionList.add({
      "question": Question,
      "options1": Option1,
      "options2": Option2,
      "options3": Option3,
      "options4": Option4,
      "category": Category,
      "rightAnswer": Right,
      "topic": Topic,
      "marks": Marks,
      "difficulty": Difficulty,
    });
  }

  void done() {
    print(SessionQuestionList.toString());
  }

  void Create_Session() async {
    int delayduration = int.parse(delay.text.toString());
    int Duration = int.parse(duration.text.toString());
    String Title = title.text.toString();
    user_model token = user_model();
    token = await repo.fetchUserDetails();
    var headers = {
      'Authorization': 'Bearer ${token.token.toString()}',
      'Content-Type': 'application/json',
      'X-API-Key': '{{token}}',
      'Cookie': 'JSESSIONID=B9008C3D6177D56C7126163CCE571606'
    };
    var request = http.Request(
        'POST', Uri.parse('http://34.72.47.13/session/createSession'));
    request.body = json.encode({
      "delayDuration": delayduration,
      "duration": Duration,
      "sessionTitle": Title,
      "sessionQuestionList": SessionQuestionList,
      "sessionUserList": SessionUserlist,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String st = await response.stream.bytesToString();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        st,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainHomeScreen()));
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Welcome!!",
          style:
              GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.4,
            width: width * 0.95,
            child: Lottie.network(
                "https://lottie.host/0afc0b0b-7418-4a2a-8703-15cc4ec74884/JvxK4wYI63.json"),
          ),
          Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Title",
                        labelText: "Title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    controller: title,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Delay Duration",
                        labelText: "Delay Duration",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    controller: delay,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Duration",
                        labelText: "Duration",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    controller: duration,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "User",
                        labelText: "User",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    controller: user,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: SizedBox(
                    width: width * 0.3,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: adduser,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
          TextField(
            decoration: InputDecoration(
                hintText: "Question",
                labelText: "Question",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: question,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Option1",
                labelText: "Option1",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: option1,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Option2",
                labelText: "Option2",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: option2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Option3",
                labelText: "Option3",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: option3,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Option4",
                labelText: "Option4",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: option4,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Category",
                labelText: "Category",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: category,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Right Answer",
                labelText: "Right Answer",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: right,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Topic",
                labelText: "Topic",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: topic,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Marks",
                labelText: "Marks",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: marks,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Difficulty",
                labelText: "Difficulty",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintStyle: const TextStyle(color: Colors.white)),
            controller: difficulty,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: add,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      done();
                    },
                    child: const Icon(
                      Icons.done,
                      size: 40,
                    )),
              ),
            ],
          ),
          SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: Create_Session,
                  child: const Text("Create Session"))),
        ],
      ),
    );
  }
}
