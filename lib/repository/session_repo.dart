import 'dart:convert';
import 'dart:ffi';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/api/userapi.dart';
import 'package:quiz_app/models/SessionModel.dart';
import 'package:quiz_app/models/session_scorecard_model.dart';
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
  'http://43.205.68.79/session/session/${SessionId}',
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
  Future<Session_Score_card> submitsessionrespone(String token,String SessionId,String sessionUserId,List<Map<String,dynamic>> list)  async {
    Session_Score_card session_score_card = new Session_Score_card();
var headers = {
  'Authorization': 'Bearer ${token}',
  'Content-Type': 'application/json',
  'X-API-Key': '{{token}}'
};
var data = json.encode({
  "responseList": list,
  "sessionId": "${SessionId}",
  "sessionUserId": "${sessionUserId}"
});
var dio = Dio();
var response = await dio.request(
  'http://43.205.68.79/session/sessionResponse',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
  session_score_card=Session_Score_card.fromJson(response.data);
  return session_score_card;
}
else {
  print(response.statusMessage);
  throw Exception("failed to Submit Result");
}
  }
}

