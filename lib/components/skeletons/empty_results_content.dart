import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/appbar/profile_appbar.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/core/utilities/appLocale.dart';

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
                  ? AppLocale.noForumPosts.getString(context)
                  : displayType == 'COURSES'
                      ? AppLocale.noCourses.getString(context)
                      : displayType == 'NOTIFICATIONS'
                          ? AppLocale.noNewNotification.getString(context)
                          : displayType == 'ONGOING_ORDERS'
                              ? AppLocale.noOngoingOrders.getString(context)
                              : displayType == 'ONBOARDING_QUESTIONS'
                                  ? AppLocale.noOnboardQuestion
                                      .getString(context)
                                  : displayType == 'COMPLETED_ORDERS'
                                      ? AppLocale.noCompletedOrders
                                          .getString(context)
                                      : displayType == 'SURVEY_HISTORY'
                                          ? AppLocale.noSurveyHistory
                                              .getString(context)
                                          : AppLocale.noResults
                                              .getString(context),
            ),
          ),
          const SizedBox(height: AppSizes.vertical_5),
          SubtitleText(
            alignment: TextAlign.center,
            text: displayType == 'FORUM_POSTS'
                ? AppLocale.youWillSeeYourForumPostsHereOnceYouCreateOne
                    .getString(context)
                : displayType == 'COURSES'
                    ? AppLocale.noCourseAvailable.getString(context)
                    : displayType == 'NOTIFICATIONS'
                        ? AppLocale.youWillSeeNewNotification.getString(context)
                        : displayType == 'ONGOING_ORDERS'
                            ? AppLocale.noOngoingOrdersAtTheMoment
                                .getString(context)
                            : displayType == 'ONBOARDING_QUESTIONS'
                                ? AppLocale.dragDownToRefresh.getString(context)
                                : displayType == 'COMPLETED_ORDERS'
                                    ?
                                    AppLocale.noCompletedOrdersAtTheMoment.getString(context)
                                     
                                    : displayType == 'SURVEY_HISTORY'
                                        ? 
                                        AppLocale.noSurveyHistoryAtTheMoment.getString(context)
                                        
                                        : AppLocale.noResults.getString(context),
          ),
        ],
      ),
    );
  }
}
