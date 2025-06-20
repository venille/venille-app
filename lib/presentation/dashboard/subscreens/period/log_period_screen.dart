import 'dart:io';
import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/src/model/period_log_info.dart';

class LogPeriodScreen extends StatefulWidget {
  const LogPeriodScreen({super.key});

  @override
  State<LogPeriodScreen> createState() => _LogPeriodScreenState();
}

class _LogPeriodScreenState extends State<LogPeriodScreen> {
  final ScrollController _scrollController = ScrollController();
  final Set<DateTime> _selectedDates = {};
  final Set<DateTime> _loggedDates = {};

  @override
  void initState() {
    super.initState();
    initializePeriodLogHistory();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });
  }

  Future<void> initializePeriodLogHistory() async {
    await ServiceRegistry.periodTrackerService.fetchPeriodLogHistoryService();
    _processPeriodHistory();
    if (mounted) {
      setState(() {});
    }
  }

  void _processPeriodHistory() {
    _selectedDates.clear();
    _loggedDates.clear();
    final periodLogHistory =
        ServiceRegistry.userRepository.periodLogHistory.value;

    for (var log in periodLogHistory) {
      if (log.startDate != null && log.endDate != null) {
        for (var day = log.startDate!;
            !day.isAfter(log.endDate!);
            day = day.add(const Duration(days: 1))) {
          final dateOnly = DateTime(day.year, day.month, day.day);
          _selectedDates.add(dateOnly);
          _loggedDates.add(dateOnly);
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCurrentMonth() {
    final now = DateTime.now();
    final currentMonthIndex = now.month - 1; // 0-based index
    final estimatedMonthHeight = 350.0;
    final scrollPosition = currentMonthIndex * estimatedMonthHeight;
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onDateTapped(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    setState(() {
      if (_selectedDates.contains(dateOnly)) {
        _selectedDates.remove(dateOnly);
      } else {
        _selectedDates.add(dateOnly);
      }
    });
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
                      TitleText(
                        size: 16,
                        title: 'Log period',
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
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BodyText(
                  text: 'Cancel',
                  size: 16,
                  weight: FontWeight.w600,
                  color: AppColors.redColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BodyText(
                  text: 'Save',
                  size: 16,
                  weight: FontWeight.w600,
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMonthCards() {
    final now = DateTime.now();
    // Use the full year of months
    final months = [for (int m = 1; m <= 12; m++) DateTime(now.year, m)];
    return months
        .map((month) => _MonthCalendarCard(
              month: month,
              selectedDates: _selectedDates,
              loggedDates: _loggedDates,
              onDateSelected: _onDateTapped,
            ))
        .toList();
  }
}

class _MonthCalendarCard extends StatelessWidget {
  final DateTime month;
  final Set<DateTime> selectedDates;
  final Set<DateTime> loggedDates;
  final Function(DateTime) onDateSelected;

  const _MonthCalendarCard({
    required this.month,
    required this.selectedDates,
    required this.loggedDates,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final firstWeekday = DateTime(month.year, month.month, 1).weekday;
    final now = DateTime.now();
    final isCurrentMonth = now.year == month.year && now.month == month.month;
    final today = isCurrentMonth ? now.day : null;
    final monthName = _monthName(month.month);
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
      ));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Center(child: TitleText(title: monthName, size: 18)),
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

  const _DayCircle({
    required this.day,
    this.isToday = false,
    this.isSelected = false,
    this.isLogged = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isToday)
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: BodyText(
                  text: 'TODAY',
                  size: 8,
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
    if (isToday && isSelected) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
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
              ? Icon(Icons.check, color: AppColors.redColor, size: 18)
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
        child: Icon(Icons.check, color: AppColors.redColor, size: 18),
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
