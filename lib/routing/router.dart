import 'package:go_router/go_router.dart';

import 'package:fiap_farms/ui/production/widgets/productions_screen.dart';
import 'package:fiap_farms/ui/user/widgets/user_registration_screen.dart';
import 'package:fiap_farms/ui/auth/widgets/login_screen.dart';
import 'package:fiap_farms/ui/home/widgets/home_screen.dart';

import 'routes.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: Routes.userRegistration,
      builder: (context, state) {
        return UserRegistrationScreen();
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.productions,
      builder: (context, state) {
        return ProductionsScreen();
      },
    ),
  ],
);
