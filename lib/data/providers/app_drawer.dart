import 'package:flutter/material.dart';

class AppDrawerProvider extends ChangeNotifier {
  final scafoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get key => scafoldKey;
}
