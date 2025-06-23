import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/cards/log_survey_card.dart';
import 'package:venille/components/cards/log_symptom_card.dart';

class DailyInsightsSection extends StatefulWidget {
  const DailyInsightsSection({super.key});

  @override
  State<DailyInsightsSection> createState() => _DailyInsightsSectionState();
}

class _DailyInsightsSectionState extends State<DailyInsightsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(
        left: AppSizes.horizontal_10,
        // right: AppSizes.horizontal_10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(
            size: 18,
            title: 'Today\'s Insights',
          ),
          const SizedBox(height: AppSizes.vertical_10),
          SizedBox(
            height: 160,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const LogSymptomCard();
                }
                return const LogSurveyCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
