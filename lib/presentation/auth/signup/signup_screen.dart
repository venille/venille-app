import 'dart:io';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/components/text/small_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/form/form_text_field.dart';
import 'package:venille/components/form/form_phone_field.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/badges/venille_icon_badge.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/navigation/auth_redirect_link.dart';
import 'package:venille/components/buttons/labeled_dropdown_button.dart';
import 'package:venille/core/utilities/appLocale.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  String accountType = 'CUSTOMER';
  RxBool isEmailValid = false.obs;
  RxBool isPhoneNumberValid = false.obs;

  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();

  void initializeControllersAndStates() async {
    ServiceRegistry.authenticationService.fetchAvailableStatesService();

    await Future.delayed(const Duration(milliseconds: 300));

    if (Get.parameters['email'] != null) {
      emailController.text = Get.parameters['email']!;
    }
  }

  @override
  void initState() {
    super.initState();

    initializeControllersAndStates();

    phoneController.addListener(() {
      if (phoneController.text.length >= 10) {
        isPhoneNumberValid.value = true;
      } else {
        isPhoneNumberValid.value = false;
      }
    });

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
    phoneController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    referralCodeController.dispose();

    super.dispose();
  }

  void submitHandler() async {
    if (emailController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.emailIsRequired.getString(context),
      );
    } else if (isEmailValid.isFalse) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.invalidEmailAddress.getString(context),
      );
    } else if (firstNameController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.firstNameIsRequired.getString(context),
      );
    } else if (lastNameController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.lastName.getString(context),
      );
    } else if (phoneController.text.isNotEmpty &&
        !phoneController.text.isNumericOnly) {
      return customErrorMessageSnackbar(
        duration: 5500,
        title: AppLocale.message.getString(context),
        message:
            AppLocale.invalidPhoneNumberEnsureThatYourPhoneNumberComprisesOfDigitsOnly.getString(context),
      );
    } else {
      Map<String, dynamic> payload = {
        "phone": phoneController.text.isNotEmpty
            ? formatPhoneNumber(
                ServiceRegistry.commonRepository.userCountry.value.dialCode!,
                phoneController.text.trim(),
              )
            : "",
        "email": emailController.text.trim(),
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        // "state": stateController.text.trim(),
        // "city": cityController.text.trim(),
        "referralCode": referralCodeController.text.isNotEmpty
            ? referralCodeController.text.trim()
            : "",
      };

      ServiceRegistry.authenticationService
          .checkEmailPhoneAvailabilityService(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(AppRoutes.loginRoute);

        return false;
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
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(135),
              child: SafeArea(
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  // color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontal_15,
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSizes.vertical_30),
                      const VenilleIconBadge(size: 60),
                      const SizedBox(height: AppSizes.vertical_15),
                      TitleText(
                        size: 20,
                        title: AppLocale.letsGetToKnowYou.getString(context),
                      ),
                      const SizedBox(height: AppSizes.vertical_5),
                      const AuthRedirectLink(routeType: 'LOGIN'),
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
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSizes.vertical_5),
                    FormTextField(
                      label: AppLocale.email.getString(context),
                      hintText: 'lisa@gmail.com',
                      textController: emailController,
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: AppSizes.screenWidth(context) * 0.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormTextField(
                                  label: AppLocale.firstName.getString(context),
                                  hintText: 'Lisa',
                                  textController: firstNameController,
                                  width: AppSizes.screenWidth(context) * 0.7,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppSizes.screenWidth(context) * 0.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormTextField(
                                  label: AppLocale.lastName.getString(context),
                                  hintText: 'Olayinka',
                                  textController: lastNameController,
                                  width: AppSizes.screenWidth(context) * 0.7,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    FormPhoneField(
                      label: AppLocale.phoneNumberOptional.getString(context),
                      phoneController: phoneController,
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    FormTextField(
                      label: AppLocale.referralCodeOptional.getString(context),
                      textController: referralCodeController,
                      hintText: AppLocale.enterReferralCode.getString(context),
                    ),
                    const SizedBox(height: AppSizes.horizontal_30),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                top: AppSizes.vertical_10,
                left: AppSizes.horizontal_15,
                right: AppSizes.horizontal_15,
                bottom: Platform.isAndroid
                    ? AppSizes.vertical_10
                    : AppSizes.vertical_25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SmallText(
                        // maxLines: 10,
                        text: AppLocale.byContinuingYouAutomaticallyAcceptOur.getString(context),
                      ),
                      InkWell(
                        onTap: () {
                          launchExternalBrowserUrl(
                            'https://venille.com.ng/terms-of-service',
                          );
                        },
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        child: SmallText(
                          // maxLines: 10,
                          weight: FontWeight.bold,
                          text: AppLocale.termsAndConditions.getString(context),
                        ),
                      ),
                      SmallText(
                        // maxLines: 10,
                        text: AppLocale.and.getString(context),
                      ),
                      InkWell(
                        onTap: () {
                          launchExternalBrowserUrl(
                            'https://venille.com.ng/privacy-policy',
                          );
                        },
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        child: SmallText(
                          // maxLines: 10,
                          weight: FontWeight.bold,
                          text: AppLocale.privacyPolicy.getString(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.vertical_10),
                  Obx(() {
                    return ServiceRegistry
                            .authenticationService.isSignUpProcessing.isTrue
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
                          );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
