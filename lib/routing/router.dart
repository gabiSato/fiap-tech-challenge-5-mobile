import 'package:go_router/go_router.dart';

import 'package:fiap_farms/ui/auth/create_user/widgets/create_user_screen.dart';
import 'package:fiap_farms/ui/production/widgets/productions_screen.dart';
import 'package:fiap_farms/ui/product/widgets/product_list_screen.dart';
import 'package:fiap_farms/ui/auth/login/widgets/login_screen.dart';
import 'package:fiap_farms/ui/home/widgets/home_screen.dart';

import 'package:fiap_farms/routing/routes.dart';
import 'package:fiap_farms/routing/redirect_notifier.dart';

final RedirectNotifier redirectNotifier = RedirectNotifier();

GoRouter router = GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  refreshListenable: redirectNotifier,
  redirect: (context, state) {
    final isAuthenticated = redirectNotifier.isAuthenticated;

    final publicRoutes = [Routes.login, Routes.userRegistration];

    final isPublicRoute = publicRoutes.contains(state.matchedLocation);

    if (!isAuthenticated && !isPublicRoute) {
      return Routes.login;
    }

    if (isAuthenticated && isPublicRoute) {
      return Routes.home;
    }

    return null;
  },
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
      path: Routes.products,
      builder: (context, state) {
        return const ProductListScreen();
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
