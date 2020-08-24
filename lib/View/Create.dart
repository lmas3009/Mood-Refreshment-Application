import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  Create({Key key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {

  List<Item> itemList;
  List<Item> selectedList;
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
    itemList.add(Item(Icon(Icons.emoji_emotions), 1));
    itemList.add(Item(Icon(Icons.emoji_events), 2));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
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
              child: Text("Hi how are you doing this "+type_day+" !",style: TextStyle(fontSize: 25,color: Colors.grey[200],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),
            Container(
              height: 200,
              width: 200,
              child:  GridView.builder(
          itemCount: itemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.56,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          itemBuilder: (context, index) {
            return 
            itemList[index].icon;
          }),
            )
          ],
        ),
        )
      ),
    );
  }
}

class Item {
  Icon icon;
  int rank;

  Item(this.icon, this.rank);
}