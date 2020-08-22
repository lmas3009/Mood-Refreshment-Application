import 'package:Your_personal/Home.dart';
import 'package:Your_personal/Main/Home.dart';
import 'package:flutter/material.dart';
import 'package:ss_bottom_navbar/ss_bottom_navbar.dart';

class Navbar extends StatefulWidget {
  Navbar({Key key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
 
 int _index = 0;
  bool _isVisible = true;

  var _colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.teal];
  var items = [
    SSBottomNavItem(text: 'Add', iconData: Icons.add, isIconOnly: true),
    SSBottomNavItem(text: 'Home', iconData: Icons.home),
    SSBottomNavItem(text: 'Profile', iconData: Icons.person_outline),
    SSBottomNavItem(text: 'Graphs', iconData: Icons.graphic_eq),
  ];

  @override
  Widget build(BuildContext context) {
    _page(Color color) => Container(color: color);

    _buildPages() => _colors.map((color) => _page(color)).toList();

    _bottomSheet() => Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Use Camera'),
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('Your total Spent'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Write a Story'),
            onTap: () {
              Navigator.maybePop(context);
            },
          ),
        ],
      ),
    );

  final _pageopt=[
    Homepage(),
    Homepage(),
    Homepage(),
    Homepage(),
  ];

    return Scaffold(
      bottomNavigationBar: SSBottomNav(
        items: items,
        color: Colors.black,
        selectedColor: Colors.white,
        unselectedColor: Colors.black,
        visible: _isVisible,
        bottomSheetWidget: _bottomSheet(),
        showBottomSheetAt: 0,
        onTabSelected: (index) {
          print(index);
          setState(() {
            _index = index;
          });
        },
      ),
      body: _pageopt[_index],
    );
  }
}