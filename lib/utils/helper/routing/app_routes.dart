import 'package:get/route_manager.dart';
import 'package:hadirku_web/features/authentication/screens/forget_password/forget_password.dart';
import 'package:hadirku_web/features/authentication/screens/login/login.dart';
import 'package:hadirku_web/features/authentication/screens/signup/signup.dart';
import 'package:hadirku_web/layout.dart';
import 'package:hadirku_web/utils/helper/routing/routes_name.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: dashboardRoute, page: () => LayoutScreen()),
    GetPage(name: authSignInRoute, page: () => const LoginScreen()),
    GetPage(name: authSignUpRoute, page: () => const SignUpScreen()),
    GetPage(
        name: authForgetPasswordRoute,
        page: () => const ForgetPasswordScreen()),
  ];
}
