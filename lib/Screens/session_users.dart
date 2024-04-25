import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/Dash_Board_Model.dart';

class SessionUsers extends StatefulWidget {
   SessionUsers({super.key,required this.userList});
  List<SessionUserList>? userList;

  @override
  State<SessionUsers> createState() => _SessionUsersState();
}

class _SessionUsersState extends State<SessionUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session Users"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 660,
            width: 500,
            child: ListView.builder(
              itemCount: widget.userList!.length,itemBuilder: (context,index){
                var usernumber = index+1;
                var username=widget.userList!.elementAt(index).userName;
                var userId=widget.userList!.elementAt(index).userId;
                var isSubmitted=widget.userList!.elementAt(index).completed;
                var sessionrank=widget.userList!.elementAt(index).sessionRank;
                var marks=widget.userList!.elementAt(index).marks;
                var sessionUserId=widget.userList!.elementAt(index).sessionUserId;
                var timestamp=widget.userList!.elementAt(index).submissionTimeStamp;
                return Expansion2(usernumber: usernumber, username: username, userId: userId, isSubmitted: isSubmitted, sessionRank: sessionrank, marks: marks, Session_user_Id: sessionUserId, timeStamp: timestamp);
              }),
          )
        ],
      ),
    );;
  }
}





class Expansion2 extends StatefulWidget {
  const Expansion2({super.key, required this.usernumber, required this.username,required this.userId,required this.isSubmitted,required this.sessionRank,required this.marks,required this.Session_user_Id,required this.timeStamp, });
  final int usernumber;
  final String? username;
  final int? userId;
  final bool? isSubmitted;
  final int? sessionRank;
  final int ? marks;
  final String? Session_user_Id;
  final String? timeStamp;

  @override
  State<Expansion2> createState() => _Expansion2State();
}
class _Expansion2State extends State<Expansion2> {
  @override
  Widget build(BuildContext context) {
    bool customIcon=false;
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
            child: ExpansionTile(title: Text("User:${widget.usernumber}"),                  
            trailing: Icon(customIcon
                      ? Icons.arrow_drop_down_circle
                      : Icons.arrow_drop_down),
                      children: [
                        ListTile(
                          title: Text("Name:${widget.username}"),
                        ),
                        ListTile(
                          title: Text("User Id:${widget.userId}"),
                        ), 
                        ListTile(
                          title: Text("Session Id:${widget.Session_user_Id}"),
                        ),
                        ListTile(
                          title: Text("Completed:${widget.isSubmitted}"),
                        ),
                        ListTile(
                          title: Text("Session Rank:${widget.sessionRank}"),
                        ),
                        ListTile(
                          title: Text("Marks:${widget.marks}"),
                        ),
                        ListTile(
                          title: Text("Time of submission:${widget.timeStamp}"),
                        ),
                        
                      ], ),
          ),  
    );;
  }
}