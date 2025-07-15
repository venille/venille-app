import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/form/form_text_field.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/buttons/custom_auth_back_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool hidePassword = true;

  RxBool isEmailValid = false.obs;
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      if (emailController.text.isEmail) {
        isEmailValid.value = true;
      } else {
        isEmailValid.value = false;
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  void submitHandler() async {
    if (emailController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.emailIsRequired.getString(context),
      );
    } else if (!emailController.text.isEmail) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.invalidEmailAddress.getString(context),
      );
    } else {
      ForgotPasswordDTO payload = ForgotPasswordDTO(
        (instance) => instance..email = emailController.text.trim(),
      );

      ServiceRegistry.authenticationService.forgotPasswordService(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                fit: AppSizes.screenWidth(context) > 600 ? BoxFit.cover : null,
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
                      const CustomAuthBackButton(),
                      const SizedBox(height: AppSizes.vertical_15),
                      TitleText(
                        size: 20,
                        title: AppLocale.forgotYourPassword.getString(context),
                      ),
                      const SizedBox(height: AppSizes.vertical_5),
                      SubtitleText(
                        weight: FontWeight.w400,
                        color: AppColors.textTertiaryColor,
                        text: AppLocale
                            .confirmYourEmailAndYouWillReceiveaLinkToResetPassword
                            .getString(context),
                      ),
                      const SizedBox(height: AppSizes.vertical_20),
                      FormTextField(
                        label: AppLocale.email.getString(context),
                        hintText: 'lisa@gmail.com',
                        textController: emailController,
                      ),
                      const SizedBox(height: AppSizes.horizontal_15),
                      ServiceRegistry.authenticationService
                              .isForgotPasswordProcessing.isTrue
                          ? const CustomLoadingButton(height: 56)
                          : CustomButton(
                              text: AppLocale.continued.getString(context),
                              width: double.maxFinite,
                              height: 56,
                              fontSize: 16,
                              borderRadius: 16,
                              onTapHandler: submitHandler,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.whiteColor,
                              backgroundColor: isEmailValid.isFalse
                                  ? AppColors.buttonPrimaryDisabledColor
                                  : AppColors.buttonPrimaryColor,
                            ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
