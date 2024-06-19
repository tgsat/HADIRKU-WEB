import 'package:get/route_manager.dart';
import 'package:hadirku_web/features/authentication/screens/forget_password/forget_password.dart';
import 'package:hadirku_web/features/authentication/screens/login/login.dart';
import 'package:hadirku_web/features/authentication/screens/signup/signup.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/card/account/account_card_large.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/card/change_password/change_password_card_large.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/card/non_active_account/reauth_non_active.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/profile_large.dart';
import 'package:hadirku_web/layout.dart';
import 'package:hadirku_web/utils/helper/routing/routes_name.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: dashboardRoute, page: () => LayoutScreen()),
    GetPage(name: profileRoute, page: () => const ProfileLargeScreen()),
    GetPage(name: profileAccountRoute, page: () => const AccountCardLarge()),
    GetPage(
        name: profileChangePassRoute,
        page: () => const ChangePasswordCardLarge()),
    GetPage(
        name: reAuthRoute, page: () => const ReauthNonActiveAccountCardLarge()),
    GetPage(name: authSignInRoute, page: () => const LoginScreen()),
    GetPage(name: authSignUpRoute, page: () => const SignUpScreen()),
    GetPage(
        name: authForgetPasswordRoute,
        page: () => const ForgetPasswordScreen()),
  ];
}
