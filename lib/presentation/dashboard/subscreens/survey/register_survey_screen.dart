import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/form_label_text.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';

class RegisterSurveyScreen extends StatefulWidget {
  const RegisterSurveyScreen({super.key});

  @override
  State<RegisterSurveyScreen> createState() => _RegisterSurveyScreenState();
}

class _RegisterSurveyScreenState extends State<RegisterSurveyScreen> {
  // Form values
  String? daysManaged;
  bool hadAccessToPad = true;
  List<String> selectedChallenges = [];

  // Options
  final List<Map<String, dynamic>> hasAccessToPadOptions = [
    {'title': 'Yes', 'value': true},
    {'title': 'No', 'value': false}
  ];
  final List<String> daysOptions = [
    'OneToThreeDays',
    'FourToFiveDays',
    'MoreThanFiveDays',
    'None'
  ];
  final List<String> challenges = [
    'Limited access to pads',
    'Pain management',
    'Lack of private facilities',
    'Cost of menstrual products',
    'Disposal issues',
    'Other health concerns'
  ];

  void submitHandler() async {
    if (daysManaged == null) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message:
            'Please select the number of days you managed menstruation safely',
      );
    } else if (selectedChallenges.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Please select the challenges you faced',
      );
    } else {
      RegisterMonthlySurveyDTO payload = RegisterMonthlySurveyDTO(
        (instance) => instance
          ..hasAccessToPad = hadAccessToPad
          ..challengesFaced =
              selectedChallenges.map((e) => '"$e"').toList().toString()
          ..daysManagingMenstruation =
              RegisterMonthlySurveyDTODaysManagingMenstruationEnum.values
                  .firstWhere(
            (e) => e.toString().split('.').last == daysManaged,
            orElse: () =>
                RegisterMonthlySurveyDTODaysManagingMenstruationEnum.none,
          ),
      );

      log('[PAYLOAD] :: $payload');

      ServiceRegistry.accountService.registerMonthlySurveyService(
        payload: payload,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Register Survey',
          onTap: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormLabelText(
              size: 16,
              text:
                  'Your feedback helps us improve menstrual health in your community',
            ),
            const SizedBox(height: AppSizes.vertical_12),
            // Pad Access Question
            FormLabelText(
              size: 16,
              text: 'Did you have access to a pad this month?',
            ),
            Wrap(
              spacing: 12,
              children: hasAccessToPadOptions.map((option) {
                return ChoiceChip(
                  label: BodyText(text: option['title']),
                  selected: hadAccessToPad == option['value'],
                  onSelected: (selected) {
                    setState(() {
                      hadAccessToPad = selected ? option['value'] : false;
                    });
                  },
                  backgroundColor: AppColors.whiteColor,
                  selectedColor: AppColors.grayLightColor,
                  side: const BorderSide(
                    width: 1,
                    color: AppColors.grayLightColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSizes.vertical_12),
            // Days Managed Question
            FormLabelText(
              size: 16,
              text: 'How many days did you manage menstruation safely?',
            ),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: daysOptions.map((option) {
                String displayText = option;
                switch (option) {
                  case 'OneToThreeDays':
                    displayText = '1-3 days';
                    break;
                  case 'FourToFiveDays':
                    displayText = '4-5 days';
                    break;
                  case 'MoreThanFiveDays':
                    displayText = 'More than 5 days';
                    break;
                  case 'None':
                    displayText = 'None';
                    break;
                }
                return ChoiceChip(
                  label: BodyText(text: displayText),
                  selected: daysManaged == option,
                  onSelected: (selected) {
                    setState(() {
                      daysManaged = selected ? option : null;
                    });
                  },
                  backgroundColor: AppColors.whiteColor,
                  selectedColor: AppColors.grayLightColor,
                  side: const BorderSide(
                    width: 1,
                    color: AppColors.grayLightColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSizes.vertical_12),
            // Challenges Question
            FormLabelText(
              size: 16,
              text: 'Challenges faced?',
            ),
            Text(
              'Select all that apply',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: challenges.map((challenge) {
                return FilterChip(
                  // showCheckmark: false,
                  checkmarkColor: AppColors.blackColor,
                  backgroundColor: AppColors.whiteColor,
                  label: BodyText(
                    text: challenge,
                  ),
                  selected: selectedChallenges.contains(challenge),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedChallenges.add(challenge);
                      } else {
                        selectedChallenges.remove(challenge);
                      }
                    });
                  },
                  selectedColor: AppColors.grayLightColor,
                  side: const BorderSide(
                    width: 1,
                    color: AppColors.grayLightColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSizes.vertical_50),
          ],
        ),
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
                  .accountService.isRegisterMonthlySurveyProcessing.value
              ? const CustomLoadingButton(
                  height: 56,
                  backgroundColor: AppColors.blackColor,
                )
              : CustomButton(
                  text: 'Submit',
                  width: double.maxFinite,
                  height: 56,
                  fontSize: 16,
                  borderRadius: 16,
                  onTapHandler: submitHandler,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.whiteColor,
                  backgroundColor: AppColors.buttonPrimaryColor,
                ),
        ),
      ),
    );
  }
}
