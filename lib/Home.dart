import 'package:Your_personal/Login%20Screens/create_Acc.dart';
import 'package:Your_personal/Login%20Screens/signin.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool animated = false;
  bool animated1 = false;
  double marginTop = 10;
  double opacity = 0;
  double opacity1 = 0;

  double _height = 50;
  double _height1 = 10;
  double _width = 50;
  double _width1 = 10;

   @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () { 
      setState(() {
        _width= 200;
        _height= 200;
        _width1= 250;
        _height1= 50;
        opacity = 0.5;
      });
      Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = 1;
        opacity1 = 0.3;
        animated=true;
      });
    });
      Future.delayed(Duration(seconds: 2), () {
      setState(() {
        opacity1 = 1;
        animated1=true;
      });
    });
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue[200],
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(opacity: opacity,
            child:AnimatedContainer(
              duration: Duration(seconds: 1),
              height: _width,
              width: _height,
              curve: Curves.elasticInOut,
              child: FlareActor("assets/icon.flr",color: Colors.white,animation: 'Untitled',fit: BoxFit.scaleDown,),
            ),
            ),
            Opacity(opacity: opacity,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: animated? TextStyle(color: Colors.white,fontSize: 30,fontWeight:FontWeight.bold) : TextStyle(color: Colors.white,fontSize: 0,fontWeight:FontWeight.bold),
              child: Text("Welcome to your Personal Self Care Assistant",textAlign: TextAlign.center,),
            ),
            ),
            ),
            Opacity(opacity: opacity1,
            child:AnimatedContainer(
              duration: Duration(seconds: 1),
           child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Createacc()));},
             child: Container(
              margin: const EdgeInsets.only(top: 150),
              width: _width1,
              height: _height1,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,color: Colors.white,),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("Hi, Nicky_AI",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              )
            ),
           )
            ),
            ),
            Opacity(opacity: opacity,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                },
                child:  AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: animated1? TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.bold) : TextStyle(color: Colors.white,fontSize: 0,fontWeight:FontWeight.bold),
              child: Text("Login to your Account!",textAlign: TextAlign.center,),
            ),
            ),
            ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
            ),
          ],
        ), 
        )
      ),
    );
  }
}