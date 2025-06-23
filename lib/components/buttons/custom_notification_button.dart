import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/badges/pulse_notification_badge.dart';

class CustomNotificationButton extends StatelessWidget {
  const CustomNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.notificationsRoute);
        },
        child: Stack(
          children: [
            Icon(
              ServiceRegistry.userRepository.notifications
                      .any((item) => item.isRead == false)
                  ? FluentIcons.alert_on_16_regular
                  : FluentIcons.alert_16_regular,
              size: 20,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Visibility(
                visible: ServiceRegistry.userRepository.notifications
                    .any((item) => item.isRead == false),
                child: const PulseNotificationBadge(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
