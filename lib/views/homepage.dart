import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 1;

  // List<Widget> _widgetList = [
  //   WhatToDoBody(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xfffafafa),
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: Icon(
          Icons.location_on,
          color: Colors.grey[500],
        ),
        titleSpacing: 0.0,
        title: Text(
          'location', //TODO: add location functionality
          style: TextStyle(color: Colors.grey[500]),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_rounded,
              size: 28,
              color: Color(0xffe45858),
            ),
            onPressed: () {
              //TODO: add map functionality
            },
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Material(
          elevation: 8.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _index,
            backgroundColor: Colors.transparent,
            selectedItemColor: Color(0xffe45858),
            iconSize: 20.0,
            onTap: (int index) {
              setState(() {
                _index = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Feature"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.face),
                  label: ""
                      "Account"),
            ],
          ),
        ),
      ),
    );
  }
}
