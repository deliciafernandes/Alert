import 'package:flutter/material.dart';
import 'package:road_safety/utilities/constants.dart';
import 'package:road_safety/widgets/homepage_body.dart';
import "./nearby_hospital_screen.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 1;

  List<Widget> _widgetList = [
    NearbyHospitalScreen(),
    // HomePageBody(),
    HomePageBody(),
    HomePageBody(),
  ];

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
              color: kMainRed,
            ),
            onPressed: () {
              //TODO: add map functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: _widgetList[_index],
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Container bottomNavBar() {
    return Container(
      margin: EdgeInsets.only(left: 55.0, right: 55.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Material(
        elevation: 3.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _index,
          backgroundColor: Colors.transparent,
          selectedItemColor: kMainRed,
          iconSize: 20.0,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital), label: "Hospitals"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.face), label: "Account"),
          ],
        ),
      ),
    );
  }
}
