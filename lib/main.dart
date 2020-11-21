import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:road_safety/utilities/app_theme.dart';
import 'package:road_safety/utilities/routing_constants.dart';
import 'utilities/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AlertApp());
}

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
      initialRoute: kMainPage,
      // initialRoute: kLoginScreen,
      // initialRoute: kRegisterScreen,
    );
  }
}
