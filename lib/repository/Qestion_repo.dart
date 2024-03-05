import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quiz_app/api/userapi.dart';
import 'package:quiz_app/models/Question_Paper_model.dart';
import 'package:http/http.dart' as http;



class QuestionRepository {
  Future<dynamic> fetchquestion(String category1,int e1,int m1,int h1) async {
    var headers = {'Content-Type': 'application/json', 'X-API-Key': '123445'};
    var data = json.encode([
      {"category": "$category1", "easy": e1, "medium": m1, "hard":h1},
     
    ]);
    var dio = Dio();
    var response = await dio.request(
      'http://15.206.90.238:8080/question/customQuiz',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      // print(json.encode(response.data));
      return (response.data);
    } else {
      print(response.statusMessage);
      throw Exception('failed to load Questions');
    }
  }
}
