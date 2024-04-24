import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:quiz_app/Screens/custom_quiz_generatre.dart';
import 'package:quiz_app/Screens/dashboard.dart';
import 'package:quiz_app/Screens/join_session_screen.dart';
import 'package:quiz_app/Screens/loginscreen.dart';
import 'package:quiz_app/Screens/session_screen.dart';
import 'package:quiz_app/const.dart';


class MainHomeScreen extends StatefulWidget {
   MainHomeScreen({super.key, });

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Welcome!!",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color:Colors.white,
              fontSize:30),
          )),
         iconTheme: IconThemeData(color:Colors.white),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 42, 27, 61),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Edit Profile'),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.45,
              width: width * 0.95,
              child:  Lottie.asset("assets/Animation - 1705686383000.json"),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: height * 0.45,
                  width: width * 0.95,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: Card(
                            shadowColor: Colors.black,
                            color: Colors.blueAccent,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomQuizScreen()));
                              },
                              child: Stack(
                                children: [
                                  Center(
                                      child: Opacity(
                                          opacity: 0.1,
                                          child: Image.asset(
                                            "assets/clipboard-question-icon.png",
                                            fit: BoxFit.fill,
                                          ))),
                                  const Center(
                                    child: Text(
                                      "Attempt Quiz",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: InkWell(
                            onTap: () =>  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                       DashBoard(username:userName, password: password, email: email,))),
                            child: Card(
                              shadowColor: Colors.black,
                              color: Colors.amberAccent,
                              child: Stack(
                                children: [
                                  Center(
                                      child: Opacity(
                                          opacity: 0.1,
                                          child: Image.asset(
                                            "assets/dashboard.png",
                                            fit: BoxFit.fill,
                                          ))),
                                  const Center(
                                    child: Text(
                                      "DashBoard",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>JoinSessionscreen()));
                            },
                            child: Card(
                              shadowColor: Colors.black,
                              color: Colors.purpleAccent,
                              child: Stack(
                                children: [
                                  Center(
                                      child: Opacity(
                                          opacity: 0.1,
                                          child: Image.asset(
                                            "assets/ranking.png",
                                            fit: BoxFit.fill,
                                          ))),
                                  const Center(
                                    child: Text(
                                      "Join a Session",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SessionCreateScreen()));
                            },
                            child: Card(
                              shadowColor: Colors.black,
                              color: Colors.pinkAccent,
                              child: Stack(
                                children: [
                                  Center(
                                      child: Opacity(
                                          opacity: 0.1,
                                          child: Image.asset(
                                            "assets/video.png",
                                            fit: BoxFit.fill,
                                          ))),
                                  const Center(
                                    child: Text(
                                      "Create Session",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
