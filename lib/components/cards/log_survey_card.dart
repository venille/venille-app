import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class LogSurveyCard extends StatelessWidget {
  const LogSurveyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.registerSurveyRoute);
      },
      child: Container(
        width: 140,
        height: 160,
        margin: const EdgeInsets.only(
          left: AppSizes.horizontal_10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontal_10,
          vertical: AppSizes.vertical_10,
        ),
        decoration: BoxDecoration(
          color: AppColors.pinkColor.withOpacity(0.1),
          border: Border.all(
            color: AppColors.grayLightColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleText(
              title: 'Take part in Health Survey',
            ),
            Center(
              child: Image.asset(
                'assets/icons/icon_health_check.png',
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      right: AppSizes.horizontal_2,
                    ),
                    child: Icon(
                      (index == 0)
                          ? FluentIcons.error_circle_settings_16_regular
                          : FluentIcons.checkmark_circle_12_regular,
                      size: 14,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
