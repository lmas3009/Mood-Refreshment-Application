import 'package:Your_personal/Home.dart';
import 'package:Your_personal/Main/Navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   @override 
  void initState() {
    super.initState();
      Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
    Future.delayed(Duration(seconds: 10), () {
      
    final auth.User user =FirebaseAuth.instance.currentUser;
      final uid = user.email;
      if(uid==null){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
      }
      else{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Navbar(),
          ));
      }
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body:FlareActor("assets/icon.flr", alignment:Alignment.center,color: Colors.white,animation: 'Untitled',fit: BoxFit.scaleDown,),
    );
  }
}
