import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart';

class MenstrualPhaseCard extends StatelessWidget {
  final int index;
  final MenstrualPhaseInfo menstrualPhase;
  const MenstrualPhaseCard({
    super.key,
    required this.index,
    required this.menstrualPhase,
  });

  @override
  Widget build(BuildContext context) {
    Color getColor(int index) {
      switch (index) {
        case 1:
          return const Color.fromARGB(255, 231, 78, 78);
        case 2:
          return const Color.fromARGB(255, 205, 49, 229);
        case 3:
          return const Color.fromARGB(255, 243, 128, 61);
        case 4:
          return const Color.fromARGB(255, 32, 198, 195);
        default:
          return const Color(0xFFECB9EC);
      }
    }

    return InkWell(
      onTap: () {
        ServiceRegistry.userRepository.menstrualPhaseInfo.value =
            menstrualPhase;

        Get.toNamed(AppRoutes.menstrualPhaseDescriptionRoute);
      },
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(
          right: AppSizes.horizontal_10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grayLightColor,
          ),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.grayLightColor.withOpacity(0.35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  // padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: getColor(index),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: BodyText(
                      size: 12,
                      color: AppColors.whiteColor,
                      text: index.toString(),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.horizontal_10),
                TitleText(
                  size: 14,
                  title: menstrualPhase.title,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.vertical_5),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 130,
                width: double.maxFinite,
                child: CachedNetworkImageWidget(
                  boxFit: BoxFit.contain,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  imageUrl: menstrualPhase.coverPhoto,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.vertical_5),
          ],
        ),
      ),
    );
  }
}
