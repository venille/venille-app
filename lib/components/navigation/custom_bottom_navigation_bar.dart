// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

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
                color: AppColors.primaryBackgroundColor,
              );
            }

            return textStyle;
          },
        ),
      ),
      child: NavigationBar(
        height: 60,
        onDestinationSelected: widget.onTap,
        indicatorColor: AppColors.buttonPrimaryDisabledColor.withOpacity(0.4),
        animationDuration: const Duration(seconds: 0),
        selectedIndex:
            ServiceRegistry.commonRepository.currentScreenIndex.value,
        surfaceTintColor: AppColors.whiteColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          const NavigationDestination(
            icon: Icon(
              FluentIcons.home_16_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: Icon(
              FluentIcons.home_16_regular,
              size: 20,
              color: AppColors.primaryBackgroundColor,
            ),
            label: "Home",
          ),
          const NavigationDestination(
            icon: Icon(
              FluentIcons.calendar_ltr_20_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: Icon(
              FluentIcons.calendar_ltr_20_regular,
              size: 20,
              color: AppColors.primaryBackgroundColor,
            ),
            label: "Tracker",
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
            label: "Vella",
          ),
          const NavigationDestination(
            icon: Icon(
              FluentIcons.book_16_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: Icon(
              FluentIcons.book_16_regular,
              size: 20,
              color: AppColors.primaryBackgroundColor,
            ),
            label: "Learn",
          ),
          const NavigationDestination(
            icon: Icon(
              FluentIcons.rss_16_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: Icon(
              FluentIcons.rss_16_regular,
              size: 20,
              color: AppColors.primaryBackgroundColor,
            ),
            label: "Forum",
          ),
        ],
      ),
    );
  }
}
