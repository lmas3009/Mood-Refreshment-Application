import 'package:Your_personal/View/Create.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
   final Key key;
  final String item;
  final ValueChanged<bool> isSelected;
  // ignore: non_constant_identifier_names
  GridItem({ this.isSelected, this.key, this.item});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  

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
            child: Icon(getIconForName(widget.item)),
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