// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';

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
      backgroundColor: AppColors.whiteColor,
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
  final itemHeight = 280.0; // Reduced from 300.0

  // Sample data - in real app, this would come from a provider or database
  final Map<DateTime, String> markedDates = {};

  // Add this variable to track period start date
  DateTime? periodStartDate;

  // Add these variables at the top of the class
  Map<DateTime, ReminderData> reminders = {};

  @override
  void initState() {
    super.initState();
    // Initialize sample marked dates
    final now = DateTime.now();
    // Mark ovulation day (teal)
    markedDates[DateTime(now.year, now.month, 18)] = 'ovulation';
    // Mark period days (pink)
    for (int i = 23; i <= 28; i++) {
      markedDates[DateTime(now.year, now.month, i)] = 'period';
    }

    // Scroll to current month immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });
  }

  void _scrollToCurrentMonth() {
    if (_scrollController.hasClients) {
      final currentMonthIndex = today.month - 1;
      _scrollController.jumpTo(currentMonthIndex * itemHeight);
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
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              if (view == 'Year') ...[
                Text(
                  year.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  children:
                      List.generate(12, (i) => _buildYearViewMonth(i + 1)),
                ),
              ] else
                ...List.generate(12, (i) => _buildMonthCalendar(i + 1)),
            ],
          ),
        ),

        // Add these new buttons
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showPeriodDatePicker,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF7DAD),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Log my last period',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _showReminderPicker,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: Color(0xFFFF7DAD)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Set reminder',
                    style: TextStyle(
                      color: Color(0xFFFF7DAD),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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

  Widget _buildMonthCalendar(int month) {
    if (view == 'Year') {
      return _buildYearViewMonth(month);
    }
    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final firstDay = DateTime(year, month, 1);
    final firstWeekday = firstDay.weekday;

    return Container(
      height: itemHeight,
      margin: EdgeInsets.only(bottom: 8), // Reduced from 20
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Add this to minimize height
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              DateFormat('MMMM').format(DateTime(year, month)),
              style: TextStyle(
                fontSize: 20, // Reduced from 24
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            // Wrap GridView with Expanded
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                mainAxisSpacing: 2, // Reduced from 4
                crossAxisSpacing: 2, // Reduced from 4
              ),
              itemCount: 42, // 6 weeks * 7 days
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
                final markedType = markedDates[date];
                final isLastPeriod = markedType == 'last_period';

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
                          if (markedType != null || isToday)
                            isToday
                                ? DottedBorder(
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
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: markedType == 'reminder'
                                          ? Colors.blue.withOpacity(0.2)
                                          : isLastPeriod
                                              ? Colors.green.withOpacity(0.2)
                                              : null,
                                      border: Border.all(
                                        color: markedType == 'reminder'
                                            ? Colors.blue
                                            : isLastPeriod
                                                ? Colors.green
                                                : markedType == 'ovulation'
                                                    ? Colors.teal
                                                    : Color(0xFFFF7DAD),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                day.toString(),
                                style: TextStyle(
                                  color: markedType != null
                                      ? (markedType == 'reminder'
                                          ? Colors.blue
                                          : markedType == 'ovulation'
                                              ? Colors.teal
                                              : Color(0xFFFF7DAD))
                                      : Colors.black,
                                  fontWeight: isToday
                                      ? FontWeight.bold
                                      : FontWeight.w500,
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
                              top: 10,
                              right: 5,
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
          ),
        ],
      ),
    );
  }

  Widget _buildYearViewMonth(int month) {
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
              final markedType = markedDates[date];

              return Center(
                child: Text(
                  day.toString(),
                  style: TextStyle(
                    fontSize: 10,
                    color: markedType != null
                        ? (markedType == 'ovulation'
                            ? Colors.teal
                            : Color(0xFFFF7DAD))
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
