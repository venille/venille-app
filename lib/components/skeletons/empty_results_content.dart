import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/profile_appbar.dart';
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
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/icon_${displayType == 'FORUM_POSTS' ? 'blog' : displayType == 'COURSES' ? 'books' : 'search_circled'}.png',
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
                  ? 'No Forum Posts'
                  : displayType == 'COURSES'
                      ? 'No Courses'
                      : 'No results',
            ),
          ),
          const SizedBox(height: AppSizes.vertical_5),
          SubtitleText(
            alignment: TextAlign.center,
            text: displayType == 'FORUM_POSTS'
                ? 'You will see your forum posts here once you create one.'.tr
                : displayType == 'COURSES'.tr
                    ? 'No courses available at the moment.'.tr
                    : 'No results'.tr,
          ),
        ],
      ),
    );
  }
}
