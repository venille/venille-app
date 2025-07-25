import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/components/cards/account_detail_menu_item_card.dart';
import 'package:venille/core/utilities/appLocale.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // ServiceRegistry.commonRepository.currentScreenIndex.value = 3;

        // Get.back();

        Get.until((route) => Get.currentRoute == AppRoutes.accountRoute);

        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SafeArea(
            // padding: MediaQuery.of(context).padding,
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.horizontal_15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    callBackFunction: () {
                      ServiceRegistry
                          .commonRepository.currentScreenIndex.value = 3;

                      // Get.back();

                      Get.until((route) =>
                          Get.currentRoute == AppRoutes.accountRoute);
                    },
                  ),
                  TitleText(
                    letterSpacing: 0,
                    fontFamily: 'Roboto',
                    title: AppLocale.profileDetails.getString(context),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontal_15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSizes.vertical_10),
                    AccountDetailMenuItemCard(
                      title: AppLocale.accountName.getString(context),
                      prefixIcon: 'icon_user',
                      suffixIcon: 'icon_edit',
                      routeTo: AppRoutes.updateAccountNameRoute,
                      value:
                          '${ServiceRegistry.userRepository.accountInfo.value.lastName} ${ServiceRegistry.userRepository.accountInfo.value.firstName}',
                    ),
                    AccountDetailMenuItemCard(
                      title: AppLocale.phoneNumber.getString(context),
                      suffixIcon: 'icon_edit',
                      prefixIcon: 'icon_phone',
                      value: ServiceRegistry
                          .userRepository.accountInfo.value.phone,
                      routeTo: AppRoutes.updateAccountPhoneNumberRoute,
                    ),
                    AccountDetailMenuItemCard(
                      title: AppLocale.email.getString(context),
                      suffixIcon: 'icon_edit',
                      prefixIcon: 'icon_email',
                      routeTo: AppRoutes.updateAccountEmailRoute,
                      value: ServiceRegistry
                          .userRepository.accountInfo.value.email,
                    ),
                    const Divider(color: AppColors.grayLightColor),
                    const SizedBox(height: AppSizes.vertical_20),
                    AccountDetailMenuItemCard(
                      value: '',
                      isTextColumn: false,
                      title: AppLocale.changePassword.getString(context),
                      suffixIcon: 'icon_chevron_right',
                      prefixIcon: 'icon_security_lock',
                      routeTo: AppRoutes.updateAccountPasswordRoute,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
