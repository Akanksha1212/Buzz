import 'package:buzz/Screens/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:buzz/Screens/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Home(),
    Profile(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xff7ccccc),
        // animationDuration: Duration(seconds: 1),
        // animationCurve: Curves.easeInOut,
        items: <Widget>[
          Icon(
            Icons.play_arrow,
            size: 35,
            color: Color(0xff7ccccc),
          ),
          Icon(
            Icons.add,
            size: 35,
            color: Color(0xff7ccccc),
          ),
          Icon(
            Icons.person,
            size: 35,
            color: Color(0xff7ccccc),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
