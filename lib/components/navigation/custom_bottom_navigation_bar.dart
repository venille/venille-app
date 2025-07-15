// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/core/utilities/appLocale.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentPage;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentPage,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            TextStyle textStyle = const TextStyle(
              fontSize: 11,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: AppColors.textTertiaryInverseColor,
            );

            if (states.contains(MaterialState.selected)) {
              textStyle = textStyle.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              );
            }

            return textStyle;
          },
        ),
      ),
      child: NavigationBar(
        height: 60,
        onDestinationSelected: widget.onTap,
        indicatorColor: AppColors.grayColor.withOpacity(0.3),
        animationDuration: const Duration(seconds: 0),
        selectedIndex:
            ServiceRegistry.commonRepository.currentScreenIndex.value,
        surfaceTintColor: AppColors.whiteColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        backgroundColor: AppColors.whiteColor,
        destinations: [
          NavigationDestination(
            icon: const Icon(
              FluentIcons.home_20_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: const Icon(
              FluentIcons.home_20_regular,
              size: 20,
              color: AppColors.blackColor,
            ),
            label: AppLocale.home.getString(context),
          ),
          NavigationDestination(
            icon: const Icon(
              FluentIcons.calendar_ltr_20_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: const Icon(
              FluentIcons.calendar_ltr_20_regular,
              size: 20,
              color: AppColors.blackColor,
            ),
            label: AppLocale.tracker.getString(context),
          ),
          NavigationDestination(
            icon: Icon(
              FluentIcons.heart_pulse_20_regular,
              size: 28,
              color: AppColors.buttonPrimaryColor.withOpacity(0.7),
            ),
            selectedIcon: const Icon(
              FluentIcons.heart_pulse_20_regular,
              size: 28,
              color: AppColors.buttonPrimaryColor,
            ),
            label: "Venille AI",
          ),
          NavigationDestination(
            icon: const Icon(
              FluentIcons.book_template_20_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: const Icon(
              FluentIcons.book_template_20_regular,
              size: 20,
              color: AppColors.blackColor,
            ),
            label: AppLocale.learn.getString(context),
          ),
          NavigationDestination(
            icon: const Icon(
              FluentIcons.mail_inbox_16_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: const Icon(
              FluentIcons.mail_inbox_16_regular,
              size: 20,
              color: AppColors.blackColor,
            ),
            label: AppLocale.forum.getString(context),
          ),
        ],
      ),
    );
  }
}
