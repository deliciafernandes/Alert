import 'package:flutter/material.dart';
import 'package:road_safety/views/camera_screen.dart';
import 'package:road_safety/views/mainPage.dart';
import 'package:road_safety/views/login_screen.dart';
import 'package:road_safety/views/register_screen.dart';
import 'package:road_safety/views/undefined_vew.dart';
import 'routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kMainPage:
      return MaterialPageRoute(builder: (_) => MainPage());
    case kCameraScreen:
      return MaterialPageRoute(builder: (_) => CameraScreen());
    case kLoginScreen:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case kRegisterScreen:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => UndefinedView(pageName: settings.name),
      );
  }
}
