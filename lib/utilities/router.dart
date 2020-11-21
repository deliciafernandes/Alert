import 'package:flutter/material.dart';
import 'package:road_safety/views/homepage.dart';
import 'package:road_safety/views/undefined_vew.dart';
import 'routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kHomePage:
      return MaterialPageRoute(builder: (_) => HomePage());
    // case '/feed':
    //   return MaterialPageRoute(builder: (_) => Feed());
    default:
      return MaterialPageRoute(
        builder: (_) => UndefinedView(pageName: settings.name),
      );
  }
}
