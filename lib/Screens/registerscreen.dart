
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:quiz_app/Screens/loginscreen.dart';
import 'package:quiz_app/api/userapi.dart';
 
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool  _ishidden = true;
  
  
  @override
  Widget build(BuildContext context) {
   
   void toggle()
   {
    setState(() {
      _ishidden= !_ishidden;
    });
   }
   
   TextEditingController usernamecontroller = TextEditingController();
   TextEditingController emailcontroller = TextEditingController();
   TextEditingController passwordcontroller = TextEditingController();

   void registeruser() async{
   if(usernamecontroller.text.isNotEmpty&&emailcontroller.text.isNotEmpty&&passwordcontroller.text.isNotEmpty)
   {
   
   var headers = {
  'X-API-Key': '{{token}}'
};
var request = http.MultipartRequest('POST', Uri.parse(registration));
request.fields.addAll({
  'user': '{\n    "userName":"${usernamecontroller.text}",\n    "email":"${emailcontroller.text}",\n    "password":"${passwordcontroller.text}"\n}'
});

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
              },
            ),content: const Center(child: Text("User Created Sucessfully",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),),);
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LoginScreen()));
}
else {
  print(response.reasonPhrase);
}

   }
   else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
              },
            ),content: const Center(child: Text("enter your details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),),);
   }
   }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
            Image.asset('assets/17973872.jpg',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

              const SizedBox(height: 120,),
              const Center(
              child: Text("Enter your Credentials to register !!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,),),
              ),
               const SizedBox(height: 30,),
               TextField(controller: usernamecontroller,decoration: InputDecoration(hintText:"user name",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: const TextStyle(color: Colors.white)),),
                 const SizedBox(height: 50,),
                 TextField(controller: emailcontroller,decoration: InputDecoration(hintText:"email", border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: const TextStyle(color: Colors.white)),),
                 const SizedBox(height: 50,),
                 TextField(obscureText: _ishidden,controller: passwordcontroller,
                  decoration: InputDecoration(hintText:"password",border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                 ),hintStyle: const TextStyle(color: Colors.white),suffix: IconButton(icon: const Icon(Icons.visibility,),onPressed: toggle,)),),
                 const SizedBox(height: 30,),
                
                 const SizedBox(height: 20,),
                  TextButton(onPressed: (){registeruser();}, child: const Text("register now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,decoration: TextDecoration.underline),)),

              ],
            )
        ],
      ),
    );
  }
}