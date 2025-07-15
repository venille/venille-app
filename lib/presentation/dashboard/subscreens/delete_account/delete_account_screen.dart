import 'package:flutter_localization/flutter_localization.dart';
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
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/modals/delete_account_confirmation_modal.dart';
import 'package:venille/core/utilities/appLocale.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool hidePassword = true;
  RxBool isPassword = false.obs;
  RxBool showPassword = true.obs;

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      if (passwordController.text.isNotEmpty) {
        isPassword.value = true;
      } else {
        isPassword.value = false;
      }
    });
  }

  void handleSubmit() {
    if (passwordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.passwordIsRequired.getString(context),
      );
    } else {
      showDialog(
        context: context,
        barrierColor: AppColors.blackColor.withOpacity(0.8),
        builder: (BuildContext context) {
          return DeleteAccountConfirmationModal(
            password: passwordController.text.trim(),
          );
        },
      );
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
                // SizedBox(width: AppSizes.horizontal_10),
                // TitleText(
                //   size: 20,
                //   title: 'Delete account',
                //   weight: FontWeight.w700,
                // ),
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
              TitleText(
                size: 20,
                title: AppLocale.deleteAccount.getString(context),
              ),
              SubtitleText(
                color: AppColors.textTertiaryColor,
                text: AppLocale
                    .enterYourCurrentPasswordToDeleteYourAccountAndData
                    .getString(context),
              ),
              const SizedBox(height: AppSizes.vertical_50),
              FormPasswordField(
                label: AppLocale.password.getString(context),
                showSuffixIcon: true,
                hintText: AppLocale.enterPassword.getString(context),
                hidePassword: hidePassword,
                passwordController: passwordController,
              ),
              const SizedBox(height: AppSizes.vertical_20),
              Obx(
                () {
                  return ServiceRegistry
                          .accountService.isUpdateAccountInfoProcessing.isTrue
                      ? const CustomLoadingButton(height: 56)
                      : CustomButton(
                          text: AppLocale.deleteAccount.getString(context),
                          width: double.maxFinite,
                          height: 56,
                          fontSize: 16,
                          borderRadius: 16,
                          onTapHandler: handleSubmit,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                          backgroundColor: (isPassword.isFalse)
                              ? AppColors.buttonPrimaryDisabledColor
                              : AppColors.buttonPrimaryColor,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
