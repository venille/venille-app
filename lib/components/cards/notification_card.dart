import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/components/modals/notification_info_bottom_modal.dart';

class NotificationCard extends StatelessWidget {
  final NotificationInfo notification;
  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(
        bottom: AppSizes.vertical_10,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.borderSecondaryColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/icon_notification.png',
                width: 14,
                height: 14,
              ),
              const SizedBox(width: AppSizes.horizontal_10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      size: 16,
                      title: notification.title,
                    ),
                    const SizedBox(height: AppSizes.vertical_2),
                    SubtitleText(
                      maxLines: 2,
                      text: notification.message,
                      color: AppColors.textTertiaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: AppColors.borderSecondaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyText(
                  text:
                      '${formatDayDateTime(notification.createdAt.toString(), dateFormat: 'MMM d, y')['date']!} ${formatDayDateTime(notification.createdAt.toString())['time']!}'),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      FocusScope.of(context).unfocus();

                      return NotificationInfoBottomModal(
                        notification: notification,
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    BodyText(
                      text: 'View',
                      weight: FontWeight.w600,
                      color: AppColors.greenColor,
                    ),
                    const Icon(
                      FluentIcons.chevron_right_16_regular,
                      size: 18,
                      color: AppColors.greenColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
