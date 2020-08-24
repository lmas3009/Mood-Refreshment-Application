import 'package:Your_personal/Controller/GridItem.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  Create({Key key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

  List<Item> itemList=[];
  List<Item> selectedList=[];
class _CreateState extends State<Create> {

  String type_day='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadList();
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

class _DetailinfoState extends State<Detailinfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Hello"),
    );
  }
}