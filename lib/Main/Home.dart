import 'dart:ui';

import 'package:Your_personal/Main/Navbar.dart';
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
  var fb = FirebaseDatabase.instance.reference();
  String name='';
  final FirebaseAuth auth1 = FirebaseAuth.instance;
  int counts=0;
  List<Widget> lis=[];
  List<Widget> lis1=[];
  String date ='';

  @override
  void initState() { 
    super.initState();
     final auth.User user =auth1.currentUser;
     print(user.email);
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
    
 IconData getIconForName(String iconName) {
      switch(iconName) {
        case 'sentiment_dissatisfied_outlined': {
        return Icons.sentiment_dissatisfied_outlined;
        }
        break;

        case 'sentiment_neutral': {
          return Icons.sentiment_neutral;
        }
        break;

        case 'sentiment_satisfied': {
          return Icons.sentiment_satisfied;
        }
        break;

        case 'sentiment_very_dissatisfied': {
          return Icons.sentiment_very_dissatisfied;
        }
        break;

        case 'sentiment_very_satisfied': {
          return Icons.sentiment_very_satisfied;
        }
        break;

        case 'self_improvement': {
          return Icons.self_improvement;
        }
        break;

        case 'outdoor_grill': {
          return Icons.outdoor_grill;
        }
        break;

        case 'mood_bad': {
          return Icons.mood_bad;
        }
        break;

        case 'fitness_center': {
          return Icons.fitness_center;
        }
        break;

        case 'hot_tub': {
          return Icons.hot_tub;
        }
        break;

        case 'two_wheeler': {
          return Icons.two_wheeler;
        }
        break;

        case 'music_note': {
          return Icons.music_note;
        }
        break;

        case 'movie_creation': {
          return Icons.movie_creation;
        }
        break;

        case 'directions_bike': {
          return Icons.directions_bike;
        }
        break;

        case 'directions_boat': {
          return Icons.directions_boat;
        }
        break;

        case 'directions_walk': {
          return Icons.directions_walk;
        }
        break;

        case 'directions_run': {
          return Icons.directions_run;
        }
        break;

        default: {
          return Icons.home;
        }
      }
    }

       
    lis=[];
      var res;
    fb.child(uid2).once().then((DataSnapshot data){
       res =data.value;
        Map<dynamic, dynamic> fridgesDs = res;
//    print(fridgesDs.runtimeType);
    fridgesDs.forEach((key, value) {
    lis1=[];
    DateTime dateTimeCreatedAt = DateTime.parse(key.toString().substring(0,10)); 
    DateTime dateTimeNow = DateTime.now();
    final differenceInDays = dateTimeNow.difference(dateTimeCreatedAt).inDays;
    print(differenceInDays);
    if(differenceInDays==0){
      this.setState(() {
      date='Now';
    });
    }
    else{
      this.setState(() {
      date=differenceInDays.toString()+" days ago";
    });
    }
      for(var i=0;i<int.parse(value['Icons']);i++){
        lis1.add(Icon(getIconForName(value["icon"+i.toString()])));
      } 
      lis.add(
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: InkWell(
              onTap: (){
                fb.child(uid2).child(key).remove();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Navbar()));
              },
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
                  child: Icon(Icons.delete),
                ),
            ),
              ),
                /*InkWell(
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
                ),*/
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
                    /*image: DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTpFiYdmqX1kMS7dgGLBSz3M0hpT9CpfBsyLA&usqp=CAU'),
                      alignment: Alignment.centerRight,
                      
                    )*/
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Row(
                            children: [
                              Text(value['Title'],style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                              Container(margin: const EdgeInsets.only(left: 20) ),
                              Text(key.toString().substring(11,19),style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold),),
                              Container(margin: const EdgeInsets.only(left: 20) ),
                              Text(date,style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold),),
                              
                            ],
                          ),
                          Row(
                            children: listofemoji(),
                          ),
                          
                        ],
                    ),
                  )
                  )
          ],
        )
         );
         
    });
    
 
       /*for(var i=0;i<=int.parse(res['length']);i++){
         //print(res);
         lis.add(
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
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
                          Text(res[i.toString()]['Title'],style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
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
       }*/
  });
  }

  
List<Widget> userdata(){
  print(lis);
  return lis;
}

List<Widget> listofemoji(){
  print(lis1);
  return lis1;
}



  /*  List<Widget> lis=List();

  List<Widget> userdata(){
    var fb = FirebaseDatabase.instance.reference();
    final auth.User user =auth1.currentUser;
      final uid = user.email;
      var uid1 = uid.replaceAll("@", "_");
      var uid2 = uid1.replaceAll(".", "-");
      var res;
    fb.child(uid2).once().then((DataSnapshot data){
       res =data.value;
       
    lis=[];
       for(var i=0;i<=int.parse(res['length']);i++){
         //print(res);
         lis.add(
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
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
                          Text(res[i.toString()]['Title'],style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
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
       print(lis);
      
    });
    return lis;
  }
*//*
  List<Widget> data() {
  List<Widget> list = [];
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
  }*/
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
                  children: userdata(),
                )
            ],
          ),
        ),
      )
    );
  }
}
