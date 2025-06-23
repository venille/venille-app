import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:built_collection/built_collection.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:period_tracker_sdk/src/model/period_day_info.dart';
import 'package:period_tracker_sdk/src/model/monthly_period_info.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_day_info.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/src/model/period_tracker_week_info.dart';

class PeriodTrackerCard extends StatefulWidget {
  const PeriodTrackerCard({super.key});

  @override
  State<PeriodTrackerCard> createState() => _PeriodTrackerCardState();
}

class _PeriodTrackerCardState extends State<PeriodTrackerCard> {
  int currentDay = DateTime.now().day;
  int currentWeekIndex = 1;

  // Helper function to get current year data from periodTrackerHistory
  List<PeriodDayInfo> getCurrentYearMonths() {
    final periodTracker =
        ServiceRegistry.userRepository.periodTrackerHistory.value;
    if (periodTracker.years.isEmpty) return [];

    final now = DateTime.now();
    final currentYear = now.year;

    // Find the year data for current year
    final currentYearData = periodTracker.years.firstWhere(
      (year) => year.currentYear.toInt() == currentYear,
      orElse: () => periodTracker.years.first,
    );

    // Flatten all months into a single list of days
    List<PeriodDayInfo> allDays = [];
    for (var month in currentYearData.months) {
      allDays.addAll(month.days);
    }
    return allDays;
  }

  // Helper function to get current year months data
  List<MonthlyPeriodInfo> getCurrentYearMonthsData() {
    final periodTracker =
        ServiceRegistry.userRepository.periodTrackerHistory.value;
    if (periodTracker.years.isEmpty) return [];

    final now = DateTime.now();
    final currentYear = now.year;

    // Find the year data for current year
    final currentYearData = periodTracker.years.firstWhere(
      (year) => year.currentYear.toInt() == currentYear,
      orElse: () => periodTracker.years.first,
    );

    return currentYearData.months.toList();
  }

  // Helper function to get all months from all years in period tracker history
  List<MonthlyPeriodInfo> getAllMonthsData() {
    final periodTracker =
        ServiceRegistry.userRepository.periodTrackerHistory.value;
    if (periodTracker.years.isEmpty) return [];

    final now = DateTime.now();
    final currentYear = now.year;
    final currentMonth = now.month;
    final nextMonth = currentMonth == 12 ? 1 : currentMonth + 1;
    final nextMonthYear = currentMonth == 12 ? currentYear + 1 : currentYear;

    List<MonthlyPeriodInfo> allMonths = [];

    for (var yearData in periodTracker.years) {
      for (var month in yearData.months) {
        final monthYear = yearData.currentYear.toInt();
        final monthNumber = month.month.toInt();

        // Stop at the month after current month
        if (monthYear > nextMonthYear ||
            (monthYear == nextMonthYear && monthNumber > nextMonth)) {
          break;
        }

        allMonths.add(month);
      }
    }

    return allMonths;
  }

  // Helper function to calculate weeks in a month consistently
  int calculateWeeksInMonth(List<PeriodDayInfo> days) {
    return (days.length / 7).ceil();
  }

  // Helper function to get total weeks across all months
  int getTotalWeeks() {
    final months = getCurrentYearMonthsData();
    if (months.isEmpty) return 0;

    int totalWeeks = 0;
    for (var month in months) {
      totalWeeks += calculateWeeksInMonth(month.days.toList());
    }
    return totalWeeks;
  }

  // Helper function to get current week from periodTrackerHistory
  PeriodTrackerWeekInfo getCurrentWeek() {
    final months = getCurrentYearMonthsData();
    if (months.isEmpty) {
      return PeriodTrackerWeekInfo(
        (b) => b
          ..monthTitle = 'No Data'
          ..days = ListBuilder<PeriodTrackerDayInfo>(),
      );
    }

    final now = DateTime.now();
    final currentMonth = now.month;
    final currentYear = now.year;

    // Debug: Print available months
    log('Current month: $currentMonth, Current year: $currentYear');
    for (var month in months) {
      log('Available month: ${month.month} (${month.monthName})');
    }

    // Find the month that contains today's date
    var currentMonthInfo = months.firstWhere(
      (month) => month.days.any((day) =>
          day.date.year == currentYear &&
          day.date.month == currentMonth &&
          day.date.day == now.day),
      orElse: () => months.first,
    );

    log('Selected month: ${currentMonthInfo.monthName}');

    // Calculate total weeks across all months up to current month
    int totalWeeksBeforeCurrentMonth = 0;
    int currentMonthIndex = months.indexOf(currentMonthInfo);

    // Count weeks in all months before the current month
    for (int i = 0; i < currentMonthIndex; i++) {
      final month = months[i];
      final daysInMonth = month.days.length;
      final weeksInMonth = (daysInMonth / 7).ceil();
      totalWeeksBeforeCurrentMonth += weeksInMonth.toInt();
    }

    // Group days into weeks (7 days each) for current month
    final days = currentMonthInfo.days.toList();
    final weeks = <List<PeriodDayInfo>>[];

    // Create weeks with exactly 7 days each
    for (int i = 0; i < days.length; i += 7) {
      if (i + 7 <= days.length) {
        // Full week of 7 days
        weeks.add(days.sublist(i, i + 7));
      } else {
        // Partial week - need to fill with days from next month
        final remainingDays = days.sublist(i);
        final daysNeeded = 7 - remainingDays.length;

        // Try to get days from next month
        List<PeriodDayInfo> nextMonthDays = [];
        if (currentMonthIndex + 1 < months.length) {
          final nextMonth = months[currentMonthIndex + 1];
          nextMonthDays = nextMonth.days.take(daysNeeded).toList();
        }

        // Combine current month's remaining days with next month's days
        final fullWeek = [...remainingDays, ...nextMonthDays];
        weeks.add(fullWeek);
      }
    }

    // Debug: Print weeks
    for (int i = 0; i < weeks.length; i++) {
      final weekDays = weeks[i].map((d) => '${d.date.day}').join(', ');
      log('Week $i: [$weekDays]');
    }

    // Find the current week (week containing today)
    int targetWeekIndex = 0;
    final today = DateTime.now();

    log('Looking for today: ${today.day}/${today.month}/${today.year}');

    for (int i = 0; i < weeks.length; i++) {
      final week = weeks[i];
      final weekDays = week.map((d) => '${d.date.day}').join(', ');
      log('Checking week $i: [$weekDays]');

      if (week.any((day) =>
          day.date.year == today.year &&
          day.date.month == today.month &&
          day.date.day == today.day)) {
        targetWeekIndex = i;
        log('Found today in week $i');
        break;
      }
    }

    log('Total weeks: ${weeks.length}, Target week index: $targetWeekIndex');

    // Calculate the absolute week index across all months
    final absoluteWeekIndex = totalWeeksBeforeCurrentMonth + targetWeekIndex;

    log('Total weeks before current month: $totalWeeksBeforeCurrentMonth');
    log('Absolute week index: $absoluteWeekIndex');

    // Adjust for currentWeekIndex (0=previous, 1=current, 2=next)
    // Allow going back to first week of first month
    final adjustedWeekIndex = absoluteWeekIndex + currentWeekIndex - 1;

    log('Current week index: $currentWeekIndex');
    log('Adjusted week index: $adjustedWeekIndex');

    // Find which month and week this corresponds to
    int remainingWeeks = adjustedWeekIndex;
    int targetMonthIndex = 0;
    int targetWeekInMonth = 0;

    log('Starting with remainingWeeks: $remainingWeeks');

    for (int i = 0; i < months.length; i++) {
      final month = months[i];
      final daysInMonth = month.days.length;
      final weeksInMonth = (daysInMonth / 7).ceil();

      log('Month $i (${month.monthName}): $weeksInMonth weeks, remainingWeeks: $remainingWeeks');

      if (remainingWeeks < weeksInMonth) {
        targetMonthIndex = i;
        targetWeekInMonth = remainingWeeks;
        log('Found target month: $i, week in month: $remainingWeeks');
        break;
      }
      remainingWeeks -= weeksInMonth.toInt();
    }

    log('Final targetMonthIndex: $targetMonthIndex, targetWeekInMonth: $targetWeekInMonth');

    // Ensure we don't go out of bounds
    if (targetMonthIndex >= months.length) {
      targetMonthIndex = months.length - 1;
      final lastMonth = months[targetMonthIndex];
      final daysInLastMonth = lastMonth.days.length;
      targetWeekInMonth = (daysInLastMonth / 7).ceil() - 1;
    }

    if (targetWeekInMonth < 0) {
      targetWeekInMonth = 0;
    }

    // Get the target month and create weeks for it
    final targetMonth = months[targetMonthIndex];
    final targetMonthDays = targetMonth.days.toList();
    final targetMonthWeeks = <List<PeriodDayInfo>>[];

    // Create weeks with exactly 7 days each
    for (int i = 0; i < targetMonthDays.length; i += 7) {
      if (i + 7 <= targetMonthDays.length) {
        // Full week of 7 days
        targetMonthWeeks.add(targetMonthDays.sublist(i, i + 7));
      } else {
        // Partial week - need to fill with days from next month
        final remainingDays = targetMonthDays.sublist(i);
        final daysNeeded = 7 - remainingDays.length;

        // Try to get days from next month
        List<PeriodDayInfo> nextMonthDays = [];
        if (targetMonthIndex + 1 < months.length) {
          final nextMonth = months[targetMonthIndex + 1];
          nextMonthDays = nextMonth.days.take(daysNeeded).toList();
        }

        // Combine current month's remaining days with next month's days
        final fullWeek = [...remainingDays, ...nextMonthDays];
        targetMonthWeeks.add(fullWeek);
      }
    }

    // Ensure targetWeekInMonth doesn't exceed available weeks
    if (targetWeekInMonth >= targetMonthWeeks.length) {
      targetWeekInMonth = targetMonthWeeks.length - 1;
    }

    final weekDays = targetMonthWeeks[targetWeekInMonth];

    log('Selected month: ${targetMonth.monthName}, Week: $targetWeekInMonth, Week days: ${weekDays.length}');
    log('Selected week days: [${weekDays.map((d) => '${d.date.day}').join(', ')}]');

    // Convert PeriodDayInfo to PeriodTrackerDayInfo
    final trackerDays = weekDays
        .map((day) => PeriodTrackerDayInfo(
              (b) => b
                ..date = day.date
                ..isToday = day.isToday
                ..periodDayCount = 0 // Not available in PeriodDayInfo
                ..cycleDayCount = day.cycleDayCount
                ..isPredictedPeriodDay = day.isPredictedPeriodDay
                ..isFertileDay = false // Not available in PeriodDayInfo
                ..isPredictedOvulationDay = day.isPredictedOvulationDay
                ..insights = day.insights,
            ))
        .toList();

    return PeriodTrackerWeekInfo(
      (b) => b
        ..monthTitle = targetMonth.monthName
        ..days = ListBuilder<PeriodTrackerDayInfo>(trackerDays),
    );
  }

  // Helper function to get a specific day from current week
  PeriodTrackerDayInfo? getCurrentDay() {
    final week = getCurrentWeek();
    try {
      PeriodTrackerDayInfo today = week.days.firstWhere(
        (day) => day.date.day == currentDay,
      );

      ServiceRegistry.userRepository.dashboardTrackerCurrentDay.value = today;

      return today;
    } catch (e) {
      return week.days.isNotEmpty ? week.days.first : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final currentWeek = getCurrentWeek();
        final currentDayInfo = getCurrentDay();

        return Container(
          height: 310,
          width: double.maxFinite,
          margin: const EdgeInsets.only(
            left: AppSizes.horizontal_10,
            right: AppSizes.horizontal_10,
          ),
          padding: const EdgeInsets.only(
            bottom: AppSizes.vertical_20,
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
                currentDayInfo?.isPredictedPeriodDay == true
                    ? AppColors.redColor.withOpacity(0.4)
                    : (currentDayInfo?.isPredictedOvulationDay == true ||
                            currentDayInfo?.isFertileDay == true)
                        ? AppColors.blueLightColor.withOpacity(0.2)
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
                  border: const Border(
                    top: BorderSide(
                      color: AppColors.grayLightColor,
                    ),
                    left: BorderSide(
                      color: AppColors.grayLightColor,
                    ),
                    right: BorderSide(
                      color: AppColors.grayLightColor,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: AppSizes.vertical_5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: currentDayInfo?.isPredictedPeriodDay == true
                            ? AppColors.redColor.withOpacity(0.4)
                            : (currentDayInfo?.isPredictedOvulationDay ==
                                        true ||
                                    currentDayInfo?.isFertileDay == true)
                                ? AppColors.blueLightColor.withOpacity(0.2)
                                : AppColors.grayLightColor.withOpacity(0.2),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Calculate the current absolute week position
                                  final months = getCurrentYearMonthsData();
                                  if (months.isEmpty) return;

                                  final now = DateTime.now();
                                  final currentMonth = now.month;
                                  final currentYear = now.year;

                                  // Find current month index
                                  var currentMonthInfo = months.firstWhere(
                                    (month) => month.days.any((day) =>
                                        day.date.year == currentYear &&
                                        day.date.month == currentMonth &&
                                        day.date.day == now.day),
                                    orElse: () => months.first,
                                  );

                                  int currentMonthIndex =
                                      months.indexOf(currentMonthInfo);

                                  // Calculate total weeks before current month
                                  int totalWeeksBeforeCurrentMonth = 0;
                                  for (int i = 0; i < currentMonthIndex; i++) {
                                    final month = months[i];
                                    final daysInMonth = month.days.toList();
                                    final weeksInMonth =
                                        calculateWeeksInMonth(daysInMonth);
                                    totalWeeksBeforeCurrentMonth +=
                                        weeksInMonth;
                                  }

                                  // Find current week in current month
                                  final days = currentMonthInfo.days.toList();
                                  final weeks = <List<PeriodDayInfo>>[];
                                  for (int i = 0; i < days.length; i += 7) {
                                    if (i + 7 <= days.length) {
                                      weeks.add(days.sublist(i, i + 7));
                                    } else {
                                      final remainingDays = days.sublist(i);
                                      final daysNeeded =
                                          7 - remainingDays.length;
                                      List<PeriodDayInfo> nextMonthDays = [];
                                      if (currentMonthIndex + 1 <
                                          months.length) {
                                        final nextMonth =
                                            months[currentMonthIndex + 1];
                                        nextMonthDays = nextMonth.days
                                            .take(daysNeeded)
                                            .toList();
                                      }
                                      final fullWeek = [
                                        ...remainingDays,
                                        ...nextMonthDays
                                      ];
                                      weeks.add(fullWeek);
                                    }
                                  }

                                  int targetWeekIndex = 0;
                                  for (int i = 0; i < weeks.length; i++) {
                                    final week = weeks[i];
                                    if (week.any((day) =>
                                        day.date.year == now.year &&
                                        day.date.month == now.month &&
                                        day.date.day == now.day)) {
                                      targetWeekIndex = i;
                                      break;
                                    }
                                  }

                                  final absoluteWeekIndex =
                                      totalWeeksBeforeCurrentMonth +
                                          targetWeekIndex;
                                  final adjustedWeekIndex =
                                      absoluteWeekIndex + currentWeekIndex - 1;

                                  // Only allow going back if we're not at the first week
                                  if (adjustedWeekIndex > 0) {
                                    setState(() {
                                      currentWeekIndex--;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  FluentIcons.chevron_left_12_regular,
                                  size: 16,
                                ),
                              ),
                              TitleText(
                                title: currentWeek.monthTitle,
                              ),
                              IconButton(
                                onPressed: () {
                                  // Calculate the current absolute week position
                                  final months = getCurrentYearMonthsData();
                                  if (months.isEmpty) return;

                                  final now = DateTime.now();
                                  final currentMonth = now.month;
                                  final currentYear = now.year;

                                  // Find current month index
                                  var currentMonthInfo = months.firstWhere(
                                    (month) => month.days.any((day) =>
                                        day.date.year == currentYear &&
                                        day.date.month == currentMonth &&
                                        day.date.day == now.day),
                                    orElse: () => months.first,
                                  );

                                  int currentMonthIndex =
                                      months.indexOf(currentMonthInfo);

                                  // Calculate total weeks before current month
                                  int totalWeeksBeforeCurrentMonth = 0;
                                  for (int i = 0; i < currentMonthIndex; i++) {
                                    final month = months[i];
                                    final daysInMonth = month.days.toList();
                                    final weeksInMonth =
                                        calculateWeeksInMonth(daysInMonth);
                                    totalWeeksBeforeCurrentMonth +=
                                        weeksInMonth;
                                  }

                                  // Find current week in current month
                                  final days = currentMonthInfo.days.toList();
                                  final weeks = <List<PeriodDayInfo>>[];
                                  for (int i = 0; i < days.length; i += 7) {
                                    if (i + 7 <= days.length) {
                                      weeks.add(days.sublist(i, i + 7));
                                    } else {
                                      final remainingDays = days.sublist(i);
                                      final daysNeeded =
                                          7 - remainingDays.length;
                                      List<PeriodDayInfo> nextMonthDays = [];
                                      if (currentMonthIndex + 1 <
                                          months.length) {
                                        final nextMonth =
                                            months[currentMonthIndex + 1];
                                        nextMonthDays = nextMonth.days
                                            .take(daysNeeded)
                                            .toList();
                                      }
                                      final fullWeek = [
                                        ...remainingDays,
                                        ...nextMonthDays
                                      ];
                                      weeks.add(fullWeek);
                                    }
                                  }

                                  int targetWeekIndex = 0;
                                  for (int i = 0; i < weeks.length; i++) {
                                    final week = weeks[i];
                                    if (week.any((day) =>
                                        day.date.year == now.year &&
                                        day.date.month == now.month &&
                                        day.date.day == now.day)) {
                                      targetWeekIndex = i;
                                      break;
                                    }
                                  }

                                  final absoluteWeekIndex =
                                      totalWeeksBeforeCurrentMonth +
                                          targetWeekIndex;
                                  final adjustedWeekIndex =
                                      absoluteWeekIndex + currentWeekIndex - 1;

                                  // Calculate total weeks available
                                  int totalWeeksAvailable = 0;
                                  for (var month in months) {
                                    totalWeeksAvailable +=
                                        calculateWeeksInMonth(
                                            month.days.toList());
                                  }

                                  setState(() {
                                    // If at the last week, loop back to first week
                                    if (adjustedWeekIndex >=
                                        totalWeeksAvailable - 1) {
                                      // Reset to first week by setting currentWeekIndex to go back to week 0
                                      currentWeekIndex =
                                          -(absoluteWeekIndex - 1);
                                    } else {
                                      currentWeekIndex++;
                                    }
                                  });
                                },
                                icon: const Icon(
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
                          color: currentDayInfo?.isPredictedPeriodDay == true
                              ? AppColors.redColor.withOpacity(0.4)
                              : (currentDayInfo?.isPredictedOvulationDay ==
                                          true ||
                                      currentDayInfo?.isFertileDay == true)
                                  ? AppColors.blueLightColor.withOpacity(0.2)
                                  : AppColors.grayLightColor.withOpacity(0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              currentWeek.days.length,
                              (index) => SizedBox(
                                width: 30,
                                child: Center(
                                  child: TitleText(
                                    weight: FontWeight.w400,
                                    size: 13,
                                    title: formatDayFromDate(
                                      currentWeek.days[index].date,
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
                              currentWeek.days.length,
                              (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    currentDay =
                                        currentWeek.days[index].date.day;
                                  });

                                  ServiceRegistry
                                      .userRepository
                                      .dashboardTrackerCurrentDay
                                      .value = currentWeek.days[index];
                                },
                                overlayColor: WidgetStateProperty.all(
                                    AppColors.whiteColor),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  margin: EdgeInsets.only(
                                    top: AppSizes.vertical_10,
                                  ),
                                  // padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: currentWeek.days[index].isToday
                                        ? AppColors.greenColor
                                        : currentWeek.days[index]
                                                .isPredictedOvulationDay
                                            ? AppColors.blueLightColor
                                                .withOpacity(0.4)
                                            : currentWeek
                                                        .days[index].date.day ==
                                                    currentDay
                                                ? AppColors.grayLightColor
                                                : AppColors.whiteColor,
                                    border: Border.all(
                                      color: currentWeek.days[index].isToday
                                          ? AppColors.greenColor
                                          : currentWeek.days[index]
                                                  .isPredictedOvulationDay
                                              ? AppColors.blueLightColor
                                              : currentWeek.days[index].date
                                                          .day ==
                                                      currentDay
                                                  ? AppColors.grayColor
                                                      .withOpacity(0.3)
                                                  : AppColors.whiteColor,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: TitleText(
                                      size: currentWeek.days[index].isToday
                                          ? 16
                                          : 13,
                                      color: currentWeek.days[index].isToday
                                          ? AppColors.whiteColor
                                          : currentWeek.days[index]
                                                  .isPredictedOvulationDay
                                              ? AppColors.whiteColor
                                              : AppColors.blackColor,
                                      // weight: currentWeek.days[index].isToday
                                      //     ? FontWeight.w500
                                      //     : FontWeight.w400,
                                      title: currentWeek.days[index].date.day
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
                // width: 200,
                height: 140,
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
                      title: currentDayInfo?.insights ??
                          'No insights for this day',
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.logPeriodRoute);
                      },
                      child: Container(
                        width: 120,
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
        );
      },
    );
  }
}
