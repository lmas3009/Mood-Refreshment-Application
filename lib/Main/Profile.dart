import 'package:Your_personal/Home.dart';
import 'package:Your_personal/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

final List<LinearGradient> title = <LinearGradient>[
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.blue,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.orange,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.green,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.violet,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.mango,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.cherry,
  ),
  ];


class _ProfileState extends State<Profile> {

  var fb = FirebaseDatabase.instance.reference();
  String name='';
  final FirebaseAuth auth1 = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
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
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(margin:  const EdgeInsets.only(top: 30),),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                 height: 100,
                 width: 205,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                   boxShadow: [
                     BoxShadow(
                       blurRadius: 5,
                       color: Colors.grey
                     )
                   ]
                 ),
                 child: Center(
                   child: Text(name,style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                 ),
               ),
              /* InkWell(
                 onTap: (){},
                 child: Container(
                   margin: const EdgeInsets.only(right: 40),
                   height: 50,
                   width: 50,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                     boxShadow: [
                       BoxShadow(
                         blurRadius: 5,
                         color: Colors.grey
                       )
                     ]
                   ),
                   child: Center(
                     child: Icon(Icons.settings,size: 30,),
                   ),
                 ),
               )*/
             ],
           ),
           /*Container(
             margin: const EdgeInsets.only(top: 50),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Column(
                 children: [
                   Container(
                    height: 50,
                    width: 50,
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text("Total",textAlign: TextAlign.center,),
                  )
                 ],
               ),
               Column(
                 children: [
                   Container(
                    height: 50,
                    width: 50,
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text("Total",textAlign: TextAlign.center,),
                  )
                 ],
               ),
               Column(
                 children: [
                   Container(
                    height: 50,
                    width: 50,
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text("Total",textAlign: TextAlign.center,),
                  )
                 ],
               ),
             ],  
           ),*/
           Container(margin: const EdgeInsets.only(top: 40),),
           Container(
             margin: const EdgeInsets.all(20),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://patientengagementhit.com/images/site/article_headers/_normal/GettyImages-star-ratings.jpg'),
                    fit: BoxFit.fill
                  ),
                boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey
                )
               ]
              ),
              child: Container(alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 20),
                child: Text("Rate this 5-stars",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white)),
              ),
            ),
           Container(
             margin: const EdgeInsets.all(20),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage("https://thefrylawfirm.com/wp-content/uploads/2017/02/faq-1.jpg"),
                    fit: BoxFit.cover  
                  ),
                boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey
                )
               ]
              ),
              child: Container(alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 20),
                //child: Text("FAQ's",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ),
            ),
            /*InkWell(
              child:Center(
                child:  Container(
                  margin: const EdgeInsets.all(20),
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey[200]
                      )
                    ]
                  ),
                  child: Center(
                    child: Text("Delete This Account",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),textAlign: TextAlign.center,)
                  ),
                ),
              )
            ),*/
            InkWell(
              onTap: (){
                logout(context);
                Navigator.pop(context);
              },
              child:Center(
                child:  Container(
                  margin: const EdgeInsets.all(20),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey[200]
                      )
                    ]
                  ),
                  child: Center(
                    child: Text("LOGOUT",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),textAlign: TextAlign.center,)
                  ),
                ),
              )
            ),
            //CircularProgressIndicator(backgroundColor: Colors.red,)
         ],
       ),
    ),
    );
  }
}

void logout(BuildContext context) async{
  
  await FirebaseAuth.instance.signOut();
  print("User Sign Out");
  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
}