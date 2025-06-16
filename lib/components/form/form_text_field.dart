import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/profile_appbar.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/form_label_text.dart';
import 'package:venille/components/form/custom_form_text_field.dart';

class FormTextField extends StatelessWidget {
  final double? width;
  final String label;
  final String hintText;
  final int? maxLength;
  final double labelSize;
  final TextInputType? keyboardType;
  final TextEditingController textController;
  const FormTextField({
    super.key,
    this.width,
    this.keyboardType,
    required this.label,
    required this.hintText,
    this.labelSize = 16,
    this.maxLength,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabelText(
            text: label.tr,
            size: labelSize,
          ),
          const SizedBox(height: AppSizes.vertical_3),
          CustomFormTextField(
            hintText: hintText.tr,
            controller: textController,
            maxLines: 1,
            height: 48,
            maxLength: maxLength,
            keyboardType: keyboardType,
            paddingTop: -3,
            borderRadius: 8,
            textColor: AppColors.primaryTextColor,
            hintColor: AppColors.grayColor.withOpacity(0.3),
            borderColor: AppColors.grayLightColor,
          ),
        ],
      ),
    );
  }
}
