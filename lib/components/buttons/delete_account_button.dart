import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/core/utilities/appLocale.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('[HANDLE-DELETE-ACCOUNT]');

        Get.toNamed(AppRoutes.deleteAccountRoute);
      },
      overlayColor: WidgetStateProperty.all(
        Colors.transparent,
      ),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.vertical_16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon_trash.png',
                  width: 18,
                  color: AppColors.redColor,
                ),
                const SizedBox(width: AppSizes.horizontal_10),
                SubtitleText(
                  text: AppLocale.deleteMyAccount.getString(context),
                  weight: FontWeight.w500,
                  color: AppColors.redColor,
                ),
              ],
            ),
            const Icon(
              FluentIcons.chevron_right_12_regular,
              size: 16,
              color: AppColors.redColor,
            ),
          ],
        ),
      ),
    );
  }
}
