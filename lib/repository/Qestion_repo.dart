import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quiz_app/api/userapi.dart';
import 'package:quiz_app/models/Question_Paper_model.dart';
import 'package:http/http.dart' as http;

class QuestionRepository {
  get http => null;

  Future<Question_paper_model> fetchquestion() async {
    var headers = {'X-API-Key': '{{token}}'};

    var dio = Dio();
    var response = await dio.request(
      'http://52.66.242.197:8080/question?pageNo=0&pageSize=5&category=java',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      Question_paper_model questionPaperModel =
          Question_paper_model.fromJson(response.data);
      return questionPaperModel;
    } else {
      throw Exception('failed to load Questions');
    }
  }
}

class QuestionRepository1 {
  Future<dynamic> fetchquestion() async {
    var headers = {'Content-Type': 'application/json', 'X-API-Key': '123445'};
    var data = json.encode([
      {"category": "java", "easy": 2, "medium": 3},
      {"category": "javascript", "easy": 2, "medium": 3, "hard": 2}
    ]);
    var dio = Dio();
    var response = await dio.request(
      'http://3.111.29.168:8080/question/customQuiz',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return (response.data);
    } else {
      print(response.statusMessage);
      throw Exception('failed to load Questions');
    }
  }
}
