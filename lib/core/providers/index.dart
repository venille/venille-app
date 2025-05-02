import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart';
import 'package:venille/data/repositories/user_repository.dart';
import 'package:venille/data/repositories/common_repository.dart';
// import 'package:venille/data/services/vendor/vendor_service.dart';
// import 'package:venille/data/infra_sdk/vendor/lib/vendor_sdk.dart';
// import 'package:venille/data/services/account/account_service.dart';
// import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
// import 'package:venille/data/services/auth/authentication_service.dart';
// import 'package:venille/data/services/core/phone_contacts_service.dart';
// import 'package:venille/data/services/marketplace/marketplace_service.dart';
// import 'package:venille/data/infra_sdk/marketplace/lib/marketplace_sdk.dart';
// import 'package:venille/data/services/core/firebase_notification_service.dart';
// import 'package:venille/data/services/communication/communication_service.dart';
// import 'package:venille/data/infra_sdk/communication/lib/communication_sdk.dart';

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
  // static VendorService vendorService = Get.find<VendorService>();
  static UserRepository userRepository = Get.find<UserRepository>();
  // static AccountService accountService = Get.find<AccountService>();
  static CommonRepository commonRepository = Get.find<CommonRepository>();
  // static MarketplaceService marketplaceService = Get.find<MarketplaceService>();
  // static FirebaseNotificationService firebaseNotificationService =
  //     Get.find<FirebaseNotificationService>();
  // static PhoneContactsService phoneContactsService =
  //     Get.find<PhoneContactsService>();
  // static CommunicationService communicationService =
  //     Get.find<CommunicationService>();
  // static AuthenticationService authenticationService =
  //     Get.find<AuthenticationService>();

  // static AuthSdk authSdk = AuthSdk(
  //   dio: dioBaseOptions,
  //   basePathOverride: dotenv.env['INFRA_BASE_URL']!,
  //   // basePathOverride: dotenv.env['INFRA_PROD_URL']!,
  // );

  // static AccountSdk accountSdk = AccountSdk(
  //   dio: dioBaseOptions,
  //   basePathOverride: dotenv.env['INFRA_BASE_URL']!,
  //   // basePathOverride: dotenv.env['INFRA_PROD_URL']!,
  // );
}
