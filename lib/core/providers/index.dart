import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart';
import 'package:venille/data/repositories/user_repository.dart';
import 'package:venille/data/repositories/common_repository.dart';
import 'package:venille/data/services/account/account_service.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/data/services/auth/authentication_service.dart';
// import 'package:venille/data/services/core/firebase_notification_service.dart';

class ServiceRegistry {
  static Dio dioBaseOptions = Dio(BaseOptions(
    baseUrl: dotenv.env['INFRA_BASE_URL']!,
    // baseUrl: dotenv.env['INFRA_PROD_URL']!,
    sendTimeout: const Duration(milliseconds: 15000),
    connectTimeout: const Duration(milliseconds: 15000),
    receiveTimeout: const Duration(milliseconds: 15000),
  ));

  static GetStorage localStorage = GetStorage();
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static UserRepository userRepository = Get.find<UserRepository>();
  static AccountService accountService = Get.find<AccountService>();
  static CommonRepository commonRepository = Get.find<CommonRepository>();
  // static FirebaseNotificationService firebaseNotificationService =
  //     Get.find<FirebaseNotificationService>();
  static AuthenticationService authenticationService =
      Get.find<AuthenticationService>();

  static AuthSdk authSdk = AuthSdk(
    dio: dioBaseOptions,
    basePathOverride: dotenv.env['INFRA_BASE_URL']!,
    // basePathOverride: dotenv.env['INFRA_PROD_URL']!,
  );

  static AccountSdk accountSdk = AccountSdk(
    dio: dioBaseOptions,
    basePathOverride: dotenv.env['INFRA_BASE_URL']!,
    // basePathOverride: dotenv.env['INFRA_PROD_URL']!,
  );
}
