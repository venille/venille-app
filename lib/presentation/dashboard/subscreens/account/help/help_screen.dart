import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/components/cards/redirect_menu_item_card.dart';
import 'package:venille/core/utilities/appLocale.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // ServiceRegistry.commonRepository.currentScreenIndex.value = 3;

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
                      // ServiceRegistry
                      //     .commonRepository.currentScreenIndex.value = 3;

                      Get.until((route) =>
                          Get.currentRoute == AppRoutes.accountRoute);
                    },
                  ),
                  TitleText(
                    letterSpacing: 0,
                    fontFamily: 'Roboto',
                    title: AppLocale.help.getString(context),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.vertical_5),
              RedirectMenuItemCard(
                routeTo: '',
                title: AppLocale.support.getString(context),
                prefixIcon: 'icon_support',
                suffixIcon: 'icon_chevron_right',
              ),
              RedirectMenuItemCard(
                title: AppLocale.email.getString(context),
                prefixIcon: 'icon_email',
                suffixIcon: 'icon_redirect',
                routeTo: 'support@venille.com.ng',
              ),
              // RedirectMenuItemCard(
              //   title: 'X (Twitter)',
              //   prefixIcon: 'icon_twitter',
              //   suffixIcon: 'icon_redirect',
              //   routeTo: 'https://twitter.com/venille',
              // ),
              const RedirectMenuItemCard(
                title: 'Instagram',
                prefixIcon: 'icon_instagram',
                suffixIcon: 'icon_redirect',
                routeTo: 'https://www.instagram.com/venille_',
              ),
              const RedirectMenuItemCard(
                title: 'Linkedin',
                suffixIcon: 'icon_redirect',
                prefixIcon: 'icon_linkedin',
                routeTo: 'https://www.linkedin.com/company/venille-ng',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
