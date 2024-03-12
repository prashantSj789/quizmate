import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quiz_app/api/userapi.dart';
import 'package:quiz_app/const.dart';

class UserRepository{
Future<dynamic> fetchUserDetails() async {
  print('entered');
var headers = {
  'Content-Type': 'application/json',
  'X-API-Key': '{{token}}'
};
var data = json.encode({
  "userName": 'Shubhang-Shukla',
  "email": 'shubhangshukla001@gmail.com',
  "password": '123456789'
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
  // print(json.encode(response.data));
  // print(response.data['token']);
  return response.data['token'];
}
else {
  print(response.statusMessage);
}
}



Future<dynamic> fetchUserDetails1( String token1) async {
  var headers = {
  'Authorization': 'Bearer $token1',
  'Content-Type': 'application/json',
  'X-API-Key': '{{token}}'
};
var data = json.encode({
  "responseList": [
    {
      "id": 21,
      "rightAnswer": "Through method overloading and overriding"
    },
    {
      "id": 22,
      "rightAnswer": "It refers to the current instance of the object"
    },
    {
      "id": 23,
      "rightAnswer": "It is the starting point of every Java programdgfsgs"
    }
  ],
  "totalQuestion": 5,
  "category": "Java"
});
var dio = Dio();
var response = await dio.request(
  '$baseUrl/user/user/503',
  options: Options(
    method: 'GET',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
  return response.data;
}
else {
  print(response.statusMessage);
}
}
}