import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/custom_text_widget.dart';

class HeaderText extends CustomTextWidget {
  HeaderText({
    super.key,
    Color? color,
    int? maxLines,
    FontWeight? weight,
    required String text,
    TextAlign? alignment,
    Color? decorationColor,
    TextDecoration? decoration,
  }) : super(
          size: 18,
          text: text,
          maxLines: maxLines ?? 6,
          weight: weight ?? FontWeight.w400,
          textStyleName: AppTextSizes.title3,
          alignment: alignment ?? TextAlign.left,
          color: color ?? AppColors.blackColor,
          decoration: decoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? Colors.transparent,
        );
}
