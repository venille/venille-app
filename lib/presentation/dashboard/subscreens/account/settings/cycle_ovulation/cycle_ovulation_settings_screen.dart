import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart';

class CycleOvulationSettingsScreen extends StatefulWidget {
  const CycleOvulationSettingsScreen({super.key});

  @override
  State<CycleOvulationSettingsScreen> createState() =>
      _CycleOvulationSettingsScreenState();
}

class _CycleOvulationSettingsScreenState
    extends State<CycleOvulationSettingsScreen> {
  bool _pregnancyChance = false;
  int _selectedCycleLength = 28;
  int _selectedPeriodLength = 5;
  int _selectedLutealPhaseLength = 14;

  void initializeCycleOvulationInfo() {
    ServiceRegistry.periodTrackerService.fetchCycleAndOvulationInfoService();
  }

  @override
  initState() {
    super.initState();

    initializeCycleOvulationInfo();
  }

  void _togglePregnancyChance(bool value) {
    setState(() {
      _pregnancyChance = value;
    });
  }

  Future<void> _autoUpdate() async {
    final payload = UpdateCycleAndOvulationSettingsDto((b) => b
      ..cycleLength = _selectedCycleLength
      ..periodLength = _selectedPeriodLength
      ..lutealPhaseLength = _selectedLutealPhaseLength);

    ServiceRegistry.periodTrackerService
        .updateCycleAndOvulationInfoService(payload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          onTap: () => Get.back(),
          title: AppLocale.cycleOvulation.getString(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontal_15),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.vertical_15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubtitleText(
                          text: 'Cycle Length', weight: FontWeight.w400),
                      BodyText(
                        weight: FontWeight.w500,
                        color: AppColors.greenColor,
                        text:
                            '${ServiceRegistry.userRepository.cycleOvulationInfo.value.cycleLength} days',
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.vertical_10),
                  DropdownButton<int>(
                    value: _selectedCycleLength,
                    items: List.generate(
                      21,
                      (index) => DropdownMenuItem<int>(
                        value: 21 + index,
                        child: Text('${21 + index} days'),
                      ),
                    ),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedCycleLength = newValue;
                        });
                        _autoUpdate();
                      }
                    },
                    underline: const Divider(color: AppColors.grayLightColor),
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.vertical_10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubtitleText(
                          text: 'Period Length', weight: FontWeight.w400),
                      BodyText(
                        weight: FontWeight.w500,
                        color: AppColors.greenColor,
                        text:
                            '${ServiceRegistry.userRepository.cycleOvulationInfo.value.periodLength} days',
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  DropdownButton<int>(
                    value: _selectedPeriodLength,
                    items: List.generate(9, (index) {
                      final day = 2 + index;
                      return DropdownMenuItem(
                        value: day,
                        child: Text('$day days'),
                      );
                    }),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedPeriodLength = value;
                        });
                        _autoUpdate();
                      }
                    },
                    underline: const Divider(color: AppColors.grayLightColor),
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.vertical_10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubtitleText(
                          text: 'Luteal Phase', weight: FontWeight.w400),
                      BodyText(
                        weight: FontWeight.w500,
                        color: AppColors.greenColor,
                        text:
                            '${ServiceRegistry.userRepository.cycleOvulationInfo.value.lutealPhaseLength} days',
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  DropdownButton<int>(
                    value: _selectedLutealPhaseLength,
                    items: List.generate(
                      7,
                      (index) {
                        final day = 10 + index;
                        return DropdownMenuItem(
                          value: day,
                          child: Text('$day days'),
                        );
                      },
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedLutealPhaseLength = value;
                        });
                        _autoUpdate();
                      }
                    },
                    underline: const Divider(color: AppColors.grayLightColor),
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.vertical_10),
              SubtitleText(
                size: 12,
                weight: FontWeight.w300,
                text:
                    'Luteal Phase is the time between ovulation and your next period. Knowing its length helps with more accurate ovulation prediction.',
              ),
              const Divider(color: AppColors.grayLightColor),
              SubtitleText(
                size: 12,
                weight: FontWeight.w300,
                text:
                    'The app makes predictions based on the cycle and period length settings. However, if you regularly log your period in the app, predictions will be based on the logged data.',
              ),
              const Divider(color: AppColors.grayLightColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText(
                      text: 'Chance of getting pregnant',
                      weight: FontWeight.w400),
                  Switch(
                    value: _pregnancyChance,
                    onChanged: _togglePregnancyChance,
                    activeColor: AppColors.primaryColor,
                  ),
                ],
              ),
              SubtitleText(
                text:
                    'If you turn off this parameter, only the ovulation day will be displayed.',
                weight: FontWeight.w300,
                size: 12,
              ),
              const Divider(color: AppColors.grayLightColor),
            ],
          ),
        ),
      ),
    );
  }
}
