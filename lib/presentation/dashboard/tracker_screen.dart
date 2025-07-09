// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/period_day_info.dart';
import 'package:period_tracker_sdk/src/model/monthly_period_info.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      key: scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: TitledAppbar(
          title: 'Tracker',
          scaffoldKey: scaffoldKey,
        ),
      ),
      body: CalendarScrollView(),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (int value) {
          ServiceRegistry.commonRepository.currentScreenIndex.value = value;
        },
        currentPage: ServiceRegistry.commonRepository.currentScreenIndex.value,
      ),
    );
  }
}

class ReminderData {
  final DateTime dateTime;
  final String title;

  ReminderData({required this.dateTime, required this.title});
}

class CalendarScrollView extends StatefulWidget {
  @override
  _CalendarScrollViewState createState() => _CalendarScrollViewState();
}

class _CalendarScrollViewState extends State<CalendarScrollView> {
  String view = 'Month';
  final int year = DateTime.now().year;
  final DateTime today = DateTime.now();
  final List<String> weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  final ScrollController _scrollController = ScrollController();

  // Sample data - in real app, this would come from a provider or database
  final Map<DateTime, String> markedDates = {};

  // Add this variable to track period start date
  DateTime? periodStartDate;

  // Add these variables at the top of the class
  Map<DateTime, ReminderData> reminders = {};

  // Add these variables for period tracking
  final Set<DateTime> _loggedDates = {};
  final Set<DateTime> _predictedDates = {};

  @override
  void initState() {
    super.initState();
    initializePeriodTrackerHistory();
  }

  Future<void> initializePeriodTrackerHistory() async {
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
    try {
      final periodTracker =
          ServiceRegistry.userRepository.periodTrackerHistory.value;
      if (periodTracker.years.isEmpty) return [];

      List<MonthlyPeriodInfo> allMonths = [];

      for (var yearData in periodTracker.years) {
        if (yearData.months.isNotEmpty) {
          for (var month in yearData.months) {
            // Safety check: ensure month has valid data
            if (month.month.toInt() >= 1 && month.month.toInt() <= 12) {
              allMonths.add(month);
            }
          }
        }
      }

      return allMonths;
    } catch (e) {
      // Return empty list if there's any error
      return [];
    }
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
    return names[month].tr;
  }

  void _processPeriodHistory() {
    _loggedDates.clear();
    _predictedDates.clear();

    final months = getAllMonthsData();
    if (months.isEmpty) {
      return;
    }

    // Process all months to extract logged and predicted dates
    for (var month in months) {
      for (var day in month.days) {
        final date = DateTime(day.date.year, day.date.month, day.date.day);

        // For now, treat predicted period days as logged dates (similar to log_period_screen)
        if (day.isPredictedPeriodDay) {
          _loggedDates.add(date);
        }

        // Keep track of predicted dates separately for display
        if (day.isPredictedPeriodDay) {
          _predictedDates.add(date);
        }
      }
    }
  }

  void _scrollToCurrentMonth() {
    if (_scrollController.hasClients) {
      const double estimatedItemHeight = 230.0;
      const double yearHeaderHeight = 50.0;

      // Calculate the correct scroll position based on the actual calendar layout
      final months = getAllMonthsData();
      final now = DateTime.now();

      if (months.isEmpty) {
        // Fallback: scroll to current month in current year
        final currentMonthIndex = now.month - 1;
        final scrollPosition = currentMonthIndex * estimatedItemHeight;
        _scrollController.jumpTo(scrollPosition);
        return;
      }

      // Count how many months come before the current month
      int monthsBeforeCurrent = 0;
      int yearsBeforeCurrent = 0;
      bool foundCurrentMonth = false;

      for (var yearData
          in ServiceRegistry.userRepository.periodTrackerHistory.value.years) {
        final year = yearData.currentYear.toInt();

        if (year < now.year) {
          // Add all months from years before current year
          yearsBeforeCurrent++;
          monthsBeforeCurrent += yearData.months.length;
        } else if (year == now.year) {
          // Add months from current year that come before current month
          for (var month in yearData.months) {
            if (month.month.toInt() < now.month) {
              monthsBeforeCurrent++;
            } else if (month.month.toInt() == now.month) {
              foundCurrentMonth = true;
              break;
            }
          }
          break;
        }
      }

      if (!foundCurrentMonth) {
        _scrollController.jumpTo(0.0);
        return;
      }

      // Calculate scroll position: year headers + months before current month
      final scrollPosition = (yearsBeforeCurrent * yearHeaderHeight) +
          (monthsBeforeCurrent * estimatedItemHeight);

      _scrollController.jumpTo(scrollPosition);
    }
  }

  // Add this method to show date picker
  Future<void> _showPeriodDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(year, 1, 1),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFF7DAD),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        periodStartDate = picked;
        // Update markedDates to show the period
        markedDates[picked] = 'last_period';
      });
    }
  }

  // Add this method to show date and time picker for reminder
  Future<void> _showReminderPicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(year + 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFF7DAD),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final textController = TextEditingController();
        final reminderTitle = await showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Set Reminder Title'),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Enter reminder title',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, textController.text),
                child: Text('Set'),
              ),
            ],
          ),
        );

        if (reminderTitle != null) {
          setState(() {
            final reminderDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            reminders[pickedDate] = ReminderData(
              dateTime: reminderDateTime,
              title: reminderTitle,
            );
            markedDates[pickedDate] = 'reminder';
          });
        }
      }
    }
  }

  // Add this method to show reminder details
  void _showReminderDetails(DateTime date) {
    final reminder = reminders[date];
    if (reminder != null) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reminder Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Title: ${reminder.title}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Date: ${DateFormat('MMM dd, yyyy').format(reminder.dateTime)}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Time: ${DateFormat('hh:mm a').format(reminder.dateTime)}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Month/Year Toggle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: ['Month', 'Year'].map((type) {
                bool isSelected = view == type;
                return GestureDetector(
                  onTap: () => setState(() => view = type),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Weekday headers
        if (view != 'Year')
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: weekdays
                  .map((day) => Text(
                        day,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                  .toList(),
            ),
          ),

        Expanded(
          child: RefreshIndicator(
            onRefresh: initializePeriodTrackerHistory,
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                if (view == 'Year')
                  ..._buildYearView()
                else
                  ..._buildAllMonthCalendars(),
              ],
            ),
          ),
        ),

        // Add these new buttons
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.logPeriodRoute);
                },
                child: Container(
                  width: 100,
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
    );
  }

  List<Widget> _buildAllMonthCalendars() {
    final months = getAllMonthsData();

    if (months.isEmpty) {
      // Fallback to current year if no data available
      final now = DateTime.now();
      final monthDates = [for (int m = 1; m <= 12; m++) DateTime(now.year, m)];
      return monthDates
          .map((month) => _buildMonthCalendar(month.month, month.year))
          .toList();
    }

    // Use actual data from backend - show all years
    List<Widget> allCalendars = [];

    try {
      for (var yearData
          in ServiceRegistry.userRepository.periodTrackerHistory.value.years) {
        final year = yearData.currentYear.toInt();

        // Add year header
        allCalendars.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              year.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );

        // Add all months for this year
        for (var month in yearData.months) {
          final monthNumber = month.month.toInt();
          // Safety check: ensure month is valid (1-12)
          if (monthNumber >= 1 && monthNumber <= 12) {
            allCalendars.add(_buildMonthCalendar(monthNumber, year));
          }
        }
      }
    } catch (e) {
      // If there's any error, fallback to current year
      final now = DateTime.now();
      final monthDates = [for (int m = 1; m <= 12; m++) DateTime(now.year, m)];
      return monthDates
          .map((month) => _buildMonthCalendar(month.month, month.year))
          .toList();
    }

    return allCalendars;
  }

  List<Widget> _buildYearView() {
    var years = ServiceRegistry.userRepository.periodTrackerHistory.value.years
        .map((e) => e.currentYear.toInt())
        .toSet() // Use a Set to avoid duplicate years
        .toList();
    if (years.isEmpty) {
      years = [DateTime.now().year];
    }
    years.sort(); // Sort years chronologically

    List<Widget> yearWidgets = [];
    for (var yearToShow in years) {
      yearWidgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text(
            yearToShow.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
      yearWidgets.add(
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          childAspectRatio: 0.9,
          mainAxisSpacing: 0, // Reduced spacing to 0
          crossAxisSpacing: 8,
          children:
              List.generate(12, (i) => _buildYearViewMonth(yearToShow, i + 1)),
        ),
      );
    }
    return yearWidgets;
  }

  Widget _buildMonthCalendar(int month, int year) {
    if (view == 'Year') {
      return _buildYearViewMonth(year, month);
    }
    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final firstDay = DateTime(year, month, 1);
    final firstWeekday = firstDay.weekday;

    return Container(
      margin: EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 0.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('MMMM').format(DateTime(year, month)),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (year != DateTime.now().year) ...[
                    SizedBox(width: 8),
                    BodyText(
                      text: year.toString(),
                      weight: FontWeight.w500,
                    ),
                  ],
                ],
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 0.9,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              final weekday = index % 7;
              final day = index - firstWeekday + 2;

              if (day < 1 || day > daysInMonth) {
                return Container();
              }

              final date = DateTime(year, month, day);
              final isToday = date.year == today.year &&
                  date.month == today.month &&
                  date.day == today.day;
              final isLogged = _loggedDates.contains(date);
              final isPredicted = _predictedDates.contains(date);
              final markedType = markedDates[date];

              return Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (markedType == 'reminder') {
                        _showReminderDetails(date);
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isLogged ||
                            isPredicted ||
                            markedType != null ||
                            isToday)
                          _buildDayCircle(
                            isToday: isToday,
                            isLogged: isLogged,
                            isPredicted: isPredicted,
                            markedType: markedType,
                          ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              day.toString(),
                              style: TextStyle(
                                color: _getDayTextColor(
                                    isLogged, isPredicted, markedType, isToday),
                                fontWeight:
                                    isToday ? FontWeight.bold : FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            if (isToday)
                              Text(
                                'TODAY',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                        if (markedType == 'reminder')
                          Positioned(
                            top: 8,
                            right: 4,
                            child: Icon(
                              Icons.notifications,
                              size: 10,
                              color: Colors.blue,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDayCircle({
    required bool isToday,
    required bool isLogged,
    required bool isPredicted,
    String? markedType,
  }) {
    if (isToday && (isLogged || markedType != null)) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.redColor.withOpacity(0.2),
        ),
        // child: const Icon(Icons.check, color: Colors.white, size: 18),
      );
    }

    if (isLogged) {
      return DottedBorder(
        borderType: BorderType.Circle,
        color: AppColors.redColor,
        strokeWidth: 1.5,
        dashPattern: const [4, 4],
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          width: 32,
          height: 32,
        ),
      );
    }

    if (isPredicted) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5,
            color: Color(0xFFFF7DAD),
          ),
        ),
      );
    }

    if (markedType == 'reminder') {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.2),
          border: Border.all(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
      );
    }

    if (isToday) {
      return DottedBorder(
        color: Colors.red,
        strokeWidth: 1.5,
        radius: Radius.circular(100),
        padding: EdgeInsets.all(4),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    return Container();
  }

  Color _getDayTextColor(
      bool isLogged, bool isPredicted, String? markedType, bool isToday) {
    if (isToday) return Colors.red;
    if (isLogged) return AppColors.redColor;
    if (isPredicted) return Color(0xFFFF7DAD);
    if (markedType == 'reminder') return Colors.blue;
    return Colors.black;
  }

  Widget _buildYearViewMonth(int year, int month) {
    // Safety check: ensure month is valid
    if (month < 1 || month > 12) {
      return Container(); // Return empty container for invalid month
    }

    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final firstDay = DateTime(year, month, 1);
    final firstWeekday = firstDay.weekday;

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('MMMM').format(DateTime(year, month)),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              final weekday = index % 7;
              final day = index - firstWeekday + 2;

              if (day < 1 || day > daysInMonth) {
                return Container();
              }

              final date = DateTime(year, month, day);
              final isToday = date.year == today.year &&
                  date.month == today.month &&
                  date.day == today.day;
              final isLogged = _loggedDates.contains(date);
              final isPredicted = _predictedDates.contains(date);

              return Center(
                child: Text(
                  day.toString(),
                  style: TextStyle(
                    fontSize: 10,
                    color: isLogged
                        ? AppColors.redColor
                        : isPredicted
                            ? Color(0xFFFF7DAD)
                            : Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
