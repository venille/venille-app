import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/form/form_password_field.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/buttons/show_hide_password_button.dart';
import 'package:venille/components/indicators/password_strength_indicator.dart';

class UpdateAccountPasswordScreen extends StatefulWidget {
  const UpdateAccountPasswordScreen({super.key});

  @override
  State<UpdateAccountPasswordScreen> createState() =>
      _UpdateAccountPasswordScreenState();
}

class _UpdateAccountPasswordScreenState
    extends State<UpdateAccountPasswordScreen> {
  bool hidePassword = true;
  RxInt passwordStrength = 0.obs;
  RxBool showPassword = true.obs;
  RxBool isPasswordValid = false.obs;
  RxBool passwordHasNumber = false.obs;
  RxBool passwordHasUppercase = false.obs;
  RxInt confirmPasswordStrength = 0.obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    newPasswordController.addListener(() {
      if (newPasswordController.text.length >= 8) {
        isPasswordValid.value = true;
      } else {
        isPasswordValid.value = false;
      }

      if (newPasswordController.text.contains(RegExp(r'[0-9]'))) {
        passwordHasNumber.value = true;
      } else {
        passwordHasNumber.value = false;
      }

      if (newPasswordController.text.contains(RegExp(r'[A-Z]'))) {
        passwordHasUppercase.value = true;
      } else {
        passwordHasUppercase.value = false;
      }

      newPasswordController.addListener(() {
        confirmPasswordStrength.value = newPasswordController.text.length;
      });

      passwordStrength.value = newPasswordController.text.length;
    });
  }

  void submitHandler() {
    if (passwordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Current password is required',
      );
    } else if (passwordStrength.value < 8) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Password must be at least 8 characters',
      );
    } else if (passwordHasUppercase.isFalse) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Password must have at least 1 uppercase',
      );
    } else if (passwordHasNumber.isFalse) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Password must have at least 1 number(digit)',
      );
    } else if (newPasswordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'New password is required',
      );
    } else if (confirmNewPasswordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Confirm new password is required',
      );
    } else if (newPasswordController.text.trim() !=
        confirmNewPasswordController.text.trim()) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Passwords do not match!',
      );
    } else {
      UpdateAccountPasswordDTO payload = UpdateAccountPasswordDTO(
        (instance) => instance
          ..currentPassword = passwordController.text.trim()
          ..newPassword = newPasswordController.text.trim(),
      );

      ServiceRegistry.accountService.updateAccountPasswordService(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          // padding: MediaQuery.of(context).padding,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontal_15,
            ),
            child: const Row(
              children: [
                CustomBackButton(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                size: 20,
                title: 'Create a new password',
              ),
              SubtitleText(
                weight: FontWeight.w400,
                color: AppColors.textTertiaryColor,
                text: 'Enter a new password to secure your account.',
              ),
              const SizedBox(height: AppSizes.vertical_50),
              FormPasswordField(
                label: 'Current password',
                hintText: 'enter password',
                hidePassword: hidePassword,
                passwordController: passwordController,
              ),
              const SizedBox(height: AppSizes.vertical_10),
              FormPasswordField(
                label: 'New password',
                hintText: 'enter new password',
                hidePassword: hidePassword,
                passwordController: newPasswordController,
              ),
              const SizedBox(height: AppSizes.vertical_10),
              FormPasswordField(
                label: 'Confirm password',
                hintText: 'confirm new password',
                hidePassword: hidePassword,
                passwordController: confirmNewPasswordController,
              ),
              const SizedBox(height: AppSizes.horizontal_15),
              ShowHidePasswordButton(
                showPassword: showPassword.value,
                onTapHandler: () {
                  setState(() {
                    showPassword.value = !showPassword.value;
                    hidePassword = !hidePassword;
                  });
                },
              ),
              const SizedBox(height: AppSizes.horizontal_15),
              Obx(
                () {
                  return ServiceRegistry
                          .accountService.isUpdateAccountInfoProcessing.isTrue
                      ? const CustomLoadingButton(height: 56)
                      : CustomButton(
                          text: 'Save password',
                          width: double.maxFinite,
                          height: 56,
                          fontSize: 16,
                          borderRadius: 16,
                          onTapHandler: submitHandler,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                          backgroundColor: isPasswordValid.isFalse
                              ? AppColors.buttonPrimaryDisabledColor
                              : AppColors.buttonPrimaryColor,
                        );
                },
              ),
              const SizedBox(height: AppSizes.horizontal_15),
              PasswordStrengthIndicator(
                passwordStrength: passwordStrength,
                passwordHasNumber: passwordHasNumber,
                passwordHasUppercase: passwordHasUppercase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
