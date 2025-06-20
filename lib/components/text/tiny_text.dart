import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/custom_text_widget.dart';

class TinyText extends CustomTextWidget {
  TinyText({
    super.key,
    Color? color,
    FontWeight? weight,
    required String text,
  }) : super(
          size: 10,
          text: text.tr,
          weight: weight ?? FontWeight.w400,
          textStyleName: AppTextSizes.bodyText1,
          color: color ?? AppColors.blackColor,
        );
}
