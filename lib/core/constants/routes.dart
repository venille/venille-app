import 'package:get/route_manager.dart';
import 'package:venille/presentation/auth/forgot_password/forgot_password_otp_verification_screen.dart';
import 'package:venille/presentation/auth/forgot_password/forgot_password_screen.dart';
import 'package:venille/presentation/auth/forgot_password/reset_password_screen.dart';
import 'package:venille/presentation/auth/signup/signup_create_password_screen.dart';
import 'package:venille/presentation/auth/signup/signup_screen.dart';
import 'package:venille/presentation/auth/signup/signup_verification_screen.dart';
import 'package:venille/presentation/dashboard/dashboard.dart';
import 'package:venille/presentation/public/splash_screen.dart';
import 'package:venille/presentation/auth/login/login_screen.dart';

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

  /// FORGOT_PASSWORD_SCREEN_ROUTE
  ///
  /// Navigates to forgot password screen
  static const String forgotPasswordRoute = '/FORGOT_PASSWORD_ROUTE';

  /// FORGOT_PASSWORD_OTP_VERIFICATION_SCREEN_ROUTE
  ///
  /// Navigates to forgot password otp verification screen
  static const String forgotPasswordOtpVerificationRoute =
      '/FORGOT_PASSWORD_OTP_VERIFICATION_ROUTE';

  /// RESET_PASSWORD_SCREEN_ROUTE
  ///
  /// Navigates to reset password screen
  static const String resetPasswordRoute = '/RESET_PASSWORD_ROUTE';

  /// SIGN_UP_SCREEN_ROUTE
  ///
  /// Navigates to sign up screen
  static const String signUpRoute = '/SIGN_UP_ROUTE';

  /// SIGNUP CREATE PASSWORD SCREEN_ROUTE
  ///
  /// Navigates to sign up create password screen
  static const String signUpCreatePasswordRoute =
      '/SIGN_UP_CREATE_PASSWORD_ROUTE';

  /// SIGN_UP_VERIFICATION_SCREEN_ROUTE
  ///
  /// Navigates to sign up verification screen
  static const String signUpVerificationRoute = '/SIGN_UP_VERIFICATION_ROUTE';

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

    // SIGNUP
    GetPage(
      name: signUpRoute,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: signUpCreatePasswordRoute,
      page: () => const SignupCreatePasswordScreen(),
    ),
    GetPage(
      name: signUpVerificationRoute,
      page: () => const SignupVerificationScreen(),
    ),

    // FORGOT PASSWORD
    GetPage(
      name: forgotPasswordRoute,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: forgotPasswordOtpVerificationRoute,
      page: () => const ForgotPasswordOtpVerificationScreen(),
    ),
    GetPage(
      name: resetPasswordRoute,
      page: () => const ResetPasswordScreen(),
    ),

    // DASHBOARD
    GetPage(
      name: dashboardRoute,
      page: () => const Dashboard(),
    ),
  ];
}
