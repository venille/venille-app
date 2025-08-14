import 'dart:io';
import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart';
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/period_day_info.dart';
import 'package:period_tracker_sdk/src/model/monthly_period_info.dart';

class LogPeriodScreen extends StatefulWidget {
  const LogPeriodScreen({super.key});

  @override
  State<LogPeriodScreen> createState() => _LogPeriodScreenState();
}

class _LogPeriodScreenState extends State<LogPeriodScreen> {
  final Set<DateTime> _selectedDates = {};
  final Set<DateTime> _loggedPeriodDates = {};
  final Set<DateTime> _predictedPeriodDates = {};

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initializePeriodLogHistory();
  }

  Future<void> initializePeriodLogHistory() async {
    if (ServiceRegistry
        .userRepository.periodTrackerHistory.value.years.isEmpty) {
      await ServiceRegistry.periodTrackerService
          .fetchPeriodTrackerHistoryService();
    }

    _processPeriodHistory();
    if (mounted) {
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToCurrentMonth();
      });
    }
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

    // If current month is not in the data, add it
    bool hasCurrentMonth = allMonths.any((month) =>
        month.month.toInt() == currentMonth &&
        month.days.isNotEmpty &&
        month.days.first.date.year == currentYear);

    if (!hasCurrentMonth) {
      // Create a placeholder for current month if it's not in the data
      final currentMonthInfo = MonthlyPeriodInfo(
        (b) => b
          ..month = currentMonth
          ..monthName = _getMonthName(currentMonth)
          ..days = ListBuilder<PeriodDayInfo>([]),
      );
      allMonths.add(currentMonthInfo);
    }

    return allMonths;
  }

  // Helper function to get current year months data (for backward compatibility)
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

  // Helper function to get current year
  int getCurrentYear() {
    final periodTracker =
        ServiceRegistry.userRepository.periodTrackerHistory.value;
    if (periodTracker.years.isEmpty) return DateTime.now().year;

    final now = DateTime.now();
    final currentYear = now.year;

    // Find the year data for current year
    final currentYearData = periodTracker.years.firstWhere(
      (year) => year.currentYear.toInt() == currentYear,
      orElse: () => periodTracker.years.first,
    );

    return currentYearData.currentYear.toInt();
  }

  String _getMonthName(int month) {
    const names = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return names[month];
  }

  void _processPeriodHistory() {
    _selectedDates.clear();
    _loggedPeriodDates.clear();
    _predictedPeriodDates.clear();

    final months = getAllMonthsData();
    if (months.isEmpty) {
      return;
    }

    // 1. Collect all predicted days from all months
    List<PeriodDayInfo> allPredictedDays = [];
    for (var month in months) {
      allPredictedDays.addAll(month.days.where((d) => d.isPredictedPeriodDay));
    }

    if (allPredictedDays.isEmpty) return;

    // 2. Sort all predicted days chronologically
    allPredictedDays.sort((a, b) => a.date.compareTo(b.date));

    // 3. Find consecutive ranges across all days
    DateTime rangeStart = allPredictedDays.first.date;
    DateTime rangeEnd = allPredictedDays.first.date;

    for (int i = 1; i < allPredictedDays.length; i++) {
      if (allPredictedDays[i].date.difference(rangeEnd).inDays == 1) {
        // This day is consecutive, extend the range
        rangeEnd = allPredictedDays[i].date;
      } else {
        // The range has ended, process it
        _addRangeToLoggedAndSelected(rangeStart, rangeEnd);
        // Start a new range
        rangeStart = allPredictedDays[i].date;
        rangeEnd = allPredictedDays[i].date;
      }
    }
    // Process the final range
    _addRangeToLoggedAndSelected(rangeStart, rangeEnd);
  }

  void _addRangeToLoggedAndSelected(DateTime startDate, DateTime endDate) {
    log('[CURRENT-RANGE] :: $startDate $endDate');

    DateTime currentDateInRange = startDate;
    while (!currentDateInRange.isAfter(endDate)) {
      final dateToAdd = DateTime(currentDateInRange.year,
          currentDateInRange.month, currentDateInRange.day);
      _predictedPeriodDates.add(dateToAdd);

      _selectedDates.add(dateToAdd);
      currentDateInRange = currentDateInRange.add(const Duration(days: 1));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCurrentMonth() {
    final now = DateTime.now();
    final months = getAllMonthsData();

    int currentMonthIndex = -1;

    if (months.isEmpty) {
      currentMonthIndex = now.month - 1;
    } else {
      for (int i = 0; i < months.length; i++) {
        final monthInfo = months[i];
        final year = monthInfo.days.isNotEmpty
            ? monthInfo.days.first.date.year
            : getCurrentYear();
        if (year == now.year && monthInfo.month.toInt() == now.month) {
          currentMonthIndex = i;
          break;
        }
      }
      if (currentMonthIndex == -1) {
        currentMonthIndex = months.length - 1;
      }
    }

    if (currentMonthIndex != -1 && _scrollController.hasClients) {
      final estimatedMonthHeight = 350.0;
      final scrollPosition = currentMonthIndex * estimatedMonthHeight;
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onDateTapped(DateTime date) {
    log('[DATE-TAPPED] :: $date');

    final dateOnly = DateTime(date.year, date.month, date.day);

    setState(() {
      if (_selectedDates.contains(dateOnly)) {
        final sortedSelectedDates = _selectedDates.toList()..sort();
        int tappedDateIndex =
            sortedSelectedDates.indexWhere((d) => d.isAtSameMomentAs(dateOnly));

        if (tappedDateIndex != -1) {
          DateTime rangeStart = sortedSelectedDates[tappedDateIndex];

          for (int i = tappedDateIndex - 1; i >= 0; i--) {
            if (sortedSelectedDates[i + 1]
                    .difference(sortedSelectedDates[i])
                    .inDays ==
                1) {
              rangeStart = sortedSelectedDates[i];
            } else {
              break;
            }
          }

          DateTime dateToRemove = rangeStart;
          while (!dateToRemove.isAfter(dateOnly)) {
            _selectedDates.remove(dateToRemove);
            dateToRemove = dateToRemove.add(const Duration(days: 1));
          }
        }
      } else {
        final today = DateTime.now();
        final todayOnly = DateTime(today.year, today.month, today.day);

        if (dateOnly.isAfter(todayOnly)) {
          customErrorMessageSnackbar(
            title: 'Message',
            message: 'You cannot log period for future dates!',
          );
          return;
        }
        _selectedDates.add(dateOnly);
      }
    });

    log('[SELECTED-DATES-AFTER-TAP] :: $_selectedDates');
  }

  Map<String, Map<String, List<Map<String, DateTime>>>>
      _processSelectedDates() {
    final Map<String, Map<String, List<Map<String, DateTime>>>> result = {};

    log('[SELECTED-DATES] :: $_selectedDates');

    if (_selectedDates.isEmpty) {
      return result;
    }

    final now = DateTime.now();
    final todayOnly = DateTime(now.year, now.month, now.day);

    // Filter dates to only include dates up to and including today
    final filteredDates =
        _selectedDates.where((date) => !date.isAfter(todayOnly)).toList();

    if (filteredDates.isEmpty) {
      return result;
    }

    // Sort dates to process them in chronological order
    final sortedDates = filteredDates..sort();

    // Build global consecutive ranges, then split by month boundaries and group
    final globalRanges = _findConsecutiveRanges(sortedDates);

    for (final range in globalRanges) {
      final DateTime start = range['start']!;
      final DateTime end = range['end']!;

      final monthSplitRanges = _splitRangeByMonth(start, end);
      for (final split in monthSplitRanges) {
        final DateTime splitStart = split['start']!;
        final String yearKey = splitStart.year.toString();
        final String monthKey = _getMonthName(splitStart.month);

        result.putIfAbsent(yearKey, () => {});
        result[yearKey]!.putIfAbsent(monthKey, () => []);
        result[yearKey]![monthKey]!.add(split);
      }
    }

    return result;
  }

  List<Map<String, DateTime>> _findConsecutiveRanges(List<DateTime> dates) {
    if (dates.isEmpty) return [];

    final ranges = <Map<String, DateTime>>[];
    dates.sort();

    DateTime? rangeStart;
    DateTime? rangeEnd;

    for (int i = 0; i < dates.length; i++) {
      if (rangeStart == null) {
        rangeStart = dates[i];
        rangeEnd = dates[i];
      } else {
        final daysDifference = dates[i].difference(rangeEnd!).inDays;
        if (daysDifference == 1) {
          // Consecutive date
          rangeEnd = dates[i];
        } else {
          // Non-consecutive, save current range and start new one
          ranges.add({
            'start': rangeStart,
            'end': rangeEnd,
          });
          rangeStart = dates[i];
          rangeEnd = dates[i];
        }
      }
    }

    // Add the last range
    if (rangeStart != null && rangeEnd != null) {
      ranges.add({
        'start': rangeStart,
        'end': rangeEnd,
      });
    }

    return ranges;
  }

  // Split a continuous range into month-contained parts so each part stays within a single month
  List<Map<String, DateTime>> _splitRangeByMonth(
      DateTime rangeStart, DateTime rangeEnd) {
    final List<Map<String, DateTime>> parts = [];

    DateTime segmentStart =
        DateTime(rangeStart.year, rangeStart.month, rangeStart.day);
    final DateTime finalEnd =
        DateTime(rangeEnd.year, rangeEnd.month, rangeEnd.day);

    while (true) {
      final int lastDay =
          DateUtils.getDaysInMonth(segmentStart.year, segmentStart.month);
      final DateTime endOfMonth =
          DateTime(segmentStart.year, segmentStart.month, lastDay);

      if (!endOfMonth.isBefore(finalEnd)) {
        parts.add({'start': segmentStart, 'end': finalEnd});
        break;
      } else {
        parts.add({'start': segmentStart, 'end': endOfMonth});
        // Move to next month start
        final bool isDecember = segmentStart.month == 12;
        segmentStart = DateTime(
            isDecember ? segmentStart.year + 1 : segmentStart.year,
            isDecember ? 1 : segmentStart.month + 1,
            1);
      }
    }

    return parts;
  }

  PeriodTrackerHistoryDto _createPeriodTrackerPayload(
      Map<String, Map<String, List<Map<String, DateTime>>>> processedData) {
    final List<PeriodYearDto> years = [];

    for (final yearEntry in processedData.entries) {
      final year = int.parse(yearEntry.key);
      final months = <PeriodMonthDto>[];

      for (final monthEntry in yearEntry.value.entries) {
        final ranges = monthEntry.value;
        for (final range in ranges) {
          final startDate = range['start']!;
          final endDate = range['end']!;

          // Convert DateTime to String format (ISO 8601)
          final startDateString =
              startDate.toIso8601String().split('T')[0]; // YYYY-MM-DD
          final endDateString =
              endDate.toIso8601String().split('T')[0]; // YYYY-MM-DD

          months.add(PeriodMonthDto((instance) => instance
            ..startDate = startDateString
            ..endDate = endDateString));
        }
      }

      years.add(PeriodYearDto((instance) => instance
        ..year = year
        ..months = ListBuilder(months)));
    }

    return PeriodTrackerHistoryDto(
        (instance) => instance..years = ListBuilder(years));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: Container(
              height: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.horizontal_15,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(
                        callBackFunction: () {
                          Get.back();
                        },
                      ),
                      const TitleText(
                        size: 16,
                        title: 'Log Period',
                      ),
                      const SizedBox(width: AppSizes.horizontal_35),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 4,
                      left: AppSizes.horizontal_10,
                      right: AppSizes.horizontal_10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(title: 'M', size: 14),
                        TitleText(title: 'T', size: 14),
                        TitleText(title: 'W', size: 14),
                        TitleText(title: 'T', size: 14),
                        TitleText(title: 'F', size: 14),
                        TitleText(title: 'S', size: 14),
                        TitleText(title: 'S', size: 14),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: RefreshIndicator(
        onRefresh: initializePeriodLogHistory,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.only(
            bottom: AppSizes.vertical_30,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontal_10,
            ),
            child: Column(
              children: [
                ..._buildMonthCards(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(
          top: AppSizes.vertical_10,
          left: AppSizes.horizontal_15,
          right: AppSizes.horizontal_15,
          bottom:
              Platform.isAndroid ? AppSizes.vertical_10 : AppSizes.vertical_25,
        ),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          border: Border(
            top: BorderSide(
              width: 1,
              color: AppColors.grayLightColor,
            ),
          ),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BodyText(
                    text: AppLocale.cancel.getString(context),
                    size: 16,
                    weight: FontWeight.w600,
                    color: AppColors.redColor,
                  ),
                ),
              ),
              ServiceRegistry.periodTrackerService
                      .isLogPeriodLogHistoryProcessing.value
                  ? const CustomLoadingButton(
                      height: 30,
                      width: 80,
                      backgroundColor: AppColors.greenColor,
                    )
                  : CustomButton(
                      text: AppLocale.save.getString(context),
                      width: 90,
                      height: 30,
                      fontSize: 16,
                      borderRadius: 16,
                      onTapHandler: () {
                        if (ServiceRegistry.periodTrackerService
                            .isLogPeriodLogHistoryProcessing.value) {
                          return;
                        }

                        final processedData = _processSelectedDates();
                        // log('Processed data: $processedData');

                        // Create payload from processed data
                        PeriodTrackerHistoryDto payload =
                            _createPeriodTrackerPayload(processedData);

                        log('[LOG-PERIOD-HISTORY-PAYLOAD] :: $payload');
                        
                        ServiceRegistry.periodTrackerService
                            .logPeriodTrackerHistoryService(payload);
                      },
                      fontWeight: FontWeight.w500,
                      fontColor: AppColors.whiteColor,
                      backgroundColor: AppColors.greenColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMonthCards() {
    final months = getAllMonthsData();

    if (months.isEmpty) {
      // Fallback to current year if no data available
      final now = DateTime.now();
      final monthDates = [
        for (int m = 1; m <= now.month + 1; m++) DateTime(now.year, m)
      ];
      return monthDates
          .map((month) => _MonthCalendarCard(
                month: month,
                selectedDates: _selectedDates,
                loggedDates: _predictedPeriodDates,
                onDateSelected: _onDateTapped,
                isFutureMonth: month.month > now.month,
              ))
          .toList();
    }

    // Use actual data from backend
    final now = DateTime.now();
    return months.map((monthInfo) {
      // Extract year from the first day of the month
      final year = monthInfo.days.isNotEmpty
          ? monthInfo.days.first.date.year
          : getCurrentYear();

      // Create DateTime for the month using the extracted year
      final month = DateTime(year, monthInfo.month.toInt());

      final isFutureMonth = month.month > now.month && month.year >= now.year;

      return _MonthCalendarCard(
        month: month,
        selectedDates: _selectedDates,
        loggedDates: _predictedPeriodDates,
        onDateSelected: _onDateTapped,
        isFutureMonth: isFutureMonth,
      );
    }).toList();
  }
}

class _MonthCalendarCard extends StatelessWidget {
  final DateTime month;
  final Set<DateTime> selectedDates;
  final Set<DateTime> loggedDates;
  final Function(DateTime) onDateSelected;
  final bool isFutureMonth;

  const _MonthCalendarCard({
    required this.month,
    required this.selectedDates,
    required this.loggedDates,
    required this.onDateSelected,
    required this.isFutureMonth,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final firstWeekday = DateTime(month.year, month.month, 1).weekday;
    final now = DateTime.now();
    final isCurrentMonth = now.year == month.year && now.month == month.month;
    final today = isCurrentMonth ? now.day : null;
    final monthName = _monthName(month.month);
    final isCurrentYear = month.year == now.year;
    final displayTitle = isCurrentYear ? monthName : '$monthName ${month.year}';

    List<Widget> dayWidgets = [];
    for (int i = 1; i < firstWeekday; i++) {
      dayWidgets.add(const SizedBox());
    }

    for (int day = 1; day <= daysInMonth; day++) {
      final currentDate = DateTime(month.year, month.month, day);
      final isToday = today == day;
      final isSelected = selectedDates.contains(currentDate);
      final isLogged = loggedDates.contains(currentDate);

      dayWidgets.add(_DayCircle(
        day: day,
        isToday: isToday,
        isSelected: isSelected,
        isLogged: isLogged,
        onTap: () => onDateSelected(currentDate),
        isFutureMonth: isFutureMonth,
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Center(child: TitleText(title: displayTitle, size: 18)),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 4,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
            children: dayWidgets,
          ),
        ],
      ),
    );
  }

  String _monthName(int month) {
    const names = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return names[month];
  }
}

class _DayCircle extends StatelessWidget {
  final int day;
  final bool isToday;
  final bool isSelected;
  final bool isLogged;
  final VoidCallback onTap;
  final bool isFutureMonth;

  const _DayCircle({
    required this.day,
    this.isToday = false,
    this.isSelected = false,
    this.isLogged = false,
    required this.onTap,
    this.isFutureMonth = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isFutureMonth ? null : onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isToday)
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: BodyText(
                  text: AppLocale.today.getString(context),
                  size: 6,
                  weight: FontWeight.bold,
                  color: AppColors.redColor,
                ),
              ),
            BodyText(
              size: 14,
              text: day.toString(),
              color: isToday ? AppColors.redColor : null,
            ),
            const SizedBox(height: 4),
            _buildCheckCircle(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckCircle() {
    // For future months, always show normal borders and disable interactions
    if (isFutureMonth) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: AppColors.grayLightColor,
          ),
        ),
      );
    }

    if (isToday && isSelected) {
      return Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.redColor,
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 18),
      );
    }

    if (isLogged) {
      return DottedBorder(
        borderType: BorderType.Circle,
        color: isSelected ? AppColors.redColor : AppColors.grayLightColor,
        strokeWidth: 1.5,
        dashPattern: const [4, 4],
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          width: 28,
          height: 28,
          child: isSelected
              ? const Icon(Icons.check, color: AppColors.redColor, size: 18)
              : null,
        ),
      );
    }

    if (isSelected) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5,
            color: AppColors.redColor,
          ),
        ),
        child: const Icon(Icons.check, color: AppColors.redColor, size: 18),
      );
    }

    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: AppColors.grayLightColor,
        ),
      ),
    );
  }
}
