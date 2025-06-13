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
  void initState() {
    super.initState();

    ServiceRegistry.periodTrackerService.fetchPeriodTrackerHistoryService();
  }

  @override
  Widget build(BuildContext context) {
    final healthInsights = getHealthInsights();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
          padding: const EdgeInsets.symmetric(),
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
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: getMenstrualInsights(selectedDate).length,
                  itemBuilder: (context, index) {
                    final item = getMenstrualInsights(selectedDate)[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      margin: EdgeInsets.only(right: 8),
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
                          if (item['subtitle'] != null &&
                              item['subtitle'] != '')
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
                  },
                ),
              ),
              const SizedBox(height: AppSizes.vertical_20),
              // My Cycles Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My cycles',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildCycleInfoRow(
                            'Previous cycle length',
                            '36 days',
                            'ABNORMAL',
                            Colors.orange,
                            Icons.warning_amber_rounded,
                          ),
                          const Divider(height: 1),
                          _buildCycleInfoRow(
                            'Previous period length',
                            '5 days',
                            'NORMAL',
                            Colors.green,
                            Icons.check_circle_outline,
                          ),
                          const Divider(height: 1),
                          _buildCycleInfoRow(
                            'Cycle length variation',
                            '24-60 days',
                            'IRREGULAR',
                            Colors.orange,
                            Icons.warning_amber_rounded,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.vertical_20),
              // Cycle History Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Cycle history',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle see all tap
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'See all',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey[600],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildCycleHistoryEntry(
                        'Current cycle: 15 days',
                        'Started Apr 21',
                        [
                          6,
                          8,
                          0
                        ], // periodDays, fertileDays, totalDays (remaining calculated)
                      ),
                      const Divider(height: 1),
                      _buildCycleHistoryEntry(
                        '36 days',
                        'Mar 16 – Apr 20',
                        [5, 10, 20],
                      ),
                      const Divider(height: 1),
                      _buildCycleHistoryEntry(
                        '24 days',
                        'Feb 20 – Mar 15',
                        [5, 8, 24],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.vertical_20),
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: healthInsights.length,
                  itemBuilder: (context, index) {
                    final item = healthInsights[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      margin: EdgeInsets.only(right: 8),
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
                          if (item['subtitle'] != null &&
                              item['subtitle'] != '')
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
                  },
                ),
              ),
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

  List<Map<String, dynamic>> getHealthInsights() {
    return [
      // Cycle & Health Tracking
      {
        'title': 'Period Countdown',
        'subtitle': '7 days until next period',
        'bgColor': Color(0xFFFFE0E6), // Light rose pink
        'textColor': Color(0xFFD81B60), // Deep rose
        'borderColor': Color(0xFFEC407A),
        'icon': Icons.calendar_today,
      },
      {
        'title': 'Fertility Window',
        'subtitle': 'High fertility: Next 3 days',
        'bgColor': Color(0xFFE8F5E9), // Mint green
        'textColor': Color(0xFF2E7D32), // Forest green
        'borderColor': Color(0xFF66BB6A),
        'icon': Icons.favorite,
      },
      {
        'title': 'Ovulation Day',
        'subtitle': 'Expected in 2 days',
        'bgColor': Color(0xFFF3E5F5), // Light lavender
        'textColor': Color(0xFF7B1FA2), // Deep purple
        'borderColor': Color(0xFFAB47BC),
        'icon': Icons.egg_outlined,
      },
      {
        'title': 'Cycle Phase',
        'subtitle': 'Follicular Phase - Day 8',
        'bgColor': Color(0xFFE1F5FE), // Light sky blue
        'textColor': Color(0xFF0277BD), // Deep blue
        'borderColor': Color(0xFF29B6F6),
        'icon': Icons.cyclone,
      },
      {
        'title': 'BMI & Weight',
        'subtitle': 'Track your measurements',
        'bgColor': Color(0xFFFFF3E0), // Light peach
        'textColor': Color(0xFFEF6C00), // Deep orange
        'borderColor': Color(0xFFFFA726),
        'icon': Icons.monitor_weight,
      },
      {
        'title': 'Sleep Quality',
        'subtitle': '7.5 hours last night',
        'bgColor': Color(0xFFE8EAF6), // Light indigo
        'textColor': Color(0xFF283593), // Deep indigo
        'borderColor': Color(0xFF5C6BC0),
        'icon': Icons.bedtime,
      },
      // Wellness & Lifestyle
      {
        'title': 'Water Intake',
        'subtitle': '4/8 glasses today',
        'bgColor': Color(0xFFE0F7FA), // Light cyan
        'textColor': Color(0xFF006064), // Deep cyan
        'borderColor': Color(0xFF26C6DA),
        'icon': Icons.water_drop,
      },
      {
        'title': 'Exercise Tips',
        'subtitle': 'Best workouts for your phase',
        'bgColor': Color(0xFFF1F8E9), // Light lime
        'textColor': Color(0xFF33691E), // Deep lime
        'borderColor': Color(0xFF9CCC65),
        'icon': Icons.fitness_center,
      },
      {
        'title': 'Nutrition Guide',
        'subtitle': 'Foods to boost energy',
        'bgColor': Color(0xFFFBE9E7), // Light coral
        'textColor': Color(0xFFD84315), // Deep coral
        'borderColor': Color(0xFFFF7043),
        'icon': Icons.restaurant,
      },
      {
        'title': 'Sleep Schedule',
        'subtitle': 'Optimal rest times',
        'bgColor': Color(0xFFE0F2F1), // Light teal
        'textColor': Color(0xFF004D40), // Deep teal
        'borderColor': Color(0xFF26A69A),
        'icon': Icons.nights_stay,
      },
      {
        'title': 'Stress Management',
        'subtitle': 'Relaxation techniques',
        'bgColor': Color(0xFFF9FBE7), // Light lime yellow
        'textColor': Color(0xFF827717), // Deep lime yellow
        'borderColor': Color(0xFFD4E157),
        'icon': Icons.spa,
      },
      // Health Insights
      {
        'title': 'Health Tips',
        'subtitle': 'Personalized for you',
        'bgColor': Color(0xFFE3F2FD), // Light azure
        'textColor': Color(0xFF1565C0), // Deep azure
        'borderColor': Color(0xFF42A5F5),
        'icon': Icons.lightbulb,
      },
      {
        'title': 'Symptom Patterns',
        'subtitle': 'View your trends',
        'bgColor': Color(0xFFEFEBE9), // Light brown
        'textColor': Color(0xFF4E342E), // Deep brown
        'borderColor': Color(0xFF8D6E63),
        'icon': Icons.analytics,
      },
      {
        'title': 'Cycle Statistics',
        'subtitle': '28 day average cycle',
        'bgColor': Color(0xFFE8F5E9), // Light forest green
        'textColor': Color(0xFF2E7D32), // Deep forest green
        'borderColor': Color(0xFF66BB6A),
        'icon': Icons.bar_chart,
      },
      {
        'title': 'Flow Analysis',
        'subtitle': 'Track your flow',
        'bgColor': Color(0xFFE1F5FE), // Light cerulean
        'textColor': Color(0xFF0277BD), // Deep cerulean
        'borderColor': Color(0xFF29B6F6),
        'icon': Icons.waves,
      },
      {
        'title': 'Medication',
        'subtitle': 'View reminders',
        'bgColor': Color(0xFFF3E5F5), // Light mauve
        'textColor': Color(0xFF7B1FA2), // Deep mauve
        'borderColor': Color(0xFFAB47BC),
        'icon': Icons.medication,
      },
    ];
  }

  // Helper method for cycle info rows
  Widget _buildCycleInfoRow(
    String title,
    String value,
    String status,
    Color statusColor,
    IconData statusIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                statusIcon,
                color: statusColor,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCycleHistoryEntry(
    String cycleName,
    String dateRange,
    List<int> cycleInfo, // [periodDays, fertileDays, totalDays]
  ) {
    final int periodDays = cycleInfo[0];
    final int fertileDays = cycleInfo[1];
    final int totalDays = cycleInfo[2];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cycleName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dateRange,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Dots visualization
          Row(
            children: [
              for (int i = 0; i < totalDays; i++)
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i < periodDays
                          ? Color(0xFFFF4081) // Period days (pink)
                          : i >= totalDays - fertileDays
                              ? Color(0xFF40C4FF) // Fertile days (blue)
                              : Colors.grey[300], // Regular days (gray)
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
