import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';

class EmptyResultsContent extends StatelessWidget {
  final double? height;
  final String displayType;
  const EmptyResultsContent(
      {super.key, this.height, required this.displayType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height ?? AppSizes.screenHeight(context) * 0.5,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.horizontal_30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: displayType == 'COMPLETED_ORDERS' ? 65 : 50,
            height: displayType == 'COMPLETED_ORDERS' ? 65 : 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/icon_${displayType == 'NOTIFICATIONS' ? 'bell' : displayType == 'ONBOARDING_QUESTIONS' ? 'survey' : displayType == 'ONGOING_ORDERS' ? 'package' : displayType == 'COMPLETED_ORDERS' ? 'package_open' : displayType == 'FORUM_POSTS' ? 'blog' : displayType == 'COURSES' ? 'books' : displayType == 'SURVEY_HISTORY' ? 'health_check' : 'search_circled'}.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.vertical_10),
          Visibility(
            visible: true,
            child: TitleText(
              size: 20,
              title: displayType == 'FORUM_POSTS'
                  ? 'No Forum Posts'.tr
                  : displayType == 'COURSES'
                      ? 'No Courses'.tr
                      : displayType == 'NOTIFICATIONS'
                          ? 'No New Notifications'.tr
                          : displayType == 'ONGOING_ORDERS'
                              ? 'No Ongoing Orders'.tr
                              : displayType == 'ONBOARDING_QUESTIONS'
                                  ? 'No Onboarding Questions?'.tr
                                  : displayType == 'COMPLETED_ORDERS'
                                      ? 'No Completed Orders'.tr
                                      : displayType == 'SURVEY_HISTORY'
                                          ? 'No Survey History'.tr
                                          : 'No results'.tr,
            ),
          ),
          const SizedBox(height: AppSizes.vertical_5),
          SubtitleText(
            alignment: TextAlign.center,
            text: displayType == 'FORUM_POSTS'
                ? 'You will see your forum posts here once you create one.'.tr
                : displayType == 'COURSES'.tr
                    ? 'No courses available at the moment.'.tr
                    : displayType == 'NOTIFICATIONS'
                        ? 'You will see new notifications here once you have one.'
                            .tr
                        : displayType == 'ONGOING_ORDERS'
                            ? 'No ongoing orders at the moment.'.tr
                            : displayType == 'ONBOARDING_QUESTIONS'
                                ? 'Drag down to refresh!'.tr
                                : displayType == 'COMPLETED_ORDERS'
                                    ? 'No completed orders at the moment.'.tr
                                    : displayType == 'SURVEY_HISTORY'
                                        ? 'No survey history at the moment.'.tr
                                        : 'No results'.tr,
          ),
        ],
      ),
    );
  }
}
