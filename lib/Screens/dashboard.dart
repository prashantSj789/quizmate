import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Screens/myquiz.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/repository/user_repo.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key, required this.username, required this.password, required this.email});
   final String username;
 final String password;
 final String email;
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var response;
  var response1;
  List<dynamic> result = [];

  @override
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      callfunction();
    });
  }

  Future<void> callfunction() async {
    print('enter');

    UserRepository repo = UserRepository();
    response = await repo.fetchUserDetails;
    token = response.toString();

    response1 = await repo.fetchUserDetails1(token);
    result=response1['resultList'];
    print(result);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "DashBoard",
          style:
              GoogleFonts.rye(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.blueAccent,
      ),
      // body: Center(
      //   child: Container(
      //     decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      //     child: Image.network('https://pics.craiyon.com/2023-08-06/7bc5b0ccdd4d4576a03ecd52815ae1bc.webp')),
      // ),
      body: response1 != null
          ? Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              InfoTile(
                content: response1['userName'],
                tileName: "Name: ",
              ),
              InfoTile(
                content: response1['email'],
                tileName: "EMail: ",
              ),
              InfoTile(
                content: response1['totalMarks'].toString(),
                tileName: "Total Marks: ",
              ),
              InfoTile(
                content: response1['userRank'].toString(),
                tileName: "User Rank: ",
              ),
              CustomTile(
                title: "Quizes List",
                route: MyQuizes(resultList: response1['resultList']),
              ),
              CustomTile(
                title: "Session List",
                route: MyQuizes(resultList: result),
              ),
            ])
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.tileName,
    this.content,
  });

  final String tileName;
  final content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      height: 60,
      width: double.infinity,
      color: Colors.grey,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              tileName,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              content,
              style: const TextStyle(
                color: Colors.black,
                // fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.title,
    required this.route,
  });

  final String title;
  final route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey),
                BoxShadow(color: Colors.grey),
              ],
            ),
            child: Material(
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => route));
                },
                child: ListTile(
                    iconColor: Colors.black,
                    // leading: Icon(icon),
                    title: Text(title),
                    trailing: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => route),
                        );
                      },
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
