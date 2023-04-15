import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginfire/screens/home.dart';
import 'package:loginfire/screens/signup.dart';
//import 'package:loginfire/ProfileSc.dart';
import 'dart:ui';

import 'package:loginfire/screens/signup.dart';

void main() async{
  final FirebaseOptions options= FirebaseOptions(apiKey: "AIzaSyBtttA0eeIKRL-iPuV0nHtQPfJn97vwuHw",
  authDomain: "loginpage-f2d53.firebaseapp.com",
  projectId: "loginpage-f2d53",
  storageBucket: "loginpage-f2d53.appspot.com",
  messagingSenderId: "245599982556",
  appId: "1:245599982556:web:00b0ed6c9c00266932b519");
 
    await  Firebase.initializeApp(options: options);



  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
     debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp =await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
       body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Login();
          }
          return const Center(child: CircularProgressIndicator(),
          );
        },
        ), );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});
 
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> 
{
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
      user = credential.user;
      print(user);
      
    }
    on FirebaseAuthException catch(e)
    {
      if(e.code=="user-not-found")
      {
        print("no user found");
        
      }else{
        print(e.toString());
      }
      }
      return user;

    }
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController=TextEditingController();
    TextEditingController _passwordController=TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("LOGIN PAGE"),
          ),
          backgroundColor: Colors.teal,
        ),
        body: 
         Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              // ignore: prefer_const_constructors
              child: const Text(
                'FLUTTER LOGIN',
                // ignore: unnecessary_const
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15.0),
              // ignore: prefer_const_constructors
              child: const Text(
                'Sign in',
                // ignore: unnecessary_const
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                child: const Text("login"),
                onPressed: () async{
                  User? user= await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                  print(user);
                  if(user!=null)
                  {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Home()));
                  }
                },
                
                  
        
              ),
            ),
            // ignore: sort_child_properties_last
            Row(children: [
              const Text('Does not have an account?'),
              TextButton(
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SignUp())),
              ),
            ],
             mainAxisAlignment: MainAxisAlignment.center),
          ],
        ),
      ),
    );
  }
}

