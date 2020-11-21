import 'package:flutter/material.dart';
import 'package:road_safety/utilities/app_theme.dart';
import 'package:road_safety/utilities/routing_constants.dart';
import 'utilities/router.dart' as router;

class AlertApp extends StatefulWidget {
  @override
  _AlertAppState createState() => _AlertAppState();
}

class _AlertAppState extends State<AlertApp> {
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
