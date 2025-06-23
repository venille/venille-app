import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/column_text.dart';

class LastPeriodSummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const LastPeriodSummaryCard(
      {super.key,
      required this.label,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(
        bottom: AppSizes.vertical_10,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.vertical_15,
        horizontal: AppSizes.horizontal_10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.pinkColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.pinkColor,
          ),
          const SizedBox(width: AppSizes.horizontal_10),
          ColumnText(
            label: label,
            value: value,
          ),
        ],
      ),
    );
  }
}
