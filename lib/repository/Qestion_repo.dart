import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quiz_app/api/userapi.dart';
import 'package:quiz_app/models/Question_Paper_model.dart';
import 'package:http/http.dart' as http;



class QuestionRepository {
  Future<Question_Paper_Model> fetchquestion(String category1,int e1,int m1,int h1) async {
    Question_Paper_Model question_paper_model ;
    var headers = {'Content-Type': 'application/json', 'X-API-Key': '123445'};
    var data = json.encode([
      {"category": category1, "easy": e1, "medium": m1, "hard":h1},
     
    ]);
    var dio = Dio();
    var response = await dio.request(
      '$baseUrl/question/customQuiz',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
       //print(json.encode(response.data));
      question_paper_model= Question_Paper_Model.fromJson(response.data);
      print(question_paper_model.questionList?.elementAt(0).question);
      return question_paper_model;
    } else {
      print(response.statusMessage);
      throw Exception('failed to load Questions');
    }
  }
}