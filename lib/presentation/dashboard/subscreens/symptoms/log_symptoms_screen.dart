import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';

class LogVellaScreen extends StatefulWidget {
  const LogVellaScreen({super.key});

  @override
  State<LogVellaScreen> createState() => _LogVellaScreenState();
}

class _LogVellaScreenState extends State<LogVellaScreen> {
  Set<String> selectedSymptoms = {};
  bool isProcessing = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Map<String, List<Map<String, dynamic>>> categories = {
    'Symptoms': [
      {'name': 'Everything is fine', 'icon': Icons.check_circle_outline},
      {'name': 'Cramps', 'icon': Icons.waves},
      {'name': 'Tender breasts', 'icon': Icons.favorite_border},
      {'name': 'Headache', 'icon': Icons.sick},
      {'name': 'Acne', 'icon': Icons.face},
      {'name': 'Backache', 'icon': Icons.accessibility_new},
      {'name': 'Fatigue', 'icon': Icons.battery_alert},
      {'name': 'Insomnia', 'icon': Icons.nightlight_round},
      {'name': 'Abdominal pain', 'icon': Icons.healing},
      {'name': 'Vaginal itching', 'icon': Icons.warning},
    ],
    'Mood': [
      {'name': 'Calm', 'icon': Icons.sentiment_satisfied},
      {'name': 'Happy', 'icon': Icons.sentiment_very_satisfied},
      {'name': 'Energetic', 'icon': Icons.bolt},
      {'name': 'Frisky', 'icon': Icons.mood},
      {'name': 'Mood swings', 'icon': Icons.swap_horiz},
      {'name': 'Irritated', 'icon': Icons.mood_bad},
      {'name': 'Sad', 'icon': Icons.sentiment_dissatisfied},
      {'name': 'Anxious', 'icon': Icons.psychology},
      {'name': 'Depressed', 'icon': Icons.cloud},
      {'name': 'Feeling guilty', 'icon': Icons.face_retouching_natural},
    ],
    'Vaginal discharge': [
      {'name': 'No discharge', 'icon': Icons.block},
      {'name': 'Creamy', 'icon': Icons.opacity},
      {'name': 'Watery', 'icon': Icons.water_drop},
      {'name': 'Sticky', 'icon': Icons.grain},
      {'name': 'Egg white', 'icon': Icons.egg},
      {'name': 'Spotting', 'icon': Icons.circle},
    ],
    'Sex and sex drive': [
      {'name': "Didn't have sex", 'icon': Icons.do_not_disturb},
      {'name': 'Protected sex', 'icon': Icons.security},
      {'name': 'Unprotected sex', 'icon': Icons.warning_amber},
      {'name': 'Oral sex', 'icon': Icons.favorite},
      {'name': 'Masturbation', 'icon': Icons.spa},
      {'name': 'High sex drive', 'icon': Icons.trending_up},
      {'name': 'Low sex drive', 'icon': Icons.trending_down},
    ],
    'Digestion and stool': [
      {'name': 'Nausea', 'icon': Icons.sick_outlined},
      {'name': 'Bloating', 'icon': Icons.circle_outlined},
      {'name': 'Constipation', 'icon': Icons.do_not_disturb_on_outlined},
      {'name': 'Diarrhea', 'icon': Icons.running_with_errors_outlined},
    ],
    'Pregnancy test': [
      {'name': "Didn't take tests", 'icon': Icons.not_interested_outlined},
      {'name': 'Positive', 'icon': Icons.add_circle_outline},
      {'name': 'Negative', 'icon': Icons.remove_circle_outline},
      {'name': 'Faint line', 'icon': Icons.remove_circle_outline},
    ],
    'Ovulation test': [
      {'name': "Didn't take tests", 'icon': Icons.not_interested_outlined},
      {'name': 'Test: positive', 'icon': Icons.add_circle_outline},
      {'name': 'Test: negative', 'icon': Icons.remove_circle_outline},
      {'name': 'Ovulation: my method', 'icon': Icons.calendar_today_outlined},
    ],
    'Other': [
      {'name': 'Travel', 'icon': Icons.place},
      {'name': 'Stress', 'icon': Icons.flash_on},
      {'name': 'Meditation', 'icon': Icons.spa},
      {'name': 'Journaling', 'icon': Icons.book},
      {'name': 'Kegel exercises', 'icon': Icons.favorite_border},
      {'name': 'Breathing exercises', 'icon': Icons.air},
      {'name': 'Disease or injury', 'icon': Icons.medical_services},
      {'name': 'Alcohol', 'icon': Icons.local_bar},
    ],
    'Physical activity': [
      {'name': "Didn't exercise", 'icon': Icons.no_cell},
      {'name': 'Yoga', 'icon': Icons.self_improvement},
      {'name': 'Gym', 'icon': Icons.fitness_center},
      {'name': 'Aerobics & dancing', 'icon': Icons.music_note},
      {'name': 'Swimming', 'icon': Icons.pool},
      {'name': 'Team sports', 'icon': Icons.sports_basketball},
      {'name': 'Running', 'icon': Icons.directions_run},
      {'name': 'Cycling', 'icon': Icons.directions_bike},
      {'name': 'Walking', 'icon': Icons.directions_walk},
    ],
  };

  void _toggleSelection(String item) {
    setState(() {
      if (selectedSymptoms.contains(item)) {
        selectedSymptoms.remove(item);
      } else {
        selectedSymptoms.add(item);
      }
    });
  }

  Color getCategoryColor(String categoryName) {
    switch (categoryName) {
      case 'Other':
        return Colors.orange.shade50;
      case 'Physical activity':
        return Colors.green.shade50;
      case 'Symptoms':
        return Colors.purple.shade50;
      case 'Mood':
        return Colors.blue.shade50;
      case 'Vaginal discharge':
        return Colors.pink.shade50;
      case 'Sex and sex drive':
        return Colors.red.shade50;
      case 'Digestion and stool':
        return Colors.purple.shade50;
      case 'Pregnancy test':
        return Colors.orange.shade50;
      case 'Ovulation test':
        return Colors.teal.shade50;
      default:
        return Colors.grey.shade50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Log Symptoms',
          onTap: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom: 100), // Increased padding for better visibility
            physics:
                const AlwaysScrollableScrollPhysics(), // Ensure scrolling is always enabled
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Cycle day 15',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ...categories.entries.map(
                  (category) => Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12.0), // Increased margin
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            category.key,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity, // Ensure full width
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 12, // Increased spacing between rows
                            children: category.value.map((item) {
                              bool isSelected =
                                  selectedSymptoms.contains(item['name']);
                              Color categoryColor =
                                  getCategoryColor(category.key);

                              return GestureDetector(
                                onTap: () => _toggleSelection(item['name']),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? categoryColor
                                        : categoryColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected
                                          ? categoryColor.withOpacity(0.8)
                                          : categoryColor.withOpacity(0.5),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        item['icon'] as IconData,
                                        size: 18,
                                        color: isSelected
                                            ? Colors.black87
                                            : Colors.black54,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        item['name'],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.black87
                                              : Colors.black54,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sticky Submit Button
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: isProcessing
            ? const CustomLoadingButton(
                height: 56,
              )
            : CustomButton(
                text: 'Save Daily Log',
                width: double.maxFinite,
                height: 56,
                fontSize: 16,
                borderRadius: 16,
                onTapHandler: () async {
                  setState(() {
                    isProcessing = true;
                  });

                  final requiredCategories = categories.entries
                      .where((entry) => entry.key != 'Other')
                      .map((entry) => entry.key)
                      .toList();

                  // Check which categories are missing selections
                  List<String> missingCategories = [];
                  for (String category in requiredCategories) {
                    bool hasSelectedItem = false;
                    for (var item in categories[category]!) {
                      if (selectedSymptoms.contains(item['name'])) {
                        hasSelectedItem = true;
                        break;
                      }
                    }
                    if (!hasSelectedItem) {
                      missingCategories.add(category);
                    }
                  }

                  if (missingCategories.isEmpty) {
                    await Future.delayed(const Duration(seconds: 5));

                    setState(() {
                      isProcessing = false;
                    });
                    customSuccessMessageSnackbar(
                      title: 'Message',
                      message: 'Symptoms logged successfully!',
                    );
                  } else {
                    setState(() {
                      isProcessing = false;
                    });
                    customErrorMessageSnackbar(
                      title: 'Message',
                      message:
                          'Please select at least one item from: ${missingCategories.join(", ")}',
                    );
                  }
                },
                fontWeight: FontWeight.w600,
                fontColor: AppColors.whiteColor,
                backgroundColor: AppColors.buttonPrimaryColor,
              ),
      ),
    );
  }
}
