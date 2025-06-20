import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/custom_text_widget.dart';

class FormLabelText extends CustomTextWidget {
  FormLabelText({
    super.key,
    double size = 16,
    required String text,
    FontWeight fontWeight = FontWeight.w400,
  }) : super(
          size: size,
          text: text,
          weight: fontWeight,
          textStyleName: AppTextSizes.bodyText1,
        );
}
