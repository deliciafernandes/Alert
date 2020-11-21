import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          'location',
          style: TextStyle(color: Colors.grey[500]),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_rounded,
              size: 28,
              color: Color(0xffe45858),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
