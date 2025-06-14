import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/tiny_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/column_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';

class SurveyHistoryItemCard extends StatelessWidget {
  final MonthlySurveyInfo surveyInfo;
  const SurveyHistoryItemCard({super.key, required this.surveyInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppSizes.vertical_10,
      ),
      margin: const EdgeInsets.only(
        bottom: AppSizes.vertical_10,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.grayLightColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.grayLightColor,
                    child: Icon(FluentIcons.heart_pulse_20_regular),
                  ),
                  SizedBox(width: AppSizes.horizontal_5),
                  TitleText(
                    title: 'Health Survey',
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.vertical_5,
                  horizontal: AppSizes.horizontal_5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: surveyInfo.hasAccessToPad
                      ? AppColors.greenColor.withOpacity(0.5)
                      : AppColors.redColor.withOpacity(0.5),
                ),
                child: TinyText(
                  text: surveyInfo.hasAccessToPad ? 'Healthy' : 'Unhealthy',
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.vertical_10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColumnText(
                valueSize: 14,
                label: 'Days Managing Period',
                value: surveyInfo.daysManagingPeriod,
              ),
              ColumnText(
                valueSize: 14,
                label: 'Has Access To Pad',
                value: surveyInfo.hasAccessToPad ? 'Yes' : 'No',
              ),
            ],
          ),
          const SizedBox(height: AppSizes.vertical_10),
          Row(
            children: [
              Expanded(
                child: ColumnText(
                  valueSize: 14,
                  label: 'Challenges Faced',
                  value: surveyInfo.challengesFaced.isEmpty
                      ? 'None'
                      : surveyInfo.challengesFaced.join(', '),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
