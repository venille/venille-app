import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/form_label_text.dart';
import 'package:venille/components/form/custom_form_password_field.dart';

class FormPasswordField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool hidePassword;
  final bool showSuffixIcon;
  final TextEditingController passwordController;
  const FormPasswordField({
    super.key,
    required this.label,
    required this.hintText,
    required this.hidePassword,
    this.showSuffixIcon = false,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabelText(
            text: label.tr,
          ),
          const SizedBox(height: AppSizes.vertical_3),
          CustomFormPasswordField(
            hintText: hintText.tr,
            borderRadius: 8,
            controller: passwordController,
            height: 48,
            hidePassword: hidePassword,
            showSuffixIcon: showSuffixIcon,
            fontColor: AppColors.textColor,
            borderColor: AppColors.grayLightColor,
            hintColor: AppColors.grayColor.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
