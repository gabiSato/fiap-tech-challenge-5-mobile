import 'package:go_router/go_router.dart';

import 'package:fiap_farms/ui/auth/create_user/widgets/create_user_screen.dart';
import 'package:fiap_farms/ui/production/widgets/productions_screen.dart';
import 'package:fiap_farms/ui/auth/login/widgets/login_screen.dart';
import 'package:fiap_farms/ui/home/widgets/home_screen.dart';

import 'package:fiap_farms/routing/routes.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.login,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: Routes.userRegistration,
      builder: (context, state) {
        return const CreateUserScreen();
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.productions,
      builder: (context, state) {
        return const ProductionsScreen();
      },
    ),
  ],
);
