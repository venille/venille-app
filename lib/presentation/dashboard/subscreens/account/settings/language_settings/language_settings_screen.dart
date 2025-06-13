import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Language Settings'.tr,
          onTap: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.vertical_10),
              SubtitleText(
                text: 'Which language do you want to use?'.tr,
                weight: FontWeight.w400,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.vertical_10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubtitleText(
                      text: 'Select language',
                      weight: FontWeight.w500,
                    ),
                    const LanguageSelectorDropdown(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
