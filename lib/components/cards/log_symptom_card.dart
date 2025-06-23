import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';

class LogSymptomCard extends StatelessWidget {
  const LogSymptomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (ServiceRegistry
                .userRepository.dashboardTrackerCurrentDay.value.date.day >
            DateTime.now().day) {
          return customErrorMessageSnackbar(
            title: 'Message',
            message: 'You can only log symptoms for the next day',
          );
        }

        Get.toNamed(AppRoutes.logSymptomsRoute);
      },
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          // color: AppColors.orangeColor.withOpacity(0.2),
          border: Border.all(
            color: AppColors.orangeColor,
          ),
          borderRadius: BorderRadius.circular(16),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 5,
          //     offset: const Offset(0, 5),
          //     color: AppColors.orangeColor.withOpacity(0.06),
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: AppSizes.vertical_5),
            Image.asset(
              'assets/icons/icon_menstruation.png',
              width: 80,
              height: 60,
            ),
            const SizedBox(height: AppSizes.vertical_5),
            const TitleText(
              title: 'Log symptoms',
            ),
            const SizedBox(height: AppSizes.vertical_5),
            const Icon(Icons.add_circle),
            const SizedBox(height: AppSizes.vertical_5),
          ],
        ),
      ),
    );
  }
}
