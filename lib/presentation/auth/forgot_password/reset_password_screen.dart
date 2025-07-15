import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/navigation.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/form/form_password_field.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/buttons/custom_auth_back_button.dart';
import 'package:venille/components/buttons/show_hide_password_button.dart';
import 'package:venille/components/indicators/password_strength_indicator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool hidePassword = true;
  RxInt passwordStrength = 0.obs;
  RxBool showPassword = true.obs;
  RxBool isPasswordValid = false.obs;
  RxBool passwordHasNumber = false.obs;
  RxInt confirmPasswordStrength = 0.obs;
  RxBool passwordHasUppercase = false.obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      if (passwordController.text.length >= 8) {
        isPasswordValid.value = true;
      } else {
        isPasswordValid.value = false;
      }

      if (passwordController.text.contains(RegExp(r'[0-9]'))) {
        passwordHasNumber.value = true;
      } else {
        passwordHasNumber.value = false;
      }

      if (passwordController.text.contains(RegExp(r'[A-Z]'))) {
        passwordHasUppercase.value = true;
      } else {
        passwordHasUppercase.value = false;
      }

      passwordStrength.value = passwordController.text.length;
    });

    confirmPasswordController.addListener(() {
      confirmPasswordStrength.value = confirmPasswordController.text.length;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void submitHandler() {
    if (passwordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.newPasswordIsRequired.getString(context),
      );
    } else if (passwordStrength.value < 8) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.passwordMustBeAtleast8Characters.getString(context),
      );
    } else if (passwordHasUppercase.isFalse) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.passwordMustHaveAtleast1Uppercase.getString(context),
      );
    } else if (passwordHasNumber.isFalse) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.passwordMustHaveAtleast1Number.getString(context),
      );
    } else if (confirmPasswordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.confirmPassword.getString(context),
      );
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.passwordsDootMatch.getString(context),
      );
    } else {
      ResetPasswordDTO payload = ResetPasswordDTO(
        (instance) => instance
          ..accountId = Get.parameters['accountId']
          ..newPassword = passwordController.text.trim()
          ..passwordResetToken = Get.parameters['passwordResetToken'],
      );

      ServiceRegistry.authenticationService.resetPasswordService(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: AppSizes.screenWidth(context),
              height: AppSizes.screenHeight(context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                    'assets/images/image_background_2.jpg',
                  ),
                  fit:
                      AppSizes.screenWidth(context) > 600 ? BoxFit.cover : null,
                ),
              ),
            ),
          ),
          Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: Obx(() {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontal_15,
                    ),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSizes.vertical_30),
                        const CustomAuthBackButton(
                          navigateTo: AuthNavigationTypes.authSignIn,
                        ),
                        const SizedBox(height: AppSizes.vertical_15),
                        TitleText(
                          size: 20,
                          title:
                              AppLocale.createaNewPassword.getString(context),
                        ),
                        const SizedBox(height: AppSizes.vertical_5),
                        SubtitleText(
                          color: AppColors.textTertiaryColor,
                          text: AppLocale.enteraNewPasswordToSecureYourAccount
                              .getString(context),
                        ),
                        const SizedBox(height: AppSizes.vertical_20),
                        FormPasswordField(
                          label: AppLocale.password.getString(context),
                          hintText:
                              AppLocale.enterNewPassword.getString(context),
                          hidePassword: hidePassword,
                          passwordController: passwordController,
                        ),
                        const SizedBox(height: AppSizes.vertical_10),
                        FormPasswordField(
                          label: AppLocale.enterNewPassword.getString(context),
                          hintText: AppLocale.confirmPassword,
                          hidePassword: hidePassword,
                          passwordController: confirmPasswordController,
                        ),
                        const SizedBox(height: AppSizes.horizontal_15),
                        ShowHidePasswordButton(
                          showPassword: showPassword.value,
                          onTapHandler: () {
                            setState(() {
                              hidePassword = !hidePassword;
                              showPassword.value = !showPassword.value;
                            });
                          },
                        ),
                        const SizedBox(height: AppSizes.horizontal_15),
                        ServiceRegistry.authenticationService
                                .isResetPasswordProcessing.isTrue
                            ? const CustomLoadingButton(height: 56)
                            : CustomButton(
                                text: AppLocale.savePassword.getString(context),
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
            }),
          ),
        ],
      ),
    );
  }
}
