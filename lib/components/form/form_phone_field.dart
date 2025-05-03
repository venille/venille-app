import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/form_label_text.dart';
import 'package:venille/components/form/custom_form_text_field.dart';
import 'package:venille/components/pickers/phone_country_picker.dart';

class FormPhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  const FormPhoneField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabelText(
            text: 'Phone number',
          ),
          const SizedBox(height: AppSizes.vertical_3),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PhoneCountryPicker(
                  height: 48,
                  borderRadius: 8,
                  borderColor: AppColors.grayLightColor,
                ),
                const SizedBox(width: AppSizes.horizontal_6),
                Expanded(
                  child: CustomFormTextField(
                    hintText: 'Enter phone number',
                    controller: phoneController,
                    maxLines: 1,
                    height: 48,
                    paddingTop: -3,
                    maxLength: 10,
                    borderRadius: 8,
                    width: double.maxFinite,
                    keyboardType: TextInputType.phone,
                    textColor: AppColors.primaryTextColor,
                    hintColor: AppColors.grayColor.withOpacity(0.3),
                    borderColor: AppColors.grayLightColor,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // Optional: Custom formatter to prevent starting with 0
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (newValue.text.isEmpty) return newValue;

                        String finalText = newValue.text;
                        int selectionOffset = newValue.selection.baseOffset;

                        if (finalText.startsWith('+234')) {
                          finalText = finalText.substring(4);
                          selectionOffset =
                              selectionOffset > 4 ? selectionOffset - 4 : 0;
                        } else if (finalText.startsWith('234')) {
                          finalText = finalText.substring(3);
                          selectionOffset =
                              selectionOffset > 3 ? selectionOffset - 3 : 0;
                        }

                        if (finalText.startsWith('0')) {
                          finalText = finalText.substring(1);
                          selectionOffset =
                              selectionOffset > 0 ? selectionOffset - 1 : 0;
                        }

                        return TextEditingValue(
                          text: finalText,
                          selection: TextSelection.collapsed(
                            offset: selectionOffset,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
