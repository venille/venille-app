import 'package:get/route_manager.dart';
import 'package:venille/presentation/auth/login_screen.dart';
import 'package:venille/presentation/dashboard/dashboard.dart';
import 'package:venille/presentation/public/splash_screen.dart';

class AppRoutes {
  /// ROOT_SCREEN_ROUTE
  ///
  /// Navigates to splash screen
  static const String rootRoute = '/';

  /// LOGIN_ROUTE
  ///
  /// Navigates to login screen
  static const String loginRoute = '/LOGIN_ROUTE';

  /// DASHBOARD_ROUTE
  ///
  /// Navigates to dashboard screen
  static const String dashboardRoute = '/DASHBOARD_ROUTE';

  static List<GetPage> routes = [
    // PUBLIC
    GetPage(
      name: rootRoute,
      page: () => const SplashScreen(),
    ),

    // DASHBOARD
    GetPage(
      name: loginRoute,
      page: () => const LoginScreen(),
    ),

    // DASHBOARD
    GetPage(
      name: dashboardRoute,
      page: () => const Dashboard(),
    ),
  ];
}
