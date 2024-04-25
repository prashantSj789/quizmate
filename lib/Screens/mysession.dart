

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/dashboard.dart';
import 'package:quiz_app/Screens/session_users.dart';
import 'package:quiz_app/models/Dash_Board_Model.dart';

class MySession extends StatelessWidget {
  const  MySession({super.key,required this.sessionlist});
  final List<SessionList> sessionlist;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Sessions"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 660,
            width: 500,
            child: ListView.builder(
              itemCount: sessionlist.length,itemBuilder: (context,index){
                var sessionnumber = index+1;
                var userlist=sessionlist.elementAt(index).sessionUserList;
                var timeStamp = sessionlist.elementAt(index).startTimeStamp;
                var datetime= sessionlist.elementAt(index).dateAndTime;
                var expiryTimeStamp = sessionlist.elementAt(index).expiryTimeStamp;
                var duration = sessionlist.elementAt(index).duration;
                var title = sessionlist.elementAt(index).sessionTitle;
                return Expansion1(sessionnumber: sessionnumber, sessionUserList: userlist, timeStamp: timeStamp, datetime: datetime, expiryTimeStamp: expiryTimeStamp, duration: duration, title: title);
              }),
          )
        ],
      ),
    );
  }
}
class Expansion1 extends StatefulWidget {
  const Expansion1({super.key, required this.sessionnumber, required this.sessionUserList, required this.timeStamp, required this.datetime, required this.expiryTimeStamp, required this.duration, required this.title});
  final int? sessionnumber;
  final List<SessionUserList>? sessionUserList;
  final String? timeStamp;
  final String? datetime;
  final String? expiryTimeStamp;
  final int? duration;
  final String? title;

  @override
  State<Expansion1> createState() => _Expansion1State();
}

class _Expansion1State extends State<Expansion1> {

 bool customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey),
                BoxShadow(color: Colors.grey),
              ],
            ),
          child: Material(
            color: Colors.white,
            child: ExpansionTile(title: Text("Session:${widget.sessionnumber}"),                  
            trailing: Icon(customIcon
                      ? Icons.arrow_drop_down_circle
                      : Icons.arrow_drop_down),
                      children: [
                        ListTile(
                          title: Text("Title:${widget.title}"),
                        ),
                        ListTile(
                          title: Text("Time:${widget.datetime}"),
                        ), 
                        ListTile(
                          title: Text("expiry time:${widget.expiryTimeStamp}"),
                        ),
                        CustomTile(
                  title: "Session Users",
                  route: SessionUsers(userList: widget.sessionUserList,)
                ),
                      ], ),
          ),  
    );
  }
}
