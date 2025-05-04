// ignore_for_file: library_prefixes
import 'package:get/get.dart';
import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart' as AuthSdk;
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart'
    as AccountSdk;

class UserRepository extends GetxController {
  Rx<AccountSdk.AccountInfo> accountInfo = AccountSdk.AccountInfo(
    (account) => account
      ..id = '0'
      ..firstName = ''
      ..lastName = ''
      ..phone = ''
      ..email = ''
      ..state = ''
      ..stateArea = ''
      ..accountType = AccountSdk.AccountInfoAccountTypeEnum.individual
      ..status = AccountSdk.AccountInfoStatusEnum.active
      ..profilePhoto =
          'https://medexer.s3.eu-north-1.amazonaws.com/avatars/avatar.png'
      ..fcmToken = ''
      ..referralCode = '',
  ).obs;

  final RxList<AccountSdk.NotificationInfo> _notifications =
      <AccountSdk.NotificationInfo>[].obs;
  RxList<AccountSdk.NotificationInfo> get notifications => _notifications;

  final RxList<AuthSdk.AvailableStateInfo> _availableStates =
      <AuthSdk.AvailableStateInfo>[].obs;
  RxList<AuthSdk.AvailableStateInfo> get availableStates => _availableStates;

  RxInt notificationsCurrentPage = 1.obs;
  RxBool notificationsHasNextPage = false.obs;
}
