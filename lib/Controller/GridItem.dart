import 'package:Your_personal/View/Create.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
   final Key key;
  final Icon item;
  final ValueChanged<bool> isSelected;
  // ignore: non_constant_identifier_names
  GridItem({ this.isSelected, this.key, this.item, Icon Icon});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Container(
        height: 100,
        width: 50,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Stack(
        children: <Widget>[
          Center(
            child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: widget.item,
          ),
          ),
          isSelected
              ? Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Icon(
                Icons.check_circle,
                color: Colors.blue,
              ),
            ),
          )
              : Container()
        ],
      ),
      )
    );
  }
}