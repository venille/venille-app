import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/components/skeletons/loading_animation.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';

class OnboardingQuestionsScreen extends StatefulWidget {
  const OnboardingQuestionsScreen({super.key});

  @override
  State<OnboardingQuestionsScreen> createState() =>
      _OnboardingQuestionsScreenState();
}

class _OnboardingQuestionsScreenState extends State<OnboardingQuestionsScreen> {
  // Map to store selected answers for each question
  final Map<String, dynamic> selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    ServiceRegistry.accountService.fetchOnboardingQuestionsService();
  }

  Widget _buildQuestionCard(OnboardingQuestionInfo question) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.vertical_20),
      padding: const EdgeInsets.all(AppSizes.horizontal_16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayLightColor.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question title
          TitleText(
            title: question.question,
            size: 16,
            weight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
          const SizedBox(height: AppSizes.vertical_12),

          // Question type info
          if (question.questionType.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.horizontal_8,
                vertical: AppSizes.vertical_4,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SubtitleText(
                text: _formatOptionText(question.questionType),
                size: 10,
                weight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          const SizedBox(height: AppSizes.vertical_16),

          // Options or input field
          if (question.isUserInput)
            _buildUserInputField(question)
          else
            _buildOptionsWidget(question),
        ],
      ),
    );
  }

  Widget _buildUserInputField(OnboardingQuestionInfo question) {
    // Check if this is a date input field
    if (question.optionType.toLowerCase().contains('date')) {
      return _buildDateInputField(question);
    }

    // Default text input field
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.horizontal_12,
        vertical: AppSizes.vertical_8,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grayLightColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your answer...',
          hintStyle: TextStyle(
            color: AppColors.grayLightColor,
            fontSize: 14,
          ),
        ),
        onChanged: (value) {
          selectedAnswers[question.id] = value;
        },
        maxLines: 3,
        minLines: 1,
      ),
    );
  }

  Widget _buildDateInputField(OnboardingQuestionInfo question) {
    final selectedDate = selectedAnswers[question.id] as DateTime?;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.horizontal_12,
        vertical: AppSizes.vertical_12,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grayLightColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => _selectDate(question.id),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: AppColors.primaryColor,
              size: 20,
            ),
            const SizedBox(width: AppSizes.horizontal_12),
            Expanded(
              child: BodyText(
                text: selectedDate != null
                    ? _formatDate(selectedDate)
                    : 'Select a date',
                color: selectedDate != null
                    ? AppColors.blackColor
                    : AppColors.grayLightColor,
                weight:
                    selectedDate != null ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: AppColors.grayColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(String questionId) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedAnswers[questionId] as DateTime? ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // Only allow dates up to today
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.whiteColor,
              surface: AppColors.whiteColor,
              onSurface: AppColors.blackColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedAnswers[questionId] = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _formatOptionText(String option) {
    // Check if option contains underscores and format it
    if (option.contains('_')) {
      // Replace underscores with spaces and convert to sentence case
      String formatted = option.replaceAll('_', ' ');
      return formatted.isNotEmpty
          ? formatted[0].toUpperCase() + formatted.substring(1).toLowerCase()
          : formatted;
    }
    // Return original text in sentence case
    return option.isNotEmpty
        ? option[0].toUpperCase() + option.substring(1).toLowerCase()
        : option;
  }

  Widget _buildOptionsWidget(OnboardingQuestionInfo question) {
    final options = question.options.toList();

    if (options.isEmpty) {
      return BodyText(
        text: 'No options available',
        color: AppColors.grayLightColor,
      );
    }

    // Always use single selection (radio button style)
    return Column(
      children: options.asMap().entries.map((entry) {
        int index = entry.key;
        String option = entry.value;

        return Container(
          margin: const EdgeInsets.only(bottom: AppSizes.vertical_8),
          child: InkWell(
            onTap: () {
              _handleOptionSelection(question.id, option);
            },
            child: Builder(builder: (context) {
              final isSelected = _isOptionSelected(question.id, option);

              return Container(
                padding: const EdgeInsets.all(AppSizes.horizontal_12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.grayLightColor.withOpacity(0.6)
                      : AppColors.grayLightColor.withOpacity(0.1),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.grayColor.withOpacity(0.2)
                        : AppColors.grayLightColor.withOpacity(0.5),
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    // Radio button indicator
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? AppColors.greenColor
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.greenColor
                              : AppColors.grayLightColor,
                          width: 1,
                        ),
                      ),
                      child: isSelected
                          ? Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: AppSizes.horizontal_12),

                    // Option text
                    Expanded(
                      child: BodyText(
                        text: _formatOptionText(option),
                        color: AppColors.blackColor,
                        weight: isSelected ? FontWeight.w500 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      }).toList(),
    );
  }

  bool _isPeriodSymptomsQuestion(OnboardingQuestionInfo question) {
    // Check various ways to identify period symptoms questions
    String questionText = question.question.toLowerCase();
    String enumType = question.enumType.toLowerCase();
    String questionType = question.questionType.toLowerCase();

    return questionText.contains('symptom') ||
        questionText.contains('experience') ||
        enumType.contains('symptom') ||
        questionType.contains('symptom') ||
        enumType == 'periodsymptom' ||
        questionText.contains('during your period');
  }

  void _handleOptionSelection(String questionId, String option) {
    setState(() {
      // Always single selection
      selectedAnswers[questionId] = option;
    });
  }

  bool _isOptionSelected(String questionId, String option) {
    return selectedAnswers[questionId] == option;
  }

  // Map question IDs or question text to DTO field names
  // You'll need to update these mappings based on your actual question data
  Map<String, String> get questionMappings => {
        // Map by question ID or question text to DTO field
        'last_period_date': 'lastPeriodStartDate',
        'period_length': 'periodLengthDays',
        'cycle_length': 'cycleLengthDays',
        'irregular_periods': 'irregularPeriods',
        'period_symptoms': 'periodSymptoms',
        'tracking_ovulation': 'trackingOvulation',
        'age': 'age',
        'birth_control': 'birthControlMethods',
        'health_conditions': 'healthConditions',
        'additional_tracking': 'additionalTracking',
        'want_reminders': 'wantReminders',
        'reminder_types': 'reminderTypes',
        'cycle_goal': 'cycleGoal',
      };

  Map<String, dynamic> _mapAnswersToDTO() {
    Map<String, dynamic> dto = {};
    final questions = ServiceRegistry.userRepository.onboardingQuestions;

    log('=== DEBUG: Starting DTO mapping ===');
    log('Total questions: ${questions.length}');
    log('Selected answers: $selectedAnswers');

    for (var question in questions) {
      log('Question ID: "${question.id}"');
      log('Question text: "${question.question}"');
      log('Question type: "${question.questionType}"');
      log('Option type: "${question.optionType}"');
      log('Enum type: "${question.enumType}"');
      log('Is user input: ${question.isUserInput}');

      final questionKey = _getQuestionKey(question);
      final dtoField = questionMappings[questionKey];
      final answer = selectedAnswers[question.id];

      log('Question key resolved to: "$questionKey"');
      log('Mapped to DTO field: "$dtoField"');
      log('Answer: $answer');

      if (dtoField != null && answer != null) {
        dto[dtoField] = _convertAnswerToCorrectType(dtoField, answer, question);
        log('Added to DTO: $dtoField = ${dto[dtoField]}');
      } else {
        log('Skipped - dtoField: $dtoField, answer: $answer');
      }

      // Special case: if this is a cycle goal question, also populate cycleGoal field
      if (question.enumType.toLowerCase().contains('cycle') &&
          question.enumType.toLowerCase().contains('goal') &&
          answer != null) {
        dto['cycleGoal'] =
            _mapToActualEnum(answer, question.enumType, 'cycleGoal');
        log('Also added cycleGoal: ${dto['cycleGoal']}');
      }

      log('---');
    }

    return dto;
  }

  String _getQuestionKey(OnboardingQuestionInfo question) {
    // Strategy 1: Direct question ID matching
    if (questionMappings.containsKey(question.id)) {
      log('Matched by question ID: ${question.id}');
      return question.id;
    }

    // Strategy 2: Position-based mapping for specific questions
    if (question.position == 3) {
      log('Matched question 3 (position ${question.position}) → cycle_length');
      return 'cycle_length';
    }

    // Strategy 3: Enum type matching
    if (question.enumType.isNotEmpty) {
      String enumKey = question.enumType.toLowerCase();

      // Special case: cycle goal questions should map to trackingOvulation
      if (enumKey.contains('cycle') && enumKey.contains('goal')) {
        log('Matched cycle goal enum type → tracking_ovulation');
        return 'tracking_ovulation';
      }

      if (questionMappings.containsKey(enumKey)) {
        log('Matched by enum type: $enumKey');
        return enumKey;
      }
    }

    // Strategy 4: Question text keyword matching
    String questionText = question.question.toLowerCase();

    // Special case: birthday/date of birth questions should map to age
    if (questionText.contains('birthday') ||
        questionText.contains('date of birth') ||
        questionText.contains('birth date') ||
        questionText.contains('born') ||
        (questionText.contains('when') && questionText.contains('birth'))) {
      log('Matched birthday/birth date question → age');
      return 'age';
    }

    for (String key in questionMappings.keys) {
      String keyWords = key.replaceAll('_', ' ');
      if (questionText.contains(keyWords)) {
        log('Matched by question text keywords: "$keyWords" in "$questionText"');
        return key;
      }
    }

    // Strategy 5: More flexible keyword matching
    Map<String, List<String>> flexibleMappings = {
      'last_period_date': [
        'last period',
        'period start',
        'menstrual',
        'last menstrual'
      ],
      'period_length': [
        'period length',
        'how long',
        'duration',
        'days long',
        'period lasts',
        'period duration'
      ],
      'cycle_length': [
        'cycle length',
        'cycle duration',
        'cycle days',
        'menstrual cycle',
        'cycle',
        'between periods'
      ],
      'irregular_periods': ['irregular', 'regular periods', 'cycle regular'],
      'period_symptoms': ['symptoms', 'experience during', 'period symptoms'],
      'tracking_ovulation': [
        'ovulation',
        'tracking ovulation',
        'track ovulation'
      ],
      'age': ['age', 'how old', 'birth date', 'date of birth'],
      'birth_control': ['birth control', 'contraception', 'contraceptive'],
      'health_conditions': [
        'health condition',
        'medical condition',
        'diagnosis'
      ],
      'additional_tracking': ['track', 'additional', 'other tracking'],
      'want_reminders': ['reminder', 'notifications', 'notify'],
      'reminder_types': ['reminder type', 'type of reminder'],
      'cycle_goal': ['goal', 'purpose', 'why tracking']
    };

    for (String key in flexibleMappings.keys) {
      List<String> keywords = flexibleMappings[key]!;
      for (String keyword in keywords) {
        if (questionText.contains(keyword.toLowerCase())) {
          log('Matched by flexible keyword: "$keyword" in "$questionText" → $key');
          return key;
        }
      }
    }

    log('No mapping found for question: ${question.question}');
    return question.id; // fallback
  }

  dynamic _convertAnswerToCorrectType(
      String dtoField, dynamic answer, OnboardingQuestionInfo question) {
    switch (dtoField) {
      // Date fields
      case 'lastPeriodStartDate':
        if (answer is DateTime) {
          // Format as YYYY-MM-DD string
          return '${answer.year}-${answer.month.toString().padLeft(2, '0')}-${answer.day.toString().padLeft(2, '0')}';
        }
        return answer;

      // Number fields
      case 'periodLengthDays':
      case 'cycleLengthDays':
      case 'age':
        if (answer is String) {
          // For age field, if it's already a number, extract it
          if (dtoField == 'age') {
            // First try to parse as direct number
            int? directAge = int.tryParse(answer);
            if (directAge != null) {
              return directAge;
            }
          }
          // Extract number from text (e.g., "28 days", "3-4 weeks", "28")
          return _extractNumberFromText(answer);
        }
        if (answer is DateTime && dtoField == 'age') {
          // Calculate age from birthday date
          return _calculateAgeFromBirthday(answer);
        }
        return answer is int ? answer : 0;

      // Boolean fields
      case 'irregularPeriods':
      case 'trackingOvulation':
      case 'wantReminders':
        if (answer is String) {
          // For trackingOvulation, check if the cycle goal involves ovulation tracking
          if (dtoField == 'trackingOvulation') {
            String lowerAnswer = answer.toLowerCase();
            return lowerAnswer.contains('conceive') ||
                lowerAnswer.contains('trying') ||
                lowerAnswer.contains('pregnancy') ||
                lowerAnswer.contains('fertile') ||
                lowerAnswer.contains('ovulation');
          }

          return answer.toLowerCase() == 'yes' ||
              answer.toLowerCase() == 'true' ||
              answer.toLowerCase() == 'irregular';
        }
        return answer is bool ? answer : false;

      // Enum fields (single selection)
      case 'birthControlMethods':
      case 'healthConditions':
      case 'additionalTracking':
      case 'reminderTypes':
      case 'cycleGoal':
      case 'periodSymptoms':
        if (answer is String) {
          return _mapToActualEnum(answer, question.enumType, dtoField);
        }
        return answer;

      default:
        return answer;
    }
  }

  String _mapToEnumValue(String answer, String enumType) {
    // Convert user-friendly text to enum values
    String normalizedAnswer = answer.toLowerCase().replaceAll(' ', '_');

    switch (enumType.toLowerCase()) {
      case 'periodsymptom':
        return _mapToPeriodSymptom(normalizedAnswer);
      case 'birthcontrolmethod':
        return _mapToBirthControlMethod(normalizedAnswer);
      case 'healthcondition':
        return _mapToHealthCondition(normalizedAnswer);
      case 'additionaltracking':
        return _mapToAdditionalTracking(normalizedAnswer);
      case 'remindertype':
        return _mapToReminderType(normalizedAnswer);
      case 'cyclegoal':
        return _mapToCycleGoal(normalizedAnswer);
      default:
        return normalizedAnswer;
    }
  }

  String _mapToPeriodSymptom(String answer) {
    Map<String, String> mapping = {
      'cramps': 'cramps',
      'bloating': 'bloating',
      'mood_swings': 'mood_swings',
      'mood': 'mood_swings',
      'headache': 'headache',
      'headaches': 'headache',
      'acne': 'acne',
      'fatigue': 'fatigue',
      'tired': 'fatigue',
      'tender_breasts': 'tender_breasts',
      'breast_tenderness': 'tender_breasts',
      'sore_breasts': 'tender_breasts',
      'nausea': 'nausea',
      'nauseous': 'nausea',
      'other': 'other',
    };
    return mapping[answer] ?? 'other';
  }

  String _mapToBirthControlMethod(String answer) {
    Map<String, String> mapping = {
      'none': 'none',
      'no_birth_control': 'none',
      'pill': 'pill',
      'birth_control_pill': 'pill',
      'birth_control_pills': 'pill',
      'iud': 'iud',
      'implant': 'implant',
      'injection': 'injection',
      'shot': 'injection',
      'patch': 'patch',
      'condom': 'condom',
      'condoms': 'condom',
      'natural': 'natural',
      'natural_methods': 'natural',
      'withdrawal': 'natural',
      'other': 'other',
    };
    return mapping[answer] ?? 'other';
  }

  String _mapToHealthCondition(String answer) {
    Map<String, String> mapping = {
      'pcos': 'pcos',
      'polycystic_ovary_syndrome': 'pcos',
      'endometriosis': 'endometriosis',
      'thyroid': 'thyroid',
      'thyroid_disorder': 'thyroid',
      'diabetes': 'diabetes',
      'fibroids': 'fibroids',
      'uterine_fibroids': 'fibroids',
      'blood_disorder': 'blood_disorder',
      'blood_clotting': 'blood_disorder',
      'none': 'other',
      'no_conditions': 'other',
      'other': 'other',
    };
    return mapping[answer] ?? 'other';
  }

  String _mapToAdditionalTracking(String answer) {
    Map<String, String> mapping = {
      'mood': 'mood',
      'mood_tracking': 'mood',
      'discharge': 'discharge',
      'cervical_mucus': 'discharge',
      'temperature': 'temperature',
      'basal_body_temperature': 'temperature',
      'cervical_position': 'cervical_position',
      'cervix_position': 'cervical_position',
      'sleep': 'sleep',
      'sleep_tracking': 'sleep',
      'sex': 'sex',
      'sexual_activity': 'sex',
      'exercise': 'exercise',
      'workout': 'exercise',
      'nutrition': 'nutrition',
      'diet': 'nutrition',
      'other': 'other',
    };
    return mapping[answer] ?? 'other';
  }

  String _mapToReminderType(String answer) {
    Map<String, String> mapping = {
      'period_start': 'period_start',
      'period': 'period_start',
      'fertile_window': 'fertile_window',
      'fertility': 'fertile_window',
      'ovulation': 'ovulation',
      'medication': 'medication',
      'meds': 'medication',
      'custom': 'custom',
      'other': 'custom',
    };
    return mapping[answer] ?? 'custom';
  }

  String _mapToCycleGoal(String answer) {
    Map<String, String> mapping = {
      'just_tracking': 'just_tracking',
      'tracking': 'just_tracking',
      'general_tracking': 'just_tracking',
      'trying_to_conceive': 'trying_to_conceive',
      'conceive': 'trying_to_conceive',
      'pregnancy': 'trying_to_conceive',
      'avoiding_pregnancy': 'avoiding_pregnancy',
      'avoid_pregnancy': 'avoiding_pregnancy',
      'birth_control': 'avoiding_pregnancy',
      'monitoring_health': 'monitoring_health',
      'health': 'monitoring_health',
      'health_monitoring': 'monitoring_health',
    };
    return mapping[answer] ?? 'just_tracking';
  }

  dynamic _mapToActualEnum(String answer, String enumType, String dtoField) {
    String normalizedAnswer = answer.toLowerCase().replaceAll(' ', '_');

    switch (dtoField) {
      case 'periodSymptoms':
        String symptomKey = _mapToPeriodSymptom(normalizedAnswer);
        switch (symptomKey) {
          case 'cramps':
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.cramps;
          case 'bloating':
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.bloating;
          case 'mood_swings':
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.moodSwings;
          case 'headache':
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.headache;
          case 'acne':
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.acne;
          case 'fatigue':
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.fatigue;
          case 'tender_breasts':
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.tenderBreasts;
          case 'nausea':
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.nausea;
          default:
            return RegisterPeriodTrackerDTOPeriodSymptomsEnum.other;
        }

      case 'birthControlMethods':
        String birthControlKey = _mapToBirthControlMethod(normalizedAnswer);
        switch (birthControlKey) {
          case 'none':
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.none;
          case 'pill':
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.pill;
          case 'iud':
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.iud;
          case 'implant':
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.implant;
          case 'injection':
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.injection;
          case 'patch':
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.patch_;
          case 'condom':
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.condom;
          case 'natural':
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.natural;
          default:
            return RegisterPeriodTrackerDTOBirthControlMethodsEnum.other;
        }

      case 'healthConditions':
        String healthKey = _mapToHealthCondition(normalizedAnswer);
        switch (healthKey) {
          case 'pcos':
            return RegisterPeriodTrackerDTOHealthConditionsEnum.pcos;
          case 'endometriosis':
            return RegisterPeriodTrackerDTOHealthConditionsEnum.endometriosis;
          case 'thyroid':
            return RegisterPeriodTrackerDTOHealthConditionsEnum.thyroid;
          case 'diabetes':
            return RegisterPeriodTrackerDTOHealthConditionsEnum.diabetes;
          case 'fibroids':
            return RegisterPeriodTrackerDTOHealthConditionsEnum.fibroids;
          case 'blood_disorder':
            return RegisterPeriodTrackerDTOHealthConditionsEnum.bloodDisorder;
          default:
            return RegisterPeriodTrackerDTOHealthConditionsEnum.other;
        }

      case 'cycleGoal':
        String goalKey = _mapToCycleGoal(normalizedAnswer);
        switch (goalKey) {
          case 'just_tracking':
            return RegisterPeriodTrackerDTOCycleGoalEnum.justTracking;
          case 'trying_to_conceive':
            return RegisterPeriodTrackerDTOCycleGoalEnum.tryingToConceive;
          case 'avoiding_pregnancy':
            return RegisterPeriodTrackerDTOCycleGoalEnum.avoidingPregnancy;
          case 'monitoring_health':
            return RegisterPeriodTrackerDTOCycleGoalEnum.monitoringHealth;
          default:
            return RegisterPeriodTrackerDTOCycleGoalEnum.justTracking;
        }

      default:
        // For fields not handled above, return string fallback
        return _mapToEnumValue(answer, enumType);
    }
  }

  int _extractNumberFromText(String text) {
    // Remove extra spaces and convert to lowercase
    String cleaned = text.toLowerCase().trim();

    // Handle common patterns for cycle length
    if (cleaned.contains('week')) {
      // Convert weeks to days (e.g., "4 weeks" -> 28 days)
      RegExp weekPattern = RegExp(r'(\d+(?:\.\d+)?)\s*week');
      Match? match = weekPattern.firstMatch(cleaned);
      if (match != null) {
        double weeks = double.tryParse(match.group(1)!) ?? 0;
        return (weeks * 7).round();
      }
    }

    // Handle range patterns (e.g., "28-30 days", "3-4 weeks")
    RegExp rangePattern = RegExp(r'(\d+)\s*[-–—]\s*(\d+)');
    Match? rangeMatch = rangePattern.firstMatch(cleaned);
    if (rangeMatch != null) {
      int start = int.tryParse(rangeMatch.group(1)!) ?? 0;
      int end = int.tryParse(rangeMatch.group(2)!) ?? 0;
      return ((start + end) / 2).round(); // Return average
    }

    // Extract first number found in text
    RegExp numberPattern = RegExp(r'(\d+)');
    Match? numberMatch = numberPattern.firstMatch(cleaned);
    if (numberMatch != null) {
      return int.tryParse(numberMatch.group(1)!) ?? 0;
    }

    // Handle text-based numbers
    Map<String, int> textNumbers = {
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'twenty-eight': 28,
      'thirty': 30,
      'twenty-one': 21,
    };

    for (String textNum in textNumbers.keys) {
      if (cleaned.contains(textNum)) {
        return textNumbers[textNum]!;
      }
    }

    // Default fallback
    return 28; // Default cycle length
  }

  int _calculateAgeFromBirthday(DateTime birthday) {
    DateTime now = DateTime.now();
    int age = now.year - birthday.year;
    if (now.month < birthday.month ||
        (now.month == birthday.month && now.day < birthday.day)) {
      age--;
    }
    return age;
  }

  bool _validateRequiredFields(Map<String, dynamic> dto) {
    List<String> requiredFields = [
      'lastPeriodStartDate',
      'periodLengthDays',
      'cycleLengthDays',
      'irregularPeriods',
      'periodSymptoms',
      'trackingOvulation',
      'age',
      'birthControlMethods',
      'healthConditions',
      'cycleGoal',
    ];

    for (String field in requiredFields) {
      if (!dto.containsKey(field) || dto[field] == null) {
        log('Missing required field: $field');
        return false;
      }
    }
    return true;
  }

  void _submitOnboardingAnswers() {
    final dto = _mapAnswersToDTO();

    log('Mapped DTO: $dto');

    if (_validateRequiredFields(dto)) {
      log('All required fields present. Ready to submit to API.');

      RegisterPeriodTrackerDTO payload = RegisterPeriodTrackerDTO(
        (instance) => instance
          ..lastPeriodStartDate = dto['lastPeriodStartDate']
          ..periodLengthDays = dto['periodLengthDays']
          ..cycleLengthDays = dto['cycleLengthDays']
          ..irregularPeriods = dto['irregularPeriods']
          ..periodSymptoms = dto['periodSymptoms']
          ..trackingOvulation = dto['trackingOvulation']
          ..age = dto['age']
          ..birthControlMethods = dto['birthControlMethods']
          ..healthConditions = dto['healthConditions']
          ..cycleGoal = dto['cycleGoal'],
      );

      log('RegisterPeriodTrackerDTO: $payload');

      ServiceRegistry.accountService.submitOnboardingQuestionsService(payload);
    } else {
      log('Validation failed. Missing required fields.');
      // Show error message to user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Onboarding Questions',
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        final questions = ServiceRegistry.userRepository.onboardingQuestions;

        if (questions.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingAnimation(
                  size: 40,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: AppSizes.vertical_16),
                BodyText(
                  text: 'Loading questions...',
                  color: AppColors.grayColor,
                ),
              ],
            ),
          );
        }

        // Sort questions by position
        final sortedQuestions = questions.toList()
          ..sort((a, b) => a.position.compareTo(b.position));

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_16,
            // vertical: AppSizes.vertical_16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Container(
                padding: const EdgeInsets.all(AppSizes.horizontal_16),
                margin: const EdgeInsets.only(bottom: AppSizes.vertical_20),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleText(
                      title: 'Complete Your Profile',
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(height: AppSizes.vertical_8),
                    BodyText(
                      text:
                          'Please answer the following questions to help us personalize your experience.',
                      color: AppColors.grayColor,
                    ),
                  ],
                ),
              ),

              // Questions list
              ...sortedQuestions
                  .map((question) => _buildQuestionCard(question))
                  .toList(),

              const SizedBox(height: AppSizes.vertical_40),
            ],
          ),
        );
      }),
      bottomNavigationBar: Obx(
        () => Container(
          height: 60,
          padding: const EdgeInsets.only(
            bottom: AppSizes.vertical_10,
            left: AppSizes.horizontal_15,
            right: AppSizes.horizontal_15,
          ),
          child: ServiceRegistry
                  .accountService.isSubmitOnboardingQuestionsProcessing.value
              ? const CustomLoadingButton(
                  height: 40,
                  backgroundColor: AppColors.blackColor,
                )
              : CustomButton(
                  text: 'Continue',
                  width: double.maxFinite,
                  height: 40,
                  fontSize: 16,
                  borderRadius: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.whiteColor,
                  onTapHandler: _submitOnboardingAnswers,
                  backgroundColor: AppColors.blackColor,
                ),
        ),
      ),
    );
  }
}
