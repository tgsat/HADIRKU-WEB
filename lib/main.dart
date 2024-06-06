import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hadirku_web/firebase_options.dart';
import 'package:hadirku_web/utils/helper/controller/menu_controler.dart'
    as menu_controller;
import 'package:hadirku_web/utils/helper/routing/app_routes.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:provider/provider.dart';

import 'bindings/general_bindings.dart';
import 'data/providers/app_drawer.dart';
import 'data/repositories/authentication/authentication_repository.dart';

void main() async {
  /// -- Initialize Firebase & Autentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  Get.put(menu_controller.MenuController());
  Get.put(NavigationController());
  setUrlStrategy(PathUrlStrategy());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppDrawerProvider()),
      ],
      child: GetMaterialApp(
          initialRoute: authSignInRoute,
          initialBinding: GeneralBindings(),
          getPages: AppRoutes.pages,
          unknownRoute: GetPage(
              name: '/not-found',
              page: () => const ErrorScreen(),
              transition: Transition.fadeIn),
          debugShowCheckedModeBanner: false,
          title: 'HADIRKU',
          theme: AppTheme.appTheme),
    );
  }
}
