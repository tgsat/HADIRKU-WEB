import 'package:hadirku_web/utils/utils.dart';

class NavBarModels {
  final String name;
  final String route;

  NavBarModels(this.name, this.route);
}

List<NavBarModels> navBarMenuItemRoutes = [
  NavBarModels(homeDisplayName, initialRoute),
  NavBarModels(aboutDisplayName, aboutRoute),
];
