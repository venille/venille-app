import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/custom_text_widget.dart';

class BodyText extends CustomTextWidget {
  BodyText({
    super.key,
    Color? color,
    double? lineHeight,
    FontWeight? weight,
    int? maxLines,
    double? size,
    TextAlign? alignment,
    required String text,
    Color? decorationColor,
    TextDecoration? decoration,
  }) : super(
          size: size ?? 14,
          text: text.tr,
          maxLines: maxLines,
          lineHeight: lineHeight ?? 1,
          weight: weight ?? FontWeight.w400,
          textStyleName: AppTextSizes.bodyText1,
          alignment: alignment ?? TextAlign.left,
          color: color ?? AppColors.blackColor,
          decoration: decoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? Colors.transparent,
        );
}
