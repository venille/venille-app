import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class ReferralBannerButtons extends StatelessWidget {
  final double height;
  const ReferralBannerButtons({super.key, this.height = 44});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SizedBox(
          height: height,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    log('[HANDLE-COPY-REFERRAL-CODE]');

                    copyToClipboard(
                      'Hi there friend, use my referral code "${ServiceRegistry.userRepository.accountInfo.value.referralCode}" to signup on Livestocx',
                    );
                  },
                  overlayColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                  child: Container(
                    height: double.maxFinite,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      color: AppColors.whiteColor,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          FluentIcons.copy_select_20_regular,
                          size: 22,
                          color: AppColors.blackColor,
                        ),
                        const SizedBox(width: AppSizes.horizontal_5),
                        BodyText(
                          weight: FontWeight.w500,
                          color: AppColors.blackColor,
                          text: ServiceRegistry
                              .userRepository.accountInfo.value.referralCode,
                          // textStyleName: AppTextSizes.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.horizontal_5),
              InkWell(
                onTap: () async {
                  log('[HANDLE-SHARE-REFERRAL-CODE]');

                  Share.share(
                    'Hi there friend, use my referral code "${ServiceRegistry.userRepository.accountInfo.value.referralCode}" to signup on Livestocx',
                  );
                },
                overlayColor: WidgetStateProperty.all(
                  Colors.transparent,
                ),
                child: Container(
                  width: 80,
                  height: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: AppColors.whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        size: 20,
                        color: AppColors.blackColor,
                        FluentIcons.share_android_16_regular,
                      ),
                      BodyText(
                        text: 'Share',
                        weight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
