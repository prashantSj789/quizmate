import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Screens/QuizScreen.dart';
import 'package:quiz_app/Screens/ScoreCard.dart';
import 'package:quiz_app/Screens/custom_quiz_generatre.dart';
import 'package:quiz_app/Screens/homeScreen.dart';
import 'package:quiz_app/Screens/loginscreen.dart';
import 'package:quiz_app/widgets/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context)=> UiProvider()..init(),
      child: Consumer<UiProvider>(
        builder: (context,UiProvider notifier,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Deo',
            themeMode: notifier.isDark? ThemeMode.dark : ThemeMode.light,

            darkTheme: notifier.isDark? notifier.darkTheme : notifier.lightTheme,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: const Color.fromARGB(255, 42, 27, 61),
                 iconTheme: const IconThemeData(color:Colors.white),
                 titleTextStyle: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.bold,fontSize:20)
              ),
              inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.black)
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            
            home:const LoginScreen(),
          );
        }
      ),
    );
  }
}

