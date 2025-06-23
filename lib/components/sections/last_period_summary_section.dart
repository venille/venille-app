import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/cards/last_period_summary_card.dart';

class LastPeriodSummarySection extends StatelessWidget {
  const LastPeriodSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.horizontal_10,
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(
              size: 18,
              title: 'Last Menstruation Cycle',
            ),
            const SizedBox(height: AppSizes.vertical_10),
            LastPeriodSummaryCard(
              label: ServiceRegistry.userRepository.dashboardInfo.value
                  .previousCycleInfo.startDate,
              value: ServiceRegistry
                  .userRepository.dashboardInfo.value.previousCycleInfo.daysAgo,
              icon: FluentIcons.clock_16_regular,
            ),
            LastPeriodSummaryCard(
              label: ServiceRegistry.userRepository.dashboardInfo.value
                  .previousCycleInfo.duration,
              value: ServiceRegistry.userRepository.dashboardInfo.value
                  .previousCycleInfo.durationStatus,
              icon: FluentIcons.drop_16_regular,
            ),
            LastPeriodSummaryCard(
              label: ServiceRegistry.userRepository.dashboardInfo.value
                  .previousCycleInfo.cycleLength,
              value: ServiceRegistry.userRepository.dashboardInfo.value
                  .previousCycleInfo.cycleLengthStatus,
              icon: FluentIcons.arrow_sync_16_regular,
            ),
          ],
        ),
      ),
    );
  }
}
