import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/middlewares/index.dart';

class DashboardTrackerCard extends StatefulWidget {
  const DashboardTrackerCard({super.key});

  @override
  State<DashboardTrackerCard> createState() => _DashboardTrackerCardState();
}

class _DashboardTrackerCardState extends State<DashboardTrackerCard> {
  int currentDay = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 340,
        width: double.maxFinite,
        margin: const EdgeInsets.only(
          // top: AppSizes.vertical_5,
          left: AppSizes.horizontal_10,
          right: AppSizes.horizontal_10,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.whiteColor.withOpacity(0.05),
              ServiceRegistry
                      .userRepository.dashboardTrackerCurrentWeek.value.days
                      .where((day) => day.date.day == currentDay)
                      .isNotEmpty
                  ? ServiceRegistry
                          .userRepository.dashboardTrackerCurrentWeek.value.days
                          .firstWhere((day) => day.date.day == currentDay)
                          .isPredictedPeriodDay
                      ? AppColors.redColor.withOpacity(0.4)
                      : (ServiceRegistry.userRepository
                                  .dashboardTrackerCurrentWeek.value.days
                                  .firstWhere(
                                      (day) => day.date.day == currentDay)
                                  .isPredictedOvulationDay ||
                              ServiceRegistry.userRepository
                                  .dashboardTrackerCurrentWeek.value.days
                                  .firstWhere(
                                      (day) => day.date.day == currentDay)
                                  .isFertileDay)
                          ? AppColors.blueLightColor.withOpacity(0.2)
                          : AppColors.grayColor.withOpacity(0.25)
                  : AppColors.grayColor.withOpacity(0.25)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 140,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grayLightColor,
                ),
                borderRadius: BorderRadius.circular(15),
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     AppColors.whiteColor.withOpacity(0.05),
                //     AppColors.greenColor.withOpacity(0.1),
                //   ],
                // ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: AppSizes.vertical_5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: ServiceRegistry.userRepository
                              .dashboardTrackerCurrentWeek.value.days
                              .where((day) => day.date.day == currentDay)
                              .isNotEmpty
                          ? ServiceRegistry.userRepository
                                  .dashboardTrackerCurrentWeek.value.days
                                  .firstWhere(
                                      (day) => day.date.day == currentDay)
                                  .isPredictedPeriodDay
                              ? AppColors.redColor.withOpacity(0.4)
                              : (ServiceRegistry
                                          .userRepository
                                          .dashboardTrackerCurrentWeek
                                          .value
                                          .days
                                          .firstWhere((day) =>
                                              day.date.day == currentDay)
                                          .isPredictedOvulationDay ||
                                      ServiceRegistry
                                          .userRepository
                                          .dashboardTrackerCurrentWeek
                                          .value
                                          .days
                                          .firstWhere((day) =>
                                              day.date.day == currentDay)
                                          .isFertileDay)
                                  ? AppColors.blueLightColor.withOpacity(0.2)
                                  : AppColors.grayLightColor.withOpacity(0.2)
                          : AppColors.grayLightColor.withOpacity(0.2),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (ServiceRegistry.commonRepository
                                        .currentTrackerIndex.value ==
                                    0) {
                                  ServiceRegistry.commonRepository
                                      .currentTrackerIndex.value = 1;

                                  ServiceRegistry.userRepository
                                          .dashboardTrackerCurrentWeek.value =
                                      ServiceRegistry
                                          .userRepository
                                          .dashboardPeriodInfo
                                          .value
                                          .currentWeek;
                                } else {
                                  ServiceRegistry.commonRepository
                                      .currentTrackerIndex.value = 0;

                                  ServiceRegistry.userRepository
                                          .dashboardTrackerCurrentWeek.value =
                                      ServiceRegistry
                                          .userRepository
                                          .dashboardPeriodInfo
                                          .value
                                          .previousWeek;
                                }

                                // setState(() {
                                //   currentDay = ServiceRegistry.userRepository
                                //       .dashboardTrackerCurrentWeek.value.days
                                //       .firstWhere(
                                //           (day) => day.date.day == currentDay)
                                //       .date
                                //       .day;
                                // });
                              },
                              icon: Icon(
                                FluentIcons.chevron_left_12_regular,
                                size: 16,
                              ),
                            ),
                            TitleText(
                              title: ServiceRegistry.userRepository
                                  .dashboardTrackerCurrentWeek.value.monthTitle,
                            ),
                            IconButton(
                              onPressed: () {
                                if (ServiceRegistry.commonRepository
                                        .currentTrackerIndex.value ==
                                    1) {
                                  ServiceRegistry.commonRepository
                                      .currentTrackerIndex.value = 2;

                                  ServiceRegistry.userRepository
                                          .dashboardTrackerCurrentWeek.value =
                                      ServiceRegistry.userRepository
                                          .dashboardPeriodInfo.value.nextWeek;
                                } else {
                                  ServiceRegistry.commonRepository
                                      .currentTrackerIndex.value = 1;

                                  ServiceRegistry.userRepository
                                          .dashboardTrackerCurrentWeek.value =
                                      ServiceRegistry
                                          .userRepository
                                          .dashboardPeriodInfo
                                          .value
                                          .currentWeek;
                                }

                                // setState(() {
                                //   currentDay = ServiceRegistry.userRepository
                                //       .dashboardTrackerCurrentWeek.value.days
                                //       .firstWhere(
                                //           (day) => day.date.day == currentDay)
                                //       .date
                                //       .day;
                                // });
                              },
                              icon: Icon(
                                FluentIcons.chevron_right_12_regular,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: AppSizes.horizontal_10,
                          right: AppSizes.horizontal_10,
                          bottom: AppSizes.vertical_20,
                        ),
                        color: ServiceRegistry.userRepository
                                .dashboardTrackerCurrentWeek.value.days
                                .where((day) => day.date.day == currentDay)
                                .isNotEmpty
                            ? ServiceRegistry.userRepository
                                    .dashboardTrackerCurrentWeek.value.days
                                    .firstWhere(
                                        (day) => day.date.day == currentDay)
                                    .isPredictedPeriodDay
                                ? AppColors.redColor.withOpacity(0.4)
                                : (ServiceRegistry
                                            .userRepository
                                            .dashboardTrackerCurrentWeek
                                            .value
                                            .days
                                            .firstWhere((day) =>
                                                day.date.day == currentDay)
                                            .isPredictedOvulationDay ||
                                        ServiceRegistry
                                            .userRepository
                                            .dashboardTrackerCurrentWeek
                                            .value
                                            .days
                                            .firstWhere((day) =>
                                                day.date.day == currentDay)
                                            .isFertileDay)
                                    ? AppColors.blueLightColor.withOpacity(0.2)
                                    : AppColors.grayLightColor.withOpacity(0.2)
                            : AppColors.grayLightColor.withOpacity(0.2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            ServiceRegistry.userRepository
                                .dashboardTrackerCurrentWeek.value.days.length,
                            (index) => Container(
                              width: 30,
                              child: Center(
                                child: TitleText(
                                  size: ServiceRegistry
                                          .userRepository
                                          .dashboardTrackerCurrentWeek
                                          .value
                                          .days[index]
                                          .isToday
                                      ? 16
                                      : 13,
                                  title: formatDayFromDate(
                                    ServiceRegistry
                                        .userRepository
                                        .dashboardTrackerCurrentWeek
                                        .value
                                        .days[index]
                                        .date,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: AppSizes.vertical_5,
                          left: AppSizes.horizontal_10,
                          right: AppSizes.horizontal_10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            ServiceRegistry.userRepository
                                .dashboardTrackerCurrentWeek.value.days.length,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  currentDay = ServiceRegistry
                                      .userRepository
                                      .dashboardTrackerCurrentWeek
                                      .value
                                      .days[index]
                                      .date
                                      .day;
                                });
                              },
                              overlayColor:
                                  WidgetStateProperty.all(AppColors.whiteColor),
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: const EdgeInsets.only(
                                  top: AppSizes.vertical_10,
                                ),
                                decoration: BoxDecoration(
                                  color: ServiceRegistry
                                          .userRepository
                                          .dashboardTrackerCurrentWeek
                                          .value
                                          .days[index]
                                          .isToday
                                      ? AppColors.greenColor
                                      : ServiceRegistry
                                                  .userRepository
                                                  .dashboardTrackerCurrentWeek
                                                  .value
                                                  .days[index]
                                                  .date
                                                  .day ==
                                              currentDay
                                          ? AppColors.grayLightColor
                                          : AppColors.whiteColor,
                                  border: Border.all(
                                    color: ServiceRegistry
                                            .userRepository
                                            .dashboardTrackerCurrentWeek
                                            .value
                                            .days[index]
                                            .isToday
                                        ? AppColors.greenColor
                                        : ServiceRegistry
                                                    .userRepository
                                                    .dashboardTrackerCurrentWeek
                                                    .value
                                                    .days[index]
                                                    .date
                                                    .day ==
                                                currentDay
                                            ? AppColors.grayColor
                                                .withOpacity(0.3)
                                            : AppColors.whiteColor,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: TitleText(
                                    size: ServiceRegistry
                                            .userRepository
                                            .dashboardTrackerCurrentWeek
                                            .value
                                            .days[index]
                                            .isToday
                                        ? 16
                                        : 13,
                                    color: ServiceRegistry
                                            .userRepository
                                            .dashboardTrackerCurrentWeek
                                            .value
                                            .days[index]
                                            .isToday
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                    weight: ServiceRegistry
                                            .userRepository
                                            .dashboardTrackerCurrentWeek
                                            .value
                                            .days[index]
                                            .isToday
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                                    title: ServiceRegistry
                                        .userRepository
                                        .dashboardTrackerCurrentWeek
                                        .value
                                        .days[index]
                                        .date
                                        .day
                                        .toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              height: 160,
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.vertical_10,
                horizontal: AppSizes.horizontal_10,
              ),
              child: Column(
                children: [
                  TitleText(
                    size: 16,
                    weight: FontWeight.w500,
                    alignment: TextAlign.center,
                    title: ServiceRegistry.userRepository
                            .dashboardTrackerCurrentWeek.value.days
                            .where((day) => day.date.day == currentDay)
                            .isNotEmpty
                        ? ServiceRegistry.userRepository
                            .dashboardTrackerCurrentWeek.value.days
                            .firstWhere((day) => day.date.day == currentDay)
                            .insights
                        : 'No insights for this day',
                  ),
                  const SizedBox(height: AppSizes.vertical_10),
                  InkWell(
                    onTap: () {
                      final selectedDay = ServiceRegistry
                          .userRepository.dashboardTrackerCurrentDay.value;

                      // Check if the selected date is in the future
                      log('selectedDay.date: ${selectedDay.date.day}');
                      log('DateTime.now(): ${DateTime.now().day}');
                      log('selectedDay.date.day > DateTime.now().day: ${selectedDay.date.day > DateTime.now().day}');

                      if (ServiceRegistry.userRepository
                          .dashboardTrackerCurrentWeek.value.days.isNotEmpty) {
                        ServiceRegistry.userRepository
                                .dashboardTrackerCurrentDay.value =
                            ServiceRegistry.userRepository
                                .dashboardTrackerCurrentWeek.value.days
                                .firstWhere(
                                    (day) => day.date.day == currentDay);
                      }

                      if (selectedDay.date.day > DateTime.now().day) {
                        return customErrorMessageSnackbar(
                          title: 'Message',
                          message: 'You cannot log symptoms for a future date!',
                        );
                      }

                      Get.toNamed(AppRoutes.logPeriodRoute);
                    },
                    child: Container(
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: const Center(
                        child: TitleText(
                          size: 14,
                          title: 'Log period',
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
