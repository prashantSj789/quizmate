import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/Screens/homeScreen.dart';
import 'package:quiz_app/Screens/registerscreen.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/api/userapi.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: non_constant_identifier_names
   TextEditingController emailController= new TextEditingController();
   TextEditingController passwordController= new TextEditingController();
   TextEditingController usernamecontroller= new TextEditingController();
  
  
  void loginuser() async {
    if(usernamecontroller.text.isNotEmpty&&emailController.text.isNotEmpty&&passwordController.text.isNotEmpty)
    {
         var headers = {
  'Content-Type': 'application/json',
  'X-API-Key': '{{token}}',
  'Cookie': 'JSESSIONID=34879FB541F23470E5BDA421E1905218'
};
var request = http.Request('POST', Uri.parse(login));
request.body = json.encode({
  "userName": "${usernamecontroller.text}",
  "email": "${emailController.text}",
  "password": "${passwordController.text}"
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainHomeScreen()));
}
else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
              },
            ),content: Center(child: Text("${response.reasonPhrase}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),),);
}
    }
    else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
              },
            ),content: Center(child: Text("Enter you details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),),);
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset('assets/WhatsApp Image 2024-02-08 at 00.24.20.jpeg',height: double.infinity,width: double.infinity,fit: BoxFit.contain,),
          Column(
             
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
                  SizedBox(height: 50,),
                 Center(
                   child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
                      shadowColor: Colors.black,
                      child: Icon(Icons.lock,size: 80,),
                    ),
                   ),
                 ),
                 SizedBox(height: 50,),
                 TextField(decoration: InputDecoration(hintText:"user name",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: TextStyle(color: Colors.white)),
                 controller: usernamecontroller,),
                 SizedBox(height: 50,),
                 TextField(decoration: InputDecoration(hintText:"email",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: TextStyle(color: Colors.white)),
                 controller: emailController,),
                 SizedBox(height: 50,),
                 TextField(decoration: InputDecoration(hintText:"password",border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50) 
                 ),hintStyle: TextStyle(color: Colors.white)),
                 controller: passwordController,),
                 SizedBox(height: 50,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(child: ElevatedButton(onPressed: loginuser, child: Text("log in",style: TextStyle(fontSize: 20),)),height: 50,width: 200,)
                  ],
                 ),
                 SizedBox(height: 20,),
                 Center(child: Text("Don't have an account yet?",style: TextStyle(fontSize: 25),)),
                 SizedBox(height: 20,),
                 TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));}, child: Text("register now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,decoration: TextDecoration.underline),))
                 
            ],
          )

        ],
      ),
    );
  }
}