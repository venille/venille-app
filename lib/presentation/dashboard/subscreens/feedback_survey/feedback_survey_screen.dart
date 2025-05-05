import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';

class FeedbackSurveyScreen extends StatefulWidget {
  const FeedbackSurveyScreen({super.key});

  @override
  State<FeedbackSurveyScreen> createState() => _FeedbackSurveyScreenState();
}

class _FeedbackSurveyScreenState extends State<FeedbackSurveyScreen> {
  // Form values
  String? daysManaged;
  String? hadAccessToPad;
  bool isProcessing = false;
  List<String> selectedChallenges = [];

  // Options
  final List<String> yesNoOptions = ['Yes', 'No'];
  final List<String> daysOptions = [
    '1-3 days',
    '4-5 days',
    'More than 5 days',
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

  void _submitSurvey() async {
    setState(() {
      isProcessing = true;
    });

    if (hadAccessToPad == null || daysManaged == null) {
      customErrorMessageSnackbar(
        title: 'Message',
        message: 'Please fill in all fields',
      );

      setState(() {
        isProcessing = false;
      });

      return;
    }

    await Future.delayed(const Duration(milliseconds: 3500));

    customSuccessMessageSnackbar(
      title: 'Message',
      message: 'Survey submitted anonymously. Thank you!',
    );

    // Reset form values
    setState(() {
      hadAccessToPad = null;
      daysManaged = null;
      selectedChallenges = [];
      isProcessing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Monthly Survey',
          onTap: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your feedback helps us improve menstrual health in your community',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),

            // Pad Access Question
            Text(
              'Did you have access to a pad this month?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: yesNoOptions.map((option) {
                return ChoiceChip(
                  label: Text(option),
                  selected: hadAccessToPad == option,
                  onSelected: (selected) {
                    setState(() {
                      hadAccessToPad = selected ? option : null;
                    });
                  },
                  selectedColor: Color(0xFFFF7DAD),
                  labelStyle: TextStyle(
                    color:
                        hadAccessToPad == option ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 24),

            // Days Managed Question
            Text(
              'How many days did you manage menstruation safely?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: daysOptions.map((option) {
                return ChoiceChip(
                  label: Text(option),
                  selected: daysManaged == option,
                  onSelected: (selected) {
                    setState(() {
                      daysManaged = selected ? option : null;
                    });
                  },
                  selectedColor: Color(0xFFFF7DAD),
                  labelStyle: TextStyle(
                    color: daysManaged == option ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 24),

            // Challenges Question
            Text(
              'Challenges faced?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Select all that apply',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: challenges.map((challenge) {
                return FilterChip(
                  label: Text(challenge),
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
                  selectedColor: Color(0xFFFF7DAD),
                  labelStyle: TextStyle(
                    color: selectedChallenges.contains(challenge)
                        ? Colors.white
                        : Colors.black,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 32),

            // Submit Button
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Column(
          children: [
            isProcessing
                ? const CustomLoadingButton(height: 56)
                : CustomButton(
                    text: 'Submit Anonymously',
                    width: double.maxFinite,
                    height: 56,
                    fontSize: 16,
                    borderRadius: 16,
                    onTapHandler: _submitSurvey,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.whiteColor,
                    backgroundColor: AppColors.buttonPrimaryColor,
                  ),
            Center(
              child: Text(
                'Your responses are completely anonymous',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
