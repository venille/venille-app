import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/core/utilities/appLocale.dart';

class InsecureDashboardContent extends StatelessWidget {
  const InsecureDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontal_20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/icon_empty_inbox.png',
            width: 80,
            height: 80,
          ),
          const SizedBox(height: AppSizes.vertical_30),
          BodyText(
            size: 16,
            weight: FontWeight.w500,
            alignment: TextAlign.center,
            text: '',
          ),
          const SizedBox(height: AppSizes.vertical_30),
          CustomButton(
            text: AppLocale.logIn.getString(context),
            width: 120,
            height: 46,
            fontSize: 16,
            borderRadius: 16,
            onTapHandler: () => Get.toNamed(AppRoutes.loginRoute),
            fontWeight: FontWeight.w600,
            fontColor: AppColors.whiteColor,
            backgroundColor: AppColors.buttonPrimaryColor,
          )
        ],
      ),
    );
  }
}
