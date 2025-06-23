import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/cards/menstrual_phase_card.dart';

class MenstrualPhasesSection extends StatelessWidget {
  const MenstrualPhasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(
        left: AppSizes.horizontal_10,
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(
              size: 18,
              title: 'Menstrual Cycle Phases',
            ),
            const SizedBox(height: AppSizes.vertical_10),
            SizedBox(
              height: 180,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: ServiceRegistry
                    .userRepository.dashboardInfo.value.menstrualPhases.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MenstrualPhaseCard(
                    index: index + 1,
                    menstrualPhase: ServiceRegistry.userRepository.dashboardInfo
                        .value.menstrualPhases[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
