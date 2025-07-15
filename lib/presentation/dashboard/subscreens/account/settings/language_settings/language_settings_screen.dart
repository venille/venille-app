import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/utilities/appLocale.dart';

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
          title: AppLocale.languageSettings.getString(context),
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
                text: AppLocale.whichLanguageDoYouWanttoUse.getString(context),
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
                      text: AppLocale.selectLanguage.getString(context),
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
