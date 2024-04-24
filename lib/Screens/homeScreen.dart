import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:quiz_app/Screens/custom_quiz_generatre.dart';
import 'package:quiz_app/Screens/dashboard.dart';
import 'package:quiz_app/Screens/join_session_screen.dart';
import 'package:quiz_app/Screens/session_screen.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/widgets/drawer.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({
    super.key,
  });

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
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          )),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: const Drawer(
          child: DrawerBox(),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.45,
              width: width * 0.95,
              child: Lottie.asset("assets/Animation - 1705686383000.json"),
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
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DashBoard(
                                          username: userName,
                                          password: password,
                                          email: email,
                                        ))),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => JoinSessionscreen()));
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
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SessionCreateScreen()));
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
