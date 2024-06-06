import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/cupertino.dart';

/// [Dashboard]
Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: dashboardRoute,
    );
