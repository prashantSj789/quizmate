import 'dart:convert';
import 'dart:ffi';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/api/userapi.dart';
import 'package:quiz_app/models/SessionModel.dart';
import 'package:quiz_app/models/user_model.dart';

class Session_Repository{
  Future<Session_Model> fetchsession(String token,String SessionId) async{
    Session_Model session_model = new Session_Model();
var headers = {
  'Authorization': 'Bearer ${token}',
  'X-API-Key': '{{token}}'
};
var dio = Dio();
var response = await dio.request(
  'http://34.72.47.13/session/session/${SessionId}',
  options: Options(
    method: 'GET',
    headers: headers,
  ),
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
  session_model=Session_Model.fromJson(response.data);
  print(session_model.sessionQuestionList!.elementAt(0).toString());
  return session_model;
}
else {
  print(response.statusMessage);
  throw Exception('Failed to Session');
}
  }
}

