import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:venille/core/constants/colors.dart';

class Language {
  final String name;
  final String flag;
  final String languageCode;

  Language(
      {required this.name, required this.languageCode, required this.flag});
}

class LanguageSelectorDropdown extends StatefulWidget {
  const LanguageSelectorDropdown({super.key});

  @override
  State<LanguageSelectorDropdown> createState() =>
      _LanguageSelectorDropdownState();
}

class _LanguageSelectorDropdownState extends State<LanguageSelectorDropdown> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<Language> languages = [
    Language(name: 'English', languageCode: 'en', flag: '🇺🇸'),
    Language(name: 'French', languageCode: 'fr', flag: '🇫🇷'),
    Language(name: 'Chinese', languageCode: 'zh', flag: '🇨🇳'),
    Language(name: 'Spanish', languageCode: 'es', flag: '🇪🇸'),
    Language(name: 'Hausa', languageCode: 'ha', flag: '🇳🇬'),
  ];

  late Language selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = languages.firstWhere(
      (lang) => lang.languageCode == _localization.currentLocale?.languageCode,
      orElse: () => languages.first,
    );
  }

  void _changeLanguage(Language lang) {
    setState(() {
      selectedLanguage = lang;
    });

    _localization.translate(lang.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: selectedLanguage,
      underline: const SizedBox(),
      icon: const Icon(
        Icons.language,
        color: AppColors.appBarBackgroundColor,
      ),
      onChanged: (Language? lang) {
        if (lang != null) _changeLanguage(lang);
      },
      selectedItemBuilder: (context) {
        return languages.map((lang) {
          return Center(
              child: Text(lang.flag, style: const TextStyle(fontSize: 24)));
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
