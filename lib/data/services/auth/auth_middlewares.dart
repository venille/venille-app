// ignore_for_file: library_prefixes
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart'
    as AccountSdk;
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart';

void userLogoutHandler({
  BuildContext? context,
  bool hasContext = false,
  String displayMessage = 'Logged out!',
}) async {
  ServiceRegistry.localStorage.remove(LocalStorageSecrets.accessToken);
  ServiceRegistry.localStorage.remove(LocalStorageSecrets.authenticationMethod);
  ServiceRegistry.googleSignIn.signOut();

  if (hasContext == true) {
    Navigator.of(context!).pop();
  }

  customSuccessMessageSnackbar(
    title: 'Message',
    message: displayMessage,
  );

  ServiceRegistry.userRepository.onboardingQuestions.clear();
  ServiceRegistry.commonRepository.currentScreenIndex.value = 0;

  ServiceRegistry.userRepository.onboardingQuestion.value =
      AccountSdk.OnboardingQuestionInfo(
    (instance) => instance
      ..id = ''
      ..question = ''
      ..enumType = ''
      ..isUserInput = false
      ..position = 0
      ..questionType = ''
      ..optionType = ''
      ..options = ListBuilder<String>(),
  );

  ServiceRegistry.userRepository.dashboardInfo.value = DashboardInfo(
    (instance) => instance
      ..previousCycleInfo = PreviousCycleInfo(
        (instance) => instance
          ..cycleLength = ''
          ..cycleLengthStatus = ''
          ..daysAgo = ''
          ..duration = ''
          ..durationStatus = ''
          ..startDate = '',
      ).toBuilder()
      ..menstrualPhases = ListBuilder<MenstrualPhaseInfo>(),
  );

  Get.toNamed(AppRoutes.loginRoute);

  await Future.delayed(const Duration(milliseconds: 300));

  ServiceRegistry.userRepository.accountInfo.value = AccountSdk.AccountInfo(
    (account) => account
      ..id = '0'
      ..firstName = ''
      ..lastName = ''
      ..phone = ''
      ..email = ''
      ..state = ''
      ..stateArea = ''
      ..isOnboardingUploaded = false
      ..accountType = AccountSdk.AccountInfoAccountTypeEnum.individual
      ..status = AccountSdk.AccountInfoStatusEnum.active
      ..profilePhoto =
          'https://medexer.s3.eu-north-1.amazonaws.com/avatars/avatar.png'
      ..fcmToken = ''
      ..referralCode = '',
  );
}
