import 'package:Your_personal/Main/Navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

TextEditingController _controller = new TextEditingController();
TextEditingController _controller1 = new TextEditingController();

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _controller.text='';
      _controller1.text='';
    });
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
              child:Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: FlareActor("assets/icon.flr",color: Colors.white,animation: 'Untitled',fit: BoxFit.scaleDown,),
                    ),
                    Text("Account Login",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[300],fontSize: 40,fontWeight: FontWeight.bold),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Container(
                            margin: const EdgeInsets.only(top: 100),
                              height: 60,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.white30
                                  )
                                ]
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(top: 5,left: 10,right: 10),
                                child: TextFormField(
                                  controller: _controller,
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Email...",
                                    disabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hoverColor: Colors.red
                                  ),
                              ),
                              )
                            ),
                            Container(
                            margin: const EdgeInsets.only(top: 30),
                              height: 60,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.white30
                                  )
                                ]
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(top: 5,left: 10,right: 10),
                                child: TextFormField(
                                  controller: _controller1,
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password...",
                                    disabledBorder: InputBorder.none,
                                    border: InputBorder.none
                                  ),
                              ),
                              )
                            ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        signInUser().whenComplete(() => 
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Navbar()))
                        );
                      },
                      child: Container(
                      margin: const EdgeInsets.only(top: 100),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1,color: Colors.white,),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("Sign In",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      )
                    )
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future signInUser() async{
    try{
      final auth.User user = (await _auth.signInWithEmailAndPassword(email: _controller.text, password: _controller1.text)).user;
    return user!=null;
    }
    catch(e){
      return e.message;
    }
  }