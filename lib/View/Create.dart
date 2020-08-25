import 'package:Your_personal/Controller/GridItem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class Create extends StatefulWidget {
  Create({Key key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

  List<Item> itemList=[];
  List<Item> selectedList=[];
  String type = new DateTime.now().toString();
  String type1 = type.substring(11,13);
  String type2 = type.substring(0,19);
  String type_day='';
class _CreateState extends State<Create> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
    loadList();
    
    if (int.parse(type1)>=1 && int.parse(type1)<12){
      setState(() {
        type_day = "Morning";
      });
    } else if(int.parse(type1)>=12 && int.parse(type1)<16){
      setState(() {
        type_day = "AfterNoon";
      });
    } else if(int.parse(type1)>=16 && int.parse(type1)<21){
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

  loadList() {
    itemList = List();
    selectedList = List();
    itemList.add(Item(Icon(Icons.sentiment_dissatisfied_outlined), 1));
    itemList.add(Item(Icon(Icons.sentiment_neutral), 2));
    itemList.add(Item(Icon(Icons.sentiment_satisfied), 3));
    itemList.add(Item(Icon(Icons.sentiment_very_dissatisfied), 4));
    itemList.add(Item(Icon(Icons.sentiment_very_satisfied), 5));
    itemList.add(Item(Icon(Icons.self_improvement), 6));
    itemList.add(Item(Icon(Icons.outdoor_grill), 7));
    itemList.add(Item(Icon(Icons.mood_bad), 8));
    itemList.add(Item(Icon(Icons.fitness_center), 9));
    itemList.add(Item(Icon(Icons.hot_tub), 10));
    itemList.add(Item(Icon(Icons.two_wheeler), 11));
    itemList.add(Item(Icon(Icons.music_note), 12));
    itemList.add(Item(Icon(Icons.movie_creation), 13));
    itemList.add(Item(Icon(Icons.directions_bike), 14));
    itemList.add(Item(Icon(Icons.directions_boat),15));
    itemList.add(Item(Icon(Icons.directions_walk), 16));
    itemList.add(Item(Icon(Icons.directions_run), 17));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        child: Container(
        child: Center(
          child: Column(
          children: [
            Container(
                height: 200,
                width: 200,
                child: FlareActor("assets/icon.flr",color: Colors.white,animation: 'Untitled',fit: BoxFit.scaleDown,),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text("Hi, How is your "+type_day+" ! going on?",style: TextStyle(fontSize: 25,color: Colors.grey[200],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              height: 300,
              child:  GridView.builder(
                itemCount: itemList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,),
                itemBuilder: (context, index) {
                  return 
                 GridItem(
                  item: itemList[index].icon,
                  isSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedList.add(itemList[index]);
                      } else {
                        selectedList.remove(itemList[index]);
                      }
                    });
                    print("$index : $value");
                    print(selectedList);
                  },
                  key: Key(itemList[index].rank.toString()));
                  }),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailinfo()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 50),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1,color: Colors.white,),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                  child: Text("Continue",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                )
              )
            )
          ],
        ),
        )
      ),
      )
    );
  }
}

class Item {
  Icon icon;
  int rank;

  Item(this.icon, this.rank);
}


class Detailinfo extends StatefulWidget {
  Detailinfo({Key key}) : super(key: key);

  @override
  _DetailinfoState createState() => _DetailinfoState();
}

TextEditingController _controller = new TextEditingController();
TextEditingController _controller1 = new TextEditingController();
 final FirebaseAuth auth1 = FirebaseAuth.instance;
final auth.User user =auth1.currentUser;
final uid = user.email;
var email = uid.toString().replaceAll('@', "_");
 var email1 = email.replaceAll('.', "-");
class _DetailinfoState extends State<Detailinfo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text='';
    _controller1.text='';
    
  }
  Submitmoment(){
    var _firebasedata = FirebaseDatabase().reference().child(email1).child(_controller.text);
      _firebasedata.set(
        {
          "Title": _controller.text,
          "Info": _controller1.text,
        }
      );
        for(var i=0;i<selectedList.length;i++){
         _firebasedata.update(
           {
             'icon'+i.toString(): selectedList[i].icon.toString()
           }
         ) ;
        }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10
              )
            ]
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child:Container(
                      margin: const EdgeInsets.all(20),
                      child: Text("Back",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    )
                  ),
                  InkWell(
                    child:Container(
                      margin: const EdgeInsets.all(20),
                      child: Text("Cancel",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    )
                  )
                ],
              ),
               Container(
                height: 150,
                width: 150,
                child: FlareActor("assets/icon.flr",color: Colors.blue,animation: 'Untitled',fit: BoxFit.scaleDown,),
              ),
              Text(type2,style: TextStyle(fontSize: 20,color: Colors.black),),
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                  controller: _controller,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Title for a moment...",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hoverColor: Colors.red
                  ),
                ),
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 120,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                  controller: _controller1,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: "Some Information...",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hoverColor: Colors.red
                  ),
                ),
                )
              ) ,
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: listofemoji(),
              ),
              ),
              InkWell(
                onTap: (){
                  Submitmoment();
                },
              child:Container(
                height: 60,
                width: 250,
                margin: const EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Save Moment",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              )
              )
            ],
          ),
        ),
      )
    );
  }
} 
 List<Widget> listofemoji(){
List<Widget> lis = [];
  for(var i=0;i<selectedList.length;i++){
    lis.add(selectedList[i].icon);
  }
  return lis;
}





   