import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
        title: 'Message',
        message: 'Invalid email address',
      );
    } else if (passwordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Password is incorrect',
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
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
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
                    const SizedBox(height: AppSizes.vertical_30),
                    const VenilleIconBadge(size: 60),
                    const SizedBox(height: AppSizes.vertical_15),
                    const TitleText(
                      size: 20,
                      title: "Welcome back",
                    ),
                    const AuthRedirectLink(),
                    const SizedBox(height: AppSizes.vertical_10),
                    FormTextField(
                      label: 'Email',
                      hintText: 'lisa@gmail.com',
                      textController: emailController,
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    FormPasswordField(
                      label: 'Password',
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
                            text: 'Forgot password?',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.horizontal_10),
                    ServiceRegistry
                            .authenticationService.isSignInProcessing.isTrue
                        ? const CustomLoadingButton(height: 56)
                        : CustomButton(
                            text: 'Continue',
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
                    const SizedBox(height: AppSizes.horizontal_10),
                  ],
                ),
              ),
            );
          }),
        ),
        bottomNavigationBar: const AuthBottomNavigationBanner(),
      ),
    );
  }
}
