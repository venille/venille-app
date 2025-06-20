// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/custom_text_widget.dart';
import 'package:venille/components/buttons/referral_banner_buttons.dart';

class ReferralBanner extends StatelessWidget {
  const ReferralBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.vertical_10,
        horizontal: AppSizes.horizontal_15,
      ),
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        border: Border.all(
          color: AppColors.blackColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/image_referral_cover.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/icon_link.png',
            width: 45,
          ),
          const SizedBox(width: AppSizes.horizontal_20),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: AppSizes.vertical_3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      size: 18,
                      text: 'Referral Code',
                      weight: FontWeight.w700,
                      color: AppColors.whiteColor,
                      textStyleName: AppTextSizes.title1,
                    ),
                  ],
                ),
                const Spacer(),
                const ReferralBannerButtons(
                  height: 36,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
