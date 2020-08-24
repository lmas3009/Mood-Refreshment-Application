import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {

  String type_day = "";
  List<Widget> list = [];
  var fb = FirebaseDatabase.instance.reference();
  String name='';
  final FirebaseAuth auth1 = FirebaseAuth.instance;
 
  @override
  void initState() { 
    super.initState();
     final auth.User user =auth1.currentUser;
      final uid = user.email;
      var uid1 = uid.replaceAll("@", "_");
      var uid2 = uid1.replaceAll(".", "-");
    fb.child("Userdetails").child(uid2).once().then((DataSnapshot data){
      var res =data.value;
        setState(() {
          name=res['Username'];
        });
    });
    String type = new DateTime.now().toString();
    type = type.substring(11,13);
    if (int.parse(type)>=1 && int.parse(type)<12){
      setState(() {
        type_day = "Morning";
      });
    } else if(int.parse(type)>=12 && int.parse(type)<16){
      setState(() {
        type_day = "AfterNoon";
      });
    } else if(int.parse(type)>=16 && int.parse(type)<21){
      setState(() {
        type_day = "Evening";
      });
    }
    else{
      setState(() {
        type_day = "Night";
      });
    }
  }

  List<Widget> data() {
    for (int i = 0; i < 5; i++) {
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                list.remove(i);
              },
              child: Container(
              margin: const EdgeInsets.only(left: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Icon(Icons.delete),
                ),
            ),
                InkWell(
                  onTap: (){},
                  child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Icon(Icons.edit_outlined),
                ),
                ),
            Container(
                  height: 80,
                  width: 250,
                  margin: const EdgeInsets.only(top: 20,bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey
                      )
                    ],
                    image: DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTpFiYdmqX1kMS7dgGLBSz3M0hpT9CpfBsyLA&usqp=CAU'),
                      alignment: Alignment.centerRight,
                      
                    )
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text("Name",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                          Text("Date Time",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                          Text("Date Time",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),)
                            ],
                          )
                          ],
                  ),
                  )
                  )
          ],
        )
                );
    }
    return list;
  }
   /*List<Widget> data1() {
    for(var i=0;i<10;i++){
      data.add(
        Container(
                  height: 80,
                  width: 250,
                  margin: const EdgeInsets.only(top: 20,bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey
                      )
                    ]
                  ),
                ));
          }
    return data;
    }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                Container(margin: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(margin: const EdgeInsets.only(top: 30)),
                    Text("Good "+type_day+",",style: TextStyle(fontSize: 20,color: Colors.grey),),
                    Container(margin: const EdgeInsets.only(top: 10)),
                    Text(name,style: TextStyle(fontSize: 20,color: Colors.black),),        
                  ],
                ),),
                /*Container(
                  height: 80,
                  width: 250,
                  margin: const EdgeInsets.only(top: 20,bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey
                      )
                    ]
                  ),
                )*/
                Column(
                  children: data(),
                )
            ],
          ),
        ),
      )
    );
  }
}

