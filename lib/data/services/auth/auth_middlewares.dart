// ignore_for_file: library_prefixes
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';

void userLogoutHandler({
  BuildContext? context,
  bool hasContext = false,
  String displayMessage = 'Logged out!',
}) async {
  ServiceRegistry.localStorage.remove(LocalStorageSecrets.accessToken);
  ServiceRegistry.localStorage
      .remove(LocalStorageSecrets.authenticationMethod);
  ServiceRegistry.googleSignIn.signOut();

  if (hasContext == true) {
    Navigator.of(context!).pop();
  }

  customSuccessMessageSnackbar(
    title: 'Message',
    message: displayMessage,
  );

  ServiceRegistry.commonRepository.currentScreenIndex.value = 0;

  Get.toNamed(AppRoutes.loginRoute);

  await Future.delayed(const Duration(milliseconds: 300));

  // ServiceRegistry.userRepository.accountInfo.value = AccountSdk.AccountInfo(
  //   (account) => account
  //     ..id = '0'
  //     ..firstName = ''
  //     ..lastName = ''
  //     ..phoneNumber = ''
  //     ..email = ''
  //     ..state = ''
  //     ..city = ''
  //     ..avatar =
  //         'https://animaff.s3.eu-north-1.amazonaws.com/avatars/avatar.png'
  //     ..role = AccountSdk.AccountInfoRoleEnum.CUSTOMER
  //     ..status = AccountSdk.AccountInfoStatusEnum.active
  //     ..referralCode = ''
  //     ..isProfileUpdated = false
  //     ..isAccountDisabled = false
  //     ..isProductUploadSubscriptionActive = false,
  // );
}
