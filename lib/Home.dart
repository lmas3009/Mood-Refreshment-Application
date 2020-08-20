import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue[200],
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: FlareActor("assets/icon.flr",color: Colors.white,animation: 'Untitled',fit: BoxFit.scaleDown,),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text("Welcome to your Personal Self Care Assistant",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,color: Colors.white,),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("Hi, Nicky_AI",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child:Text("Login to your Account!", style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,)),
            ),
          ],
        ),
        )
      ),
    );
  }
}