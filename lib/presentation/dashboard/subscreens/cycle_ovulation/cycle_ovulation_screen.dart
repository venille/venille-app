import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venille/components/appbar/profile_appbar.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/utilities/appLocale.dart';

class CycleOvulationScreen extends StatefulWidget {
  const CycleOvulationScreen({super.key});

  @override
  State<CycleOvulationScreen> createState() => _CycleOvulationScreenState();
}

class _CycleOvulationScreenState extends State<CycleOvulationScreen> {
  bool _pregnancyChance = false;

  void _togglePregnancyChance(bool value) {
    setState(() {
      _pregnancyChance = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: ReturnToAppbar(
              title: AppLocale.cycleOvulation.getString(context),
              onTap: () => Get.back(),
            )),
        body: SingleChildScrollView(
            child: Container(
          // width: double.maxFinite,
          // height: double.maxFinite,
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.horizontal_15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.vertical_10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText(
                    text: 'Cycle Length',
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SubtitleText(
                                text: '30 days',
                                weight: FontWeight.w400,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                          const Divider(color: AppColors.grayLightColor),
                        ],
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText(
                    text: 'Period Length',
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SubtitleText(
                                text: '5 days',
                                weight: FontWeight.w400,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                          const Divider(color: AppColors.grayLightColor),
                        ],
                      ))
                ],
              ),
              SubtitleText(
                  text:
                      'The app makes predictions based on the cycle and period length settings. However, if you regularly log your period in the app, predictions will be based on the logged data',
                  weight: FontWeight.w300,
                  size: 12),
              const Divider(color: AppColors.grayLightColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText(
                    text: 'Chance of getting pregnant',
                    weight: FontWeight.w400,
                  ),
                  Switch(
                    value: _pregnancyChance,
                    onChanged: _togglePregnancyChance,
                    activeColor: AppColors.primaryColor,
                  )
                ],
              ),
              SubtitleText(
                  text:
                      'If you turn off this parameter, only the ovulation day will be displayed.',
                  weight: FontWeight.w300,
                  size: 12),
              const Divider(color: AppColors.grayLightColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText(
                    text: 'Luteal Phase',
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SubtitleText(
                                text: 'Select',
                                weight: FontWeight.w400,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_drop_down))
                            ],
                          ),
                          const Divider(color: AppColors.grayLightColor),
                        ],
                      ))
                ],
              ),
              SubtitleText(
                  text:
                      'Luteal Phase is the time between your ovulation and the beginning of your period. If you know the length of your luteal phase log it for more accurate predictions of ovulation.',
                  weight: FontWeight.w300,
                  size: 12),
              const Divider(color: AppColors.grayLightColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText(
                    text: 'Display cycle sequence',
                    weight: FontWeight.w400,
                  ),
                  Switch(
                    value: _pregnancyChance,
                    onChanged: _togglePregnancyChance,
                    activeColor: AppColors.primaryColor,
                  )
                ],
              ),
              SubtitleText(
                text:
                    'The cycle sequence (day 1,2,3,etc) will be displayed right above the calendar dates.',
                weight: FontWeight.w300,
                size: 12,
              ),
            ],
          ),
        )));
  }
}
