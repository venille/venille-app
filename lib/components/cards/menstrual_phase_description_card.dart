import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart';

class MenstrualPhaseDescriptionCard extends StatelessWidget {
  final MenstrualPhaseDescriptionInfo description;
  const MenstrualPhaseDescriptionCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        bottom: AppSizes.vertical_20,
      ),
      decoration: BoxDecoration(
        color: AppColors.grayLightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            size: 16,
            title: description.title,
          ),
          const SizedBox(height: AppSizes.vertical_10),
          SubtitleText(
            lineHeight: 1.5,
            text: description.description,
          ),
        ],
      ),
    );
  }
}
