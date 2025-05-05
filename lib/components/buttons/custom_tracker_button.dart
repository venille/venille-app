import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class CustomTrackerButton extends StatelessWidget {
  const CustomTrackerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ServiceRegistry.commonRepository.currentScreenIndex.value = 1;

        Get.toNamed(AppRoutes.dashboardRoute);
      },
      child: const Icon(
        FluentIcons.calendar_12_regular,
        size: 20,
      ),
    );
  }
}
