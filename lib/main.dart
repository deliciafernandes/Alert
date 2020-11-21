import 'package:flutter/material.dart';
import 'package:road_safety/utilities/app_theme.dart';
import 'package:road_safety/utilities/routing_constants.dart';
import 'utilities/router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: router.generateRoute,
      initialRoute: kHomePage,
    );
  }
}
