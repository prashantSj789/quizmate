import 'dart:convert';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:quiz_app/api/userapi.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/models/Score_Card_Model.dart';
import 'package:quiz_app/models/user_model.dart';

class UserRepository {
  Future<user_model> fetchUserDetails() async {
    user_model User_Model;
    print('entered');
    var headers = {
      'Content-Type': 'application/json',
      'X-API-Key': '{{token}}'
    };
    var data = json.encode({
      "userName": userName,
      "email": email,
      "password": password,
    });
    var dio = Dio();
    var response = await dio.request(
      '$baseUrl/user/auth',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
    print("Response code =${response.statusCode}");

    if (response.statusCode == 200) {
      print('completed');
      print(user_model.fromJson(response.data).toString());
      User_Model = user_model.fromJson(response.data);
      return User_Model;
    } else {
      print(response.statusMessage);
      throw Exception('failed to load user data');
    }
  }

  Future<dynamic> fetchUserDetails1(String token1, int userId) async {
    print('enter fetchUser1');
    var headers = {
      'Authorization': 'Bearer $token1',
      'Content-Type': 'application/json',
      'X-API-Key': '{{token}}'
    };

    var dio = Dio();
    var response = await dio.request(
      '$baseUrl/user/user/${userId}',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return response.data;
    } else {
      print(response.statusMessage);
    }
  }

  Future<Score_Card_Model> responsesunbmit(
      String token,
      int totalQuestion,
      int maximumMarks,
      List<Map<String, dynamic>> list,
      String category) async {
    Score_Card_Model scorecard;
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'X-API-Key': '{{token}}'
    };
    var data = json.encode({
      "responseList": list,
      "totalQuestion": totalQuestion,
      "maximumMarks": maximumMarks,
      "category": category
    });
    print(jsonDecode(data).toString());
    var dio = Dio();
    var response = await dio.request(
      '$baseUrl/user/response',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      //print(json.encode(response.data));
      scorecard = Score_Card_Model.fromJson(response.data);
      print(scorecard.responseList.toString());
      return scorecard;
    } else {
      print(response.statusMessage);
      throw Exception('failed to submit response');
    }
  }
}
