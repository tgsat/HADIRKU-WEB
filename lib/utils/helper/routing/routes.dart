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
      return _getPageRoute(const DashboardScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
