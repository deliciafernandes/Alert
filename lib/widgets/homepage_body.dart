import 'package:flutter/material.dart';
import 'package:road_safety/utilities/routing_constants.dart';
import 'package:road_safety/widgets/reusable_emergency_container.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

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
    return Padding(
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
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
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
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, kCameraScreen);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30.0, bottom: 15.0),
                  child: Image.asset(
                    'assets/images/camera.png',
                    width: 70.0,
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
    );
  }
}
