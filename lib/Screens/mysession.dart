import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/Dash_Board_Model.dart';

class MySession extends StatelessWidget {
  const  MySession({super.key,required this.sessionlist});
  final List<SessionList> sessionlist;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Sessions"),
      ),
    );
  }
}