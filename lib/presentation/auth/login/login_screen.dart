import 'dart:io';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/form/form_text_field.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart';
import 'package:venille/components/text/custom_text_widget.dart';
import 'package:venille/components/form/form_password_field.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_icon_button.dart';
import 'package:venille/components/badges/venille_icon_badge.dart';
import 'package:venille/components/navigation/auth_redirect_link.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/navigation/auth_bottom_navigation_banner.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  RxBool isEmailValid = false.obs;
  RxBool isPhoneNumberValid = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void initializeAuth() async {
    await Future.delayed(const Duration(milliseconds: 80));

    if (ServiceRegistry.localStorage.read(LocalStorageSecrets.accessToken) !=
        null) {
      Get.toNamed(AppRoutes.dashboardRoute);
    }
  }

  @override
  void initState() {
    super.initState();

    initializeAuth();

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
    passwordController.dispose();

    super.dispose();
  }

  void submitHandler() async {
    if (!emailController.text.isEmail) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.invalidEmailAddress.getString(context),
      );
    } else if (passwordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.passwordIsIncorrect.getString(context),
      );
    } else {
      SigninDTO formData = SigninDTO((instance) => instance
        ..email = emailController.text.trim()
        ..password = passwordController.text.trim());

      FocusScope.of(context).unfocus();

      ServiceRegistry.authenticationService.signInService(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        return Future.value();
      },
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
            body: SafeArea(
              child: Obx(() {
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontal_15,
                    ),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //     'Current Language: ${Get.locale?.languageCode.toUpperCase()}'),
                        const SizedBox(height: AppSizes.vertical_30),
                        const VenilleIconBadge(size: 60),
                        const SizedBox(height: AppSizes.vertical_15),
                        TitleText(
                          size: 20,
                          title: AppLocale.welcome.getString(context),
                        ),
                        const AuthRedirectLink(),
                        const SizedBox(height: AppSizes.vertical_10),
                        FormTextField(
                          label: AppLocale.email.getString(context),
                          hintText: 'lisa@gmail.com',
                          textController: emailController,
                        ),
                        const SizedBox(height: AppSizes.vertical_10),
                        FormPasswordField(
                          label: AppLocale.password.getString(context),
                          hintText: '********',
                          showSuffixIcon: true,
                          hidePassword: hidePassword,
                          passwordController: passwordController,
                        ),
                        const SizedBox(height: AppSizes.horizontal_10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgotPasswordRoute);
                              },
                              overlayColor: const WidgetStatePropertyAll(
                                Colors.transparent,
                              ),
                              child: BodyText(
                                text:
                                    AppLocale.forgotPassword.getString(context),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.horizontal_10),
                        const SizedBox(height: AppSizes.horizontal_10),
                        ServiceRegistry
                                .authenticationService.isSignInProcessing.isTrue
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
                        const SizedBox(height: AppSizes.vertical_30),
                        Visibility(
                          visible: true,
                          // visible: Platform.isIOS,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                ServiceRegistry.localStorage.write(
                                  LocalStorageSecrets.authenticationMethod,
                                  'GUEST',
                                );

                                Get.offAndToNamed(AppRoutes.dashboardRoute);
                              },
                              overlayColor: const WidgetStatePropertyAll(
                                Colors.transparent,
                              ),
                              child: CustomTextWidget(
                                size: 16,
                                weight: FontWeight.w500,
                                text: AppLocale.continueAsGuest.getString(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            bottomNavigationBar: const AuthBottomNavigationBanner(),
          ),
        ],
      ),
    );
  }
}
