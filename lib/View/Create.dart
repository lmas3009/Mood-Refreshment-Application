import 'package:Your_personal/Controller/GridItem.dart';
import 'package:Your_personal/Main/Navbar.dart';
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
    itemList.add(Item('sentiment_dissatisfied_outlined', 1));
    itemList.add(Item('sentiment_neutral', 2));
    itemList.add(Item('sentiment_satisfied', 3));
    itemList.add(Item('sentiment_very_dissatisfied', 4));
    itemList.add(Item('sentiment_very_satisfied', 5));
    itemList.add(Item('self_improvement', 6));
    itemList.add(Item('outdoor_grill', 7));
    itemList.add(Item('mood_bad', 8));
    itemList.add(Item('fitness_center', 9));
    itemList.add(Item('hot_tub', 10));
    itemList.add(Item('two_wheeler', 11));
    itemList.add(Item('music_note', 12));
    itemList.add(Item('movie_creation', 13));
    itemList.add(Item('directions_bike', 14));
    itemList.add(Item('directions_boat', 15));
    itemList.add(Item('directions_walk', 16));
    itemList.add(Item('directions_run', 17));
   /* itemList.add(Item(Icon(Icons.sentiment_very_dissatisfied), 4));
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
    itemList.add(Item(Icon(Icons.directions_run), 17));*/
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
  String icon;
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


class _DetailinfoState extends State<Detailinfo> {

  String count='0';
  int count1=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text='';
    _controller1.text='';
    
    
  }
  String date = new DateTime.now().toString().substring(11,19);
  String date1 = new DateTime.now().toString().substring(0,19).replaceAll(" ", "_");
  Submitmoment(){
    final auth.User user =auth1.currentUser;
    final uid = user.email;   
    var email = uid.toString().replaceAll('@', "_");
 var email1 = email.replaceAll('.', "-");
 print(email1);
 print(uid);
    var _firebasedata = FirebaseDatabase().reference().child(email1).child(date1);
    print(date1);
    
    var _firebasedata1 = FirebaseDatabase().reference().child(email1);
    
      _firebasedata.set(
        {
          "Title":_controller.text
        }
      );
      _firebasedata.update(
        {
          "Title": _controller.text,
          "Info": _controller1.text,
          "Icons": selectedList.length.toString()

        }
      );
        for(var i=0;i<selectedList.length;i++){
         _firebasedata.update(
           {
             'icon'+i.toString(): selectedList[i].icon
           }
         ) ;
        }
     
        count=(count1+1).toString();
        count1+=1;
        this.setState(() {
          count1=count1;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Navbar()));
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
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child:Container(
                      margin: const EdgeInsets.all(20),
                      child: Text("Back",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    )
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Navbar()));
                    },
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

 List<Widget> listofemoji(){
List<Widget> lis = [];
  for(var i=0;i<selectedList.length;i++){
    lis.add(Icon(getIconForName(selectedList[i].icon)));
  }
  return lis;
}





   