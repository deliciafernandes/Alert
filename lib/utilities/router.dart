import 'package:flutter/material.dart';
import 'package:road_safety/views/camera_screen.dart';
import 'package:road_safety/views/homepage.dart';
import 'package:road_safety/views/undefined_vew.dart';
import 'routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kHomePage:
      return MaterialPageRoute(builder: (_) => HomePage());
    case kCameraScreen:
      return MaterialPageRoute(builder: (_) => CameraScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => UndefinedView(pageName: settings.name),
      );
  }
}
