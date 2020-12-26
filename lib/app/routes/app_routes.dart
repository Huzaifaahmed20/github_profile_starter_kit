import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_profile_starter_kit/ui/screens/home_page.dart';

class AppRoutes {
  static const String home = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildRoute(HomeScreen(), settings);

      default:
        return _buildRoute(Scaffold(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
