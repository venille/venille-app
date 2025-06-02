// ignore_for_file: unused_local_variable
import 'package:get/get.dart';
import 'package:venille/core/themes/theme_provider.dart';
import 'package:venille/data/repositories/user_repository.dart';
import 'package:venille/data/repositories/common_repository.dart';
import 'package:venille/data/services/account/account_service.dart';
import 'package:venille/data/services/auth/authentication_service.dart';
import 'package:venille/data/services/engagement/engagement_service.dart';
import 'package:venille/data/services/core/firebase_notification_service.dart';

class RootRepository extends GetxController {
  initialize() {
    // ThemeProvider themeProvider =
    Get.put(ThemeProvider());

    // CommonRepository commonRepository =
    Get.put(CommonRepository());

    // PhoneContactsService phone contacts service =
    // Get.put(PhoneContactsService());

    FirebaseNotificationService firebaseNotificationService =
        Get.put(FirebaseNotificationService());

    // UserRepository userRepository =
    Get.put(UserRepository());

    AuthenticationService authenticationService =
        Get.put(AuthenticationService());

    AccountService accountService = Get.put(AccountService());

    EngagementService engagementService = Get.put(EngagementService());
  }
}
