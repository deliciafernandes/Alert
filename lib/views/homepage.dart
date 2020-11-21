import 'package:flutter/material.dart';
import 'package:road_safety/widgets/reusable_emergency_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation _animation;
  int _index = 1;

  // List<Widget> _widgetList = [
  //   WhatToDoBody(),
  // ];
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FadeTransition(
                    opacity: _animationController
                        .drive(CurveTween(curve: Curves.easeOut)),
                    child: Material(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 40.0),
                        decoration: BoxDecoration(
                          color: Color(0xffe8f4fa),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Text(
                          'Emergency Drill',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: [
                      ReusableEmergencyContainer(emergency: 'Ambulance'),
                      ReusableEmergencyContainer(emergency: 'Fire'),
                      ReusableEmergencyContainer(emergency: 'Police'),
                      ReusableEmergencyContainer(emergency: 'Road Accident'),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      //TODO: add camera functionality
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30.0, bottom: 15.0),
                      child: Image.asset(
                        'assets/images/camera.png',
                        width: 80.0,
                        fit: BoxFit.contain,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffFCEDEE),
                            blurRadius: _animation.value * 4.5,
                            spreadRadius: _animation.value * 1.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text('Tap in case of an emergency',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black26, fontSize: 15)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Container bottomNavBar() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
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
    );
  }
}
