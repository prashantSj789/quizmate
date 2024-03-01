import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quiz_app/models/Question_Paper_model.dart';
import 'package:http/http.dart' as http;
class QuestionRepository{
  get http => null;

  Future<Question_paper_model> fetchquestion() async{
   var headers = {
  'X-API-Key': '{{token}}'
};

var dio = Dio();
var response = await dio.request(
  'http://52.66.242.197:8080/question?pageNo=0&pageSize=5&category=java',
  options: Options(
    method: 'GET',
    headers: headers,
  ),
);

if (response.statusCode == 200) {
 Question_paper_model question_paper_model =Question_paper_model.fromJson(response.data);
 return question_paper_model;
}

else {
 throw Exception('failed to load Questions');
}
  }
}

