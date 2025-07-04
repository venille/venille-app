// ignore_for_file: use_super_parameters

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/core/providers/index.dart';

class Language {
  final String name;
  final String flag;
  final Locale locale;

  Language({required this.name, required this.locale, required this.flag});
}

class LanguageSelectorDropdown extends StatefulWidget {
  const LanguageSelectorDropdown({Key? key}) : super(key: key);

  @override
  State<LanguageSelectorDropdown> createState() =>
      _LanguageSelectorDropdownState();
}

class _LanguageSelectorDropdownState extends State<LanguageSelectorDropdown> {
  final List<Language> languages = [
    Language(name: 'English', locale: const Locale('en'), flag: '🇺🇸'),
    Language(name: 'French', locale: const Locale('fr'), flag: '🇫🇷'),
    Language(name: 'Chinese', locale: const Locale('zh'), flag: '🇨🇳'),
    Language(name: 'Spanish', locale: const Locale('es'), flag: '🇪🇸'),
  ];

  late Language selectedLanguage;

  @override
  void initState() {
    super.initState();
    // Set current language based on Get.locale or default to English
    selectedLanguage = languages.firstWhere(
      (lang) => lang.locale.languageCode == Get.locale?.languageCode,
      orElse: () => languages.first,
    );
  }

  void _changeLanguage(Language lang) {
    setState(() {
      selectedLanguage = lang;
    });

    Get.updateLocale(lang.locale);

    ServiceRegistry.localStorage.write(
      LocalStorageSecrets.languageLocale,
      lang.locale.languageCode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: selectedLanguage,
      underline: const SizedBox(),
      icon: const Icon(
        Icons.language,
        color: AppColors.grayLightColor,
      ),
      onChanged: (Language? lang) {
        if (lang != null) _changeLanguage(lang);
      },
      selectedItemBuilder: (context) {
        return languages.map((lang) {
          return Center(
            child: Text(lang.flag, style: const TextStyle(fontSize: 24)),
          );
        }).toList();
      },
      items: languages.map((lang) {
        return DropdownMenuItem<Language>(
          value: lang,
          child: Text(lang.name, style: const TextStyle(fontSize: 16)),
        );
      }).toList(),
    );
  }
}
