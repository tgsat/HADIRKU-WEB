import 'package:hadirku_web/features/authentication/screens/login/login.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../features/display/dashboard/dashboard.dart';
import '../../../features/display/leave/leave.dart';
import '../../../features/display/staffing/staffing.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case authenticationRoute:
      return _getPageRoute(const Center(child: Text('Settings')));
    case dashboardRoute:
      return _getPageRoute(const DashboardScreen());
    case staffingRoute:
      return _getPageRoute(const StaffingScreen());
    case permissionRoute:
      return _getPageRoute(const LeaveScreen());

    default:
      return _getPageRoute(Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ));
  }
}

Route<dynamic> mainGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return _getPageRoute(const Center(child: Text('Home Screen')));
    case aboutRoute:
      return _getPageRoute(const Center(child: Text('About Screen')));
    case authSignInRoute:
      return _getPageRoute(const LoginScreen());

    default:
      return _getPageRoute(Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ));
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
