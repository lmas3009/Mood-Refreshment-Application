import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                   child: Text("Name",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                 ),
               ),
               InkWell(
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
               )
             ],
           ),
           Container(
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
           ),
           Container(margin: const EdgeInsets.only(top: 50),),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Container(alignment: Alignment.bottomCenter,
                    child: Text("Rate this    5-stars",style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                  ),
                ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey
                    )
                 ]
               ),
              ),
             ],
           ),
           Container(
             margin: const EdgeInsets.only(left: 20,top: 30),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey
                )
               ]
              ),
            )
         ],
       ),
    );
  }
}