import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/data/infra_sdk/engagement/lib/engagement_sdk.dart';

class CourseCard extends StatelessWidget {
  final CourseInfo course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ServiceRegistry.userRepository.courseInfo.value = course;

        Get.toNamed(AppRoutes.courseDescriptionRoute);
      },
      child: Container(
        width: 200,
        height: 250,
        margin: const EdgeInsets.only(right: AppSizes.horizontal_10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          image: DecorationImage(
            image: NetworkImage(
              course.coverPhoto,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.grayColor.withOpacity(0.3),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
              stops: const [0.6, 1.0],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubtitleText(
                weight: FontWeight.w600,
                text: course.title,
                color: Colors.white,
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                'Tap to learn more'.tr,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
