import 'package:get/route_manager.dart';
import 'package:venille/presentation/dashboard/dashboard.dart';
import 'package:venille/presentation/dashboard/subscreens/cycle_ovulation/cycle_ovulation_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/menstrual_phase/menstrual_phase_description_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/notifications/notifications_screen.dart';
import 'package:venille/presentation/public/splash_screen.dart';
import 'package:venille/presentation/auth/login/login_screen.dart';
import 'package:venille/presentation/auth/signup/signup_screen.dart';
import 'package:venille/presentation/auth/signup/signup_verification_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/orders/orders_screen.dart';
import 'package:venille/presentation/auth/signup/signup_create_password_screen.dart';
import 'package:venille/presentation/auth/forgot_password/reset_password_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/account_screen.dart';
import 'package:venille/presentation/auth/forgot_password/forgot_password_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/support/support_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/orders/order_pad_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/period/log_period_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/help/help_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/about_us/about_us_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/legal/legal_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/survey/survey_history_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/symptoms/log_symptoms_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/contact_us/contact_us_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/survey/register_survey_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/forum/forum_description_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/forum/create_forum_post_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/account_details_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/settings/settings_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/course/course_description_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/delete_account/delete_account_screen.dart';
import 'package:venille/presentation/auth/forgot_password/forgot_password_otp_verification_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/account_name/update_account_name_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/onboarding_questions/onboarding_questions_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/account_email/update_account_email_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/account_password/update_account_password_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/account_email/update_account_verify_email_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/settings/language_settings/language_settings_screen.dart';
import 'package:venille/presentation/dashboard/subscreens/account/account_phone_number/update_account_phone_number_screen.dart';

class AppRoutes {
  /// ROOT_SCREEN_ROUTE
  ///
  /// Navigates to splash screen
  static const String rootRoute = '/';

  /// LOGIN_ROUTE
  ///
  /// Navigates to login screen
  static const String loginRoute = '/LOGIN_ROUTE';

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

  /// DASHBOARD_ROUTE
  ///
  /// Navigates to dashboard screen
  static const String dashboardRoute = '/DASHBOARD_ROUTE';

  /// NOTIFICATIONS_ROUTE
  ///
  /// Navigates to notifications screen
  static const String notificationsRoute = '/NOTIFICATIONS_ROUTE';

  /// LOG_PERIOD_ROUTE
  ///
  /// Navigates to log period screen
  static const String logPeriodRoute = '/LOG_PERIOD_ROUTE';

  /// LOG_SYMPTOMS_ROUTE
  ///
  /// Navigates to log symptoms screen
  static const String logSymptomsRoute = '/LOG_SYMPTOMS_ROUTE';

  /// MENSTRUAL_PHASE_DESCRIPTION_ROUTE
  ///
  /// Navigates to menstrual phase description screen
  static const String menstrualPhaseDescriptionRoute =
      '/MENSTRUAL_PHASE_DESCRIPTION_ROUTE';

  /// ONBOARDING_QUESTIONS_ROUTE
  ///
  /// Navigates to onboarding questions screen
  static const String onboardingQuestionsRoute = '/ONBOARDING_QUESTIONS_ROUTE';

  /// FORUM_DESCRIPTION_SCREEN_ROUTE
  ///
  /// Navigates to forum description screen
  static const String forumDescriptionRoute = '/FORUM_DESCRIPTION_ROUTE';

  /// COURSE_DESCRIPTION_SCREEN_ROUTE
  ///
  /// Navigates to course description screen
  static const String courseDescriptionRoute = '/COURSE_DESCRIPTION_ROUTE';

  /// CREATE_FORUM_POST_SCREEN_ROUTE
  ///
  /// Navigates to create forum post screen
  static const String createForumPostRoute = '/CREATE_FORUM_POST_ROUTE';

  /// ACCOUNT_ROUTE
  ///
  /// Navigates to account screen
  static const String accountRoute = '/ACCOUNT_ROUTE';

  /// ORDERS_ROUTE
  ///
  /// Navigates to orders screen
  static const String ordersRoute = '/ORDERS_ROUTE';

  /// ORDER_PAD_ROUTE
  ///
  /// Navigates to order pad screen
  static const String orderPadRoute = '/ORDER_PAD_ROUTE';

  /// SURVEY_HISTORY_ROUTE
  ///
  /// Navigates to survey history screen
  static const String surveyHistoryRoute = '/SURVEY_HISTORY_ROUTE';

  /// REGISTER_SURVEY_ROUTE
  ///
  /// Navigates to register survey screen
  static const String registerSurveyRoute = '/REGISTER_SURVEY_ROUTE';

  /// SETTINGS_ROUTE
  ///
  /// Navigates to settings screen
  static const String settingsRoute = '/SETTINGS_ROUTE';

  /// LANGUAGE_SETTINGS_ROUTE
  ///
  /// Navigates to language settings screen
  static const String languageSettingsRoute = '/LANGUAGE_SETTINGS_ROUTE';

  /// CONTACT_US_ROUTE
  ///
  /// Navigates to contact us screen
  static const String contactUsRoute = '/CONTACT_US_ROUTE';

  /// HELP_SCREEN_ROUTE
  ///
  /// Navigates to help screen
  static const String helpRoute = '/HELP_ROUTE';

  /// LEGAL_SCREEN_ROUTE
  ///
  /// Navigates to legal screen
  static const String legalRoute = '/LEGAL_ROUTE';

  /// ABOUT_US_SCREEN_ROUTE
  ///
  /// Navigates to about us screen
  static const String aboutUsRoute = '/ABOUT_US_ROUTE';

  /// SUPPORT_SCREEN_ROUTE
  ///
  /// Navigates to support screen
  static const String supportRoute = '/SUPPORT_ROUTE';

  /// ACCOUNT_DETAILS_ROUTE
  ///
  /// Navigates to account details screen
  static const String accountDetailsRoute = '/ACCOUNT_DETAILS_ROUTE';

  /// UPDATE_ACCOUNT_NAME_ROUTE
  ///
  /// Navigates to update account name screen
  static const String updateAccountNameRoute = '/UPDATE_ACCOUNT_NAME_ROUTE';

  /// UPDATE_ACCOUNT_PHONE_NUMBER_ROUTE
  ///
  /// Navigates to update account phone number screen
  static const String updateAccountPhoneNumberRoute =
      '/UPDATE_ACCOUNT_PHONE_NUMBER_ROUTE';

  /// UPDATE_ACCOUNT_EMAIL_ROUTE
  ///
  /// Navigates to update account email screen
  static const String updateAccountEmailRoute = '/UPDATE_ACCOUNT_EMAIL_ROUTE';

  /// UPDATE_ACCOUNT_PASSWORD_ROUTE
  ///
  /// Navigates to update account password screen
  static const String updateAccountPasswordRoute =
      '/UPDATE_ACCOUNT_PASSWORD_ROUTE';

  /// UPDATE_ACCOUNT_VERIFY_EMAIL_ROUTE

  /// UPDATE_ACCOUNT_VERIFY_EMAIL_ROUTE
  ///
  /// Navigates to update account verify email screen
  static const String updateAccountVerifyEmailRoute =
      '/UPDATE_ACCOUNT_VERIFY_EMAIL_ROUTE';

  /// DELETE_ACCOUNT_ROUTE
  ///
  /// Navigates to delete account screen
  static const String deleteAccountRoute = '/DELETE_ACCOUNT_ROUTE';

  /// CYCLE_AND_OVULATION
  ///
  static const String cycleOvulationRoute = '/CYCLE_OVULATION_ROUTE';

  /// Navigate to cycle and ovulation screen
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

    // ONBOARDING QUESTIONS
    GetPage(
      name: onboardingQuestionsRoute,
      page: () => const OnboardingQuestionsScreen(),
    ),

    // NOTIFICATIONS
    GetPage(
      name: notificationsRoute,
      page: () => const NotificationsScreen(),
    ),

    // LOG PERIOD
    GetPage(
      name: logPeriodRoute,
      page: () => const LogPeriodScreen(),
    ),

    // LOG SYMPTOMS
    GetPage(
      name: logSymptomsRoute,
      page: () => const LogSymptomsScreen(),
    ),

    // MENSTRUAL PHASE DESCRIPTION
    GetPage(
      name: menstrualPhaseDescriptionRoute,
      page: () => const MenstrualPhaseDescriptionScreen(),
    ),

    // ORDERS
    GetPage(
      name: ordersRoute,
      page: () => const OrdersScreen(),
    ),

    // ORDER PAD
    GetPage(
      name: orderPadRoute,
      page: () => const OrderPadScreen(),
    ),

    GetPage(
      name: forumDescriptionRoute,
      page: () => const ForumDescriptionScreen(),
    ),

    GetPage(
      name: courseDescriptionRoute,
      page: () => const CourseDescriptionScreen(),
    ),

    GetPage(
      name: createForumPostRoute,
      page: () => const CreateForumPostScreen(),
    ),

    // SURVEY HISTORY
    GetPage(
      name: surveyHistoryRoute,
      page: () => const SurveyHistoryScreen(),
    ),

    // REGISTER SURVEY
    GetPage(
      name: registerSurveyRoute,
      page: () => const RegisterSurveyScreen(),
    ),

    // ACCOUNT
    GetPage(
      name: accountRoute,
      page: () => const AccountScreen(),
    ),

    // ACCOUNT DETAILS
    GetPage(
      name: accountDetailsRoute,
      page: () => const AccountDetailsScreen(),
    ),

    // SETTINGS
    GetPage(
      name: settingsRoute,
      page: () => const SettingsScreen(),
    ),

    // LANGUAGE SETTINGS
    GetPage(
      name: languageSettingsRoute,
      page: () => const LanguageSettingsScreen(),
    ),

    // CONTACT US
    GetPage(
      name: contactUsRoute,
      page: () => const ContactUsScreen(),
    ),

    // HELP
    GetPage(
      name: helpRoute,
      page: () => const HelpScreen(),
    ),

    // LEGAL
    GetPage(
      name: legalRoute,
      page: () => const LegalScreen(),
    ),

    // ABOUT US
    GetPage(
      name: aboutUsRoute,
      page: () => const AboutUsScreen(),
    ),

    // SUPPORT
    GetPage(
      name: supportRoute,
      page: () => const SupportScreen(),
    ),

    // UPDATE ACCOUNT NAME
    GetPage(
      name: updateAccountNameRoute,
      page: () => const UpdateAccountNameScreen(),
    ),

    // UPDATE ACCOUNT PHONE NUMBER
    GetPage(
      name: updateAccountPhoneNumberRoute,
      page: () => const UpdateAccountPhoneNumberScreen(),
    ),

    // UPDATE ACCOUNT EMAIL
    GetPage(
      name: updateAccountEmailRoute,
      page: () => const UpdateAccountEmailScreen(),
    ),

    // UPDATE ACCOUNT PASSWORD
    GetPage(
      name: updateAccountPasswordRoute,
      page: () => const UpdateAccountPasswordScreen(),
    ),

    // UPDATE ACCOUNT VERIFY EMAIL
    GetPage(
      name: updateAccountVerifyEmailRoute,
      page: () => const UpdateAccountVerifyEmailScreen(),
    ),

    // DELETE ACCOUNT
    GetPage(
      name: deleteAccountRoute,
      page: () => const DeleteAccountScreen(),
    ),

    // CYCLE AND OVULATION
    GetPage(name: cycleOvulationRoute, page: () => const CycleOvulationScreen())
  ];
}
