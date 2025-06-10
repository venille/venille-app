import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/presentation/dashboard/subscreens/symptoms/log_symptoms_screen.dart';
import 'package:venille/data/repositories/user_repository.dart';

class Last7DaysWidget extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const Last7DaysWidget({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<Last7DaysWidget> createState() => _Last7DaysWidgetState();
}

class _Last7DaysWidgetState extends State<Last7DaysWidget> {
  late List<DateTime> last7Days;
  final UserRepository userRepository = Get.find<UserRepository>();

  @override
  void initState() {
    super.initState();
    _initializeLast7Days();
  }

  void _initializeLast7Days() {
    try {
      // Try to get dates from userRepository.periodTrackerHistory.calendar
      if (userRepository.periodTrackerHistory.isNotEmpty) {
        final latestPeriodTracker = userRepository.periodTrackerHistory.first;
        final calendar = latestPeriodTracker.calendar;
        final dailyInsights = calendar.dailyInsights;

        // Use currentMonth and currentYear from calendar if available
        if (calendar.currentMonth.isNotEmpty && calendar.currentYear > 0) {
          final currentMonth = _parseMonth(calendar.currentMonth);
          final currentYear = calendar.currentYear.toInt();

          if (currentMonth != null) {
            // Create a base date from currentMonth and currentYear
            final baseDate =
                DateTime(currentYear, currentMonth, DateTime.now().day);

            // If we have dailyInsights, use them; otherwise generate from baseDate
            if (dailyInsights.isNotEmpty) {
              // Get last 7 days from dailyInsights, sorted by date
              final sortedInsights = dailyInsights.toList()
                ..sort((a, b) =>
                    b.date.compareTo(a.date)); // Sort descending (latest first)

              last7Days = sortedInsights
                  .take(7)
                  .map((insight) => insight.date)
                  .toList()
                  .reversed // Reverse to have oldest first for display
                  .toList();
            } else {
              // Generate last 7 days based on calendar's currentMonth/currentYear
              final today =
                  DateTime(currentYear, currentMonth, DateTime.now().day);
              last7Days = List.generate(
                  7, (i) => today.subtract(Duration(days: 6 - i)));
            }
            return;
          }
        }

        // Fallback to dailyInsights only if currentMonth/currentYear not available
        if (dailyInsights.isNotEmpty) {
          final sortedInsights = dailyInsights.toList()
            ..sort((a, b) => b.date.compareTo(a.date));

          last7Days = sortedInsights
              .take(7)
              .map((insight) => insight.date)
              .toList()
              .reversed
              .toList();
          return;
        }
      }
    } catch (e) {
      // Fallback to manual generation if there's any error
    }

    _fallbackToManualGeneration();
  }

  int? _parseMonth(String monthString) {
    // Handle different month formats
    final monthLower = monthString.toLowerCase().trim();

    // Check if it's a number (1-12)
    final monthNum = int.tryParse(monthString);
    if (monthNum != null && monthNum >= 1 && monthNum <= 12) {
      return monthNum;
    }

    // Check if it's a month name
    const monthNames = {
      'january': 1,
      'jan': 1,
      'february': 2,
      'feb': 2,
      'march': 3,
      'mar': 3,
      'april': 4,
      'apr': 4,
      'may': 5,
      'june': 6,
      'jun': 6,
      'july': 7,
      'jul': 7,
      'august': 8,
      'aug': 8,
      'september': 9,
      'sep': 9,
      'sept': 9,
      'october': 10,
      'oct': 10,
      'november': 11,
      'nov': 11,
      'december': 12,
      'dec': 12,
    };

    return monthNames[monthLower];
  }

  void _fallbackToManualGeneration() {
    final today = DateTime.now();
    last7Days = List.generate(7, (i) => today.subtract(Duration(days: 6 - i)));
  }

  String getDynamicText(DateTime date) {
    // Try to get insights from repository first
    try {
      if (userRepository.periodTrackerHistory.isNotEmpty) {
        final latestPeriodTracker = userRepository.periodTrackerHistory.first;
        final dailyInsights = latestPeriodTracker.calendar.dailyInsights;

        // Find matching date in dailyInsights
        final matchingInsight = dailyInsights.firstWhere(
          (insight) => _isSameDate(insight.date, date),
          orElse: () => throw StateError('No matching insight found'),
        );

        return matchingInsight.todayInsights;
      }
    } catch (e) {
      // Fallback to default logic if no matching insight found
    }

    // Fallback logic (original logic)
    if (date == last7Days.last) {
      return 'Today: High chance of getting pregnant';
    } else if (date.isAfter(last7Days.last.subtract(Duration(days: 4)))) {
      return 'Ovulation in ${last7Days.last.difference(date).inDays} days';
    } else {
      return 'Low chance of getting pregnant';
    }
  }

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Rebuild when periodTrackerHistory changes
      _initializeLast7Days();

      return Container(
        height: 200,
        padding: const EdgeInsets.only(
          bottom: AppSizes.vertical_20,
          left: AppSizes.horizontal_15,
          right: AppSizes.horizontal_15,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.whiteColor.withOpacity(0.05),
              AppColors.primaryColor.withOpacity(0.25),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: last7Days.length,
                itemBuilder: (context, index) {
                  final date = last7Days[index];
                  final isSelected = date.day == widget.selectedDate.day &&
                      date.month == widget.selectedDate.month &&
                      date.year == widget.selectedDate.year;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onDateSelected(date);
                      });
                    },
                    child: Container(
                      width: 40,
                      margin: const EdgeInsets.only(
                        top: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.pink : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            _weekdayShort(date.weekday),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(),
            SubtitleText(
              weight: FontWeight.w600,
              text: getDynamicText(widget.selectedDate),
            ),
            CustomButton(
              width: 160,
              height: 36,
              fontSize: 16,
              borderRadius: 16,
              text: 'Log symptoms',
              onTapHandler: () {
                Get.to(() => const LogVellaScreen());
              },
              fontWeight: FontWeight.w600,
              fontColor: AppColors.whiteColor,
              backgroundColor: AppColors.buttonPrimaryColor,
            ),
            SizedBox(),
          ],
        ),
      );
    });
  }

  String _weekdayShort(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
}
