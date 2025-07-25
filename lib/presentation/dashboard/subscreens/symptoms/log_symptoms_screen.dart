import 'dart:developer';
import 'dart:io';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/form_label_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart';
import 'package:built_collection/built_collection.dart';

class LogSymptomsScreen extends StatefulWidget {
  const LogSymptomsScreen({super.key});

  @override
  State<LogSymptomsScreen> createState() => _LogSymptomsScreenState();
}

class _LogSymptomsScreenState extends State<LogSymptomsScreen> {
  Set<String> selectedSymptoms = {};
  bool isProcessing = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Map<String, List<Map<String, dynamic>>> categories = {
    'Symptoms'.tr: [
      {
        'name': 'Everything is fine'.tr,
        'icon': FluentIcons.checkmark_circle_12_regular
      },
      {'name': 'Cramps'.tr, 'icon': Icons.waves},
      {'name': 'Tender breasts'.tr, 'icon': FluentIcons.heart_12_regular},
      {'name': 'Headache'.tr, 'icon': Icons.sick},
      {'name': 'Acne'.tr, 'icon': Icons.face},
      {'name': 'Backache'.tr, 'icon': Icons.accessibility_new},
      {'name': 'Fatigue'.tr, 'icon': Icons.battery_alert},
      {'name': 'Insomnia'.tr, 'icon': Icons.nightlight_round},
      {'name': 'Abdominal pain'.tr, 'icon': Icons.healing},
      {'name': 'Vaginal itching'.tr, 'icon': Icons.warning},
    ],
    'Mood'.tr: [
      {'name': 'Calm'.tr, 'icon': Icons.sentiment_satisfied},
      {'name': 'Happy'.tr, 'icon': Icons.sentiment_very_satisfied},
      {'name': 'Energetic'.tr, 'icon': Icons.bolt},
      {'name': 'Frisky'.tr, 'icon': Icons.mood},
      {'name': 'Mood swings'.tr, 'icon': Icons.swap_horiz},
      {'name': 'Irritated'.tr, 'icon': Icons.mood_bad},
      {'name': 'Sad'.tr, 'icon': Icons.sentiment_dissatisfied},
      {'name': 'Anxious'.tr, 'icon': Icons.psychology},
      {'name': 'Depressed'.tr, 'icon': Icons.cloud},
      {'name': 'Feeling guilty'.tr, 'icon'.tr: Icons.face_retouching_natural},
    ],
    'Vaginal discharge'.tr: [
      {'name': 'No discharge'.tr, 'icon': Icons.block},
      {'name': 'Creamy'.tr, 'icon': Icons.opacity},
      {'name': 'Watery'.tr, 'icon': Icons.water_drop},
      {'name': 'Sticky'.tr, 'icon': Icons.grain},
      {'name': 'Egg white'.tr, 'icon': Icons.egg},
      {'name': 'Spotting'.tr, 'icon': Icons.circle},
    ],
    'Sex and sex drive'.tr: [
      {'name': "Didn't have sex".tr, 'icon': Icons.do_not_disturb},
      {'name': 'Protected sex'.tr, 'icon': Icons.security},
      {'name': 'Unprotected sex'.tr, 'icon': Icons.warning_amber},
      {'name': 'Oral sex'.tr, 'icon': Icons.favorite},
      {'name': 'Masturbation'.tr, 'icon': Icons.spa},
      {'name': 'High sex drive'.tr, 'icon': Icons.trending_up},
      {'name': 'Low sex drive'.tr, 'icon': Icons.trending_down},
    ],
    'Digestion and stool'.tr: [
      {'name': 'Nausea'.tr, 'icon': Icons.sick_outlined},
      {'name': 'Bloating'.tr, 'icon': Icons.circle_outlined},
      {'name': 'Constipation'.tr, 'icon': Icons.do_not_disturb_on_outlined},
      {'name': 'Diarrhea'.tr, 'icon': Icons.running_with_errors_outlined},
    ],
    'Pregnancy test'.tr: [
      {'name': "Didn't take tests".tr, 'icon': Icons.not_interested_outlined},
      {'name': 'Positive'.tr, 'icon': Icons.add_circle_outline},
      {'name': 'Negative'.tr, 'icon': Icons.remove_circle_outline},
      {'name': 'Faint line'.tr, 'icon': Icons.remove_circle_outline},
    ],
    'Ovulation test'.tr: [
      {'name': "Didn't take tests".tr, 'icon': Icons.not_interested_outlined},
      {'name': 'Test: positive'.tr, 'icon': Icons.add_circle_outline},
      {'name': 'Test: negative'.tr, 'icon': Icons.remove_circle_outline},
      {
        'name': 'Ovulation: my method'.tr,
        'icon': Icons.calendar_today_outlined
      },
    ],
    'Other': [
      {'name': 'Travel'.tr, 'icon': Icons.place},
      {'name': 'Stress'.tr, 'icon': Icons.flash_on},
      {'name': 'Meditation'.tr, 'icon': Icons.spa},
      {'name': 'Journaling'.tr, 'icon': Icons.book},
      {'name': 'Kegel exercises'.tr, 'icon': Icons.favorite_border},
      {'name': 'Breathing exercises'.tr, 'icon': Icons.air},
      {'name': 'Disease or injury'.tr, 'icon': Icons.medical_services},
      {'name': 'Alcohol'.tr, 'icon': Icons.local_bar},
    ],
    'Physical activity': [
      {'name': "Didn't exercise".tr, 'icon': Icons.no_cell},
      {'name': 'Yoga'.tr, 'icon': Icons.self_improvement},
      {'name': 'Gym'.tr, 'icon': Icons.fitness_center},
      {'name': 'Aerobics & dancing'.tr, 'icon': Icons.music_note},
      {'name': 'Swimming'.tr, 'icon': Icons.pool},
      {'name': 'Team sports'.tr, 'icon': Icons.sports_basketball},
      {'name': 'Running'.tr, 'icon': Icons.directions_run},
      {'name': 'Cycling'.tr, 'icon': Icons.directions_bike},
      {'name': 'Walking'.tr, 'icon': Icons.directions_walk},
    ],
    'Other': [
      {'name': 'Travel'.tr, 'icon': Icons.place},
      {'name': 'Stress'.tr, 'icon': Icons.flash_on},
      {'name': 'Meditation'.tr, 'icon': Icons.spa},
      {'name': 'Journaling'.tr, 'icon': Icons.book},
      {'name': 'Kegel exercises'.tr, 'icon': Icons.favorite_border},
      {'name': 'Breathing exercises'.tr, 'icon': Icons.air},
      {'name': 'Disease or injury'.tr, 'icon': Icons.medical_services},
      {'name': 'Alcohol', 'icon'.tr: Icons.local_bar},
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
        return Colors.orange.shade100;
      case 'Physical activity':
        return Colors.green.shade100;
      case 'Symptoms':
        return Colors.purple.shade100;
      case 'Mood':
        return Colors.blue.shade100;
      case 'Vaginal discharge':
        return Colors.pink.shade100;
      case 'Sex and sex drive':
        return Colors.red.shade100;
      case 'Digestion and stool':
        return Colors.indigo.shade100;
      case 'Pregnancy test':
        return Colors.orange.shade100;
      case 'Ovulation test':
        return Colors.teal.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  String generateCategoryEnum(String categoryName) {
    switch (categoryName) {
      case 'Symptoms':
        return 'symptoms';
      case 'Mood':
        return 'mood';
      case 'Vaginal discharge':
        return 'vaginal_discharge';
      case 'Sex and sex drive':
        return 'sex_drive';
      case 'Digestion and stool':
        return 'digestion_stool';
      case 'Pregnancy test':
        return 'pregnancy_test';
      case 'Ovulation test':
        return 'ovulation_test';
      case 'Physical activity':
        return 'physical_activity';
      case 'Other':
        return 'other';
      default:
        return 'other';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: AppLocale.logPeriod.getString(context),
          onTap: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.horizontal_10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.horizontal_15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: AppSizes.horizontal_45),
                          TitleText(
                            title:
                                'Date: ${formatDate(ServiceRegistry.userRepository.dashboardTrackerCurrentDay.value.date)}',
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: AppColors.grayLightColor,
                              ),
                              color: ServiceRegistry
                                      .userRepository
                                      .dashboardTrackerCurrentDay
                                      .value
                                      .isPredictedPeriodDay
                                  ? AppColors.redColor
                                  : (ServiceRegistry
                                              .userRepository
                                              .dashboardTrackerCurrentDay
                                              .value
                                              .isPredictedOvulationDay ||
                                          ServiceRegistry
                                              .userRepository
                                              .dashboardTrackerCurrentDay
                                              .value
                                              .isFertileDay)
                                      ? AppColors.blueLightColor
                                      : AppColors.grayColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                BodyText(
                                  size: 14,
                                  text: AppLocale.cycleDay.getString(context),
                                  color: AppColors.whiteColor,
                                ),
                                BodyText(
                                  size: 14,
                                  color: AppColors.whiteColor,
                                  text:
                                      '${ServiceRegistry.userRepository.dashboardTrackerCurrentDay.value.cycleDayCount}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ...categories.entries.map(
                    (category) => Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: AppSizes.vertical_10,
                      ),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: AppColors.grayLightColor,
                        // ),
                        borderRadius: BorderRadius.circular(15),
                        color: getCategoryColor(category.key).withOpacity(0.3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormLabelText(
                            size: 16,
                            text: category.key,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: AppSizes.vertical_10),
                          SizedBox(
                            width: double.infinity, // Ensure full width
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
                                        BodyText(
                                          text: item['name'],
                                          color: isSelected
                                              ? Colors.black87
                                              : Colors.black54,
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
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
        child: Obx(
          () => ServiceRegistry
                  .periodTrackerService.isLogPeriodSymptomsProcessing.value
              ? const CustomLoadingButton(
                  height: 56,
                  backgroundColor: AppColors.blackColor,
                )
              : CustomButton(
                  text: AppLocale.submit.getString(context),
                  width: double.maxFinite,
                  height: 56,
                  fontSize: 16,
                  borderRadius: 16,
                  onTapHandler: () async {
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

                    if (missingCategories.isNotEmpty) {
                      customErrorMessageSnackbar(
                          title: AppLocale.message.getString(context),
                          message:
                              '${'select_at_least_one'.tr} ${missingCategories.join(", ")}'
                          // 'Please select at least one item from: ${missingCategories.join(", ")}',
                          );
                    } else {
                      // Group symptoms by category
                      final Map<String, List<String>> categorySymptomsMap = {};

                      for (final symptomName in selectedSymptoms) {
                        String category = 'Other';
                        for (final categoryEntry in categories.entries) {
                          if (categoryEntry.value.any(
                              (symptom) => symptom['name'] == symptomName)) {
                            category = categoryEntry.key;
                            break;
                          }
                        }

                        if (!categorySymptomsMap.containsKey(category)) {
                          categorySymptomsMap[category] = [];
                        }
                        categorySymptomsMap[category]!.add(symptomName);
                      }

                      log('[CATEGORY SYMPTOMS MAP] :: $categorySymptomsMap');

                      // Create one PeriodSymptomDto per category with all symptoms for that category
                      final symptomsList =
                          categorySymptomsMap.entries.map((entry) {
                        final category = entry.key;
                        final symptoms = entry.value;

                        // Remove duplicates from symptoms list
                        final uniqueSymptoms = symptoms.toSet().toList();
                        final categoryArray =
                            '["${uniqueSymptoms.join('", "')}"]';

                        return PeriodSymptomDto(
                          (b) => b
                            ..symptomType = generateCategoryEnum(category)
                            ..symptoms = categoryArray,
                        );
                      }).toList();

                      LogPeriodSymptomDto payload = LogPeriodSymptomDto(
                        (instance) => instance
                          ..date = ServiceRegistry.userRepository
                              .dashboardTrackerCurrentDay.value.date
                              .toIso8601String()
                              .split('T')[0]
                          ..symptoms =
                              ListBuilder<PeriodSymptomDto>(symptomsList),
                      );

                      log('[PAYLOAD] :: $payload');

                      ServiceRegistry.periodTrackerService
                          .logPeriodTrackerSymptomsService(payload);
                    }
                  },
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.whiteColor,
                  backgroundColor: AppColors.blackColor,
                ),
        ),
      ),
    );
  }
}
