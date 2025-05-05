import 'package:flutter/material.dart';
import 'package:venille/components/home/home_date_picker.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/default_appbar.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      key: scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: DefaultAppBar(
          scaffoldKey: scaffoldKey,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
              // horizontal: AppSizes.horizontal_10,
              ),
          child: Column(
            children: [
              Last7DaysWidget(
                selectedDate: selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              const SizedBox(height: AppSizes.vertical_10),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: getMenstrualInsights(selectedDate).map((item) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: item['bgColor']?.withOpacity(0.5),
                      border: Border.all(
                        color: AppColors.grayLightColor,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: TextStyle(
                            color: item['textColor'],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (item['subtitle'] != null && item['subtitle'] != '')
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              item['subtitle'],
                              style: TextStyle(
                                color: item['textColor'],
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        if (item['icon'] != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Icon(
                              item['icon'],
                              size: 16,
                              color: item['textColor'],
                            ),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSizes.vertical_20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (int value) {
          ServiceRegistry.commonRepository.currentScreenIndex.value = value;
        },
        currentPage: ServiceRegistry.commonRepository.currentScreenIndex.value,
      ),
    );
  }

  List<Map<String, dynamic>> getMenstrualInsights(DateTime selectedDate) {
    final titles = [
      "Cycle overview",
      "Symptoms to expect",
      "Today's discharge",
      "Mood & emotions",
      "Advice of the day",
      "Coping with cramps",
      "Hydration reminder"
    ];
    final subtitles = [
      "See your cycle details",
      "View now",
      "Check info",
      "Track your mood",
      "See update",
      "Tips for relief",
      "Drink water"
    ];
    final bgColors = [
      Colors.purple[100],
      Colors.pink[100],
      Colors.teal[100],
      Colors.yellow[100],
      Colors.blue[100],
      Colors.orange[100],
      Colors.green[100],
    ];
    final textColors = [
      Colors.purple[900],
      Colors.pink[800],
      Colors.teal[900],
      Colors.yellow[900],
      Colors.blue[900],
      Colors.orange[900],
      Colors.green[900],
    ];
    final borderColors = [
      Colors.purple,
      Colors.pink,
      Colors.teal,
      Colors.yellow,
      Colors.blue,
      Colors.orange,
      Colors.green,
    ];
    final icons = [
      Icons.calendar_today,
      Icons.healing,
      Icons.opacity,
      Icons.emoji_emotions,
      Icons.lightbulb,
      Icons.favorite,
      Icons.local_drink,
    ];

    return List.generate(7, (i) {
      final date = selectedDate.subtract(Duration(days: 6 - i));
      final dateStr = DateFormat('MMM d').format(date); // e.g., May 4
      return {
        'title': '$dateStr: ${titles[i]}',
        'subtitle': subtitles[i],
        'bgColor': bgColors[i],
        'textColor': textColors[i],
        'borderColor': borderColors[i],
        'icon': icons[i],
      };
    });
  }
}
