import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/Session_Quiz_Screen.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/repository/user_repo.dart';

class JoinSessionscreen extends StatefulWidget {
  const JoinSessionscreen({super.key});

  @override
  State<JoinSessionscreen> createState() => _JoinSessionscreenState();
}

class _JoinSessionscreenState extends State<JoinSessionscreen> {
  UserRepository repo = new UserRepository();
  TextEditingController sid = new TextEditingController();
  TextEditingController suid = new TextEditingController();
  void join() async{
   user_model token = new user_model() ;
  token =  await repo.fetchUserDetails();
    var headers = {
  'Authorization': 'Bearer ${token.token.toString()}',
  'X-API-Key': '{{token}}'
};
var request = http.Request('GET', Uri.parse('http://34.72.47.13/session/session/${sid.text.toString()}'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
if(response.statusCode==400)
{
   String st = await response.stream.bytesToString();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(st)));
}

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Session_Quiz_Screen(Session_Id: sid.text.toString(), Session_user_Id: suid.text.toString())));
}
else {
  print(response.reasonPhrase);
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Session Id",
              hintText: "Session Id",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
            ),
            controller: sid,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Session user Id",
              hintText: "Session user Id",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
            ),
            controller: suid,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: join, child:  Text("Join Now"))
        ],
      ),
    );
  }
}