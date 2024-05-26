import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hadirku_web/features/authentication/screens/forget_password/forget_password.dart';
import 'package:hadirku_web/firebase_options.dart';
import 'package:hadirku_web/layout.dart';
import 'package:hadirku_web/utils/helper/controller/menu_controler.dart'
    as menu_controller;
import 'package:hadirku_web/utils/utils.dart';

import 'features/authentication/screens/login/login.dart';
import 'features/authentication/screens/signup/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(menu_controller.MenuController());
  Get.put(NavigationController());
  setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: initialRoute,
        // onGenerateRoute: generateRoute,
        unknownRoute: GetPage(
            name: '/not-found',
            page: () => const ErrorScreen(),
            transition: Transition.fadeIn),
        getPages: [
          GetPage(
              name: initialRoute,
              page: () {
                return LayoutScreen();
              }),
          GetPage(name: authenticationRoute, page: () => const LoginScreen()),
          GetPage(name: authSignUpRoute, page: () => const SignUpScreen()),
          GetPage(
              name: authForgetPasswordRoute,
              page: () => const ForgetPasswordScreen()),
        ],
        debugShowCheckedModeBanner: false,
        title: 'HADIRKU',
        theme: AppTheme.appTheme
        // home: AuthenticationPage(),
        );
  }
}
