import 'package:flutter/material.dart';
import 'package:road_safety/utilities/constants.dart';
import 'package:road_safety/views/account.dart';
import 'package:road_safety/widgets/homepage_body.dart';
import "./nearby_hospital_screen.dart";

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 2;

  List<Widget> _widgetList = [
    NearbyHospitalScreen(),
    HomePageBody(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xfffafafa),
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: Icon(
          Icons.location_on,
          color: Colors.grey[400],
        ),
        titleSpacing: 0.0,
        title: Text(
          'Andheri East, Mumbai.', //TODO: add location functionality
          style: TextStyle(color: Colors.grey[400], fontSize: 18.0),
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
      body: _widgetList[_index],
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
