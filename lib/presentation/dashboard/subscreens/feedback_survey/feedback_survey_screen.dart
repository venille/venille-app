import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';

class FeedbackSurveyScreen extends StatefulWidget {
  const FeedbackSurveyScreen({super.key});

  @override
  State<FeedbackSurveyScreen> createState() => _FeedbackSurveyScreenState();
}

class _FeedbackSurveyScreenState extends State<FeedbackSurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Feedback Survey',
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Text('Feedback Survey'),
      ),
    );
  }
}
