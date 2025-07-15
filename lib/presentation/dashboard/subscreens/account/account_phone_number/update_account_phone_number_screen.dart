import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/form/form_phone_field.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/form/form_password_field.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';

class UpdateAccountPhoneNumberScreen extends StatefulWidget {
  const UpdateAccountPhoneNumberScreen({super.key});

  @override
  State<UpdateAccountPhoneNumberScreen> createState() =>
      _UpdateAccountPhoneNumberScreenState();
}

class _UpdateAccountPhoneNumberScreenState
    extends State<UpdateAccountPhoneNumberScreen> {
  bool hidePassword = true;
  RxBool isPhoneNumberValid = false.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void initializeControllersContent() async {
    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      if (ServiceRegistry.userRepository.accountInfo.value.phone.isNotEmpty) {
        phoneController.text = ServiceRegistry
            .userRepository.accountInfo.value.phone
            .split('+234')[1];
      }
    });
  }

  @override
  void initState() {
    initializeControllersContent();

    super.initState();

    phoneController.addListener(() {
      if (phoneController.text.length == 10) {
        isPhoneNumberValid.value = true;
      } else {
        isPhoneNumberValid.value = false;
      }
    });
  }

  void handleSubmit() {
    if (passwordController.text.isEmpty) {
      return customErrorMessageSnackbar(
          title: AppLocale.message.getString(context),
          message: AppLocale.accountPasswordIsRequired.getString(context)
          //'Account password is required.',
          );
    } else if (ServiceRegistry.commonRepository.userCountry.value.dialCode !=
        '+234') {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.invalidCountryCode.getString(context),
      );
    } else if (isPhoneNumberValid.isFalse) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.phoneNumberMustBeAtleast10Digits.getString(context),
      );
    } else if (!phoneController.text.isNumericOnly) {
      return customErrorMessageSnackbar(
          duration: 5500,
          title: AppLocale.message.getString(context),
          message: AppLocale
              .invalidPhoneNumberEnsureThatYourPhoneNumberComprisesOfDigitsOnly
              .getString(context)
          // 'Invalid phone number, ensure that your phone number comprises of digits only!',
          );
    } else {
      UpdateAccountPhoneDTO payload = UpdateAccountPhoneDTO(
        (instance) => instance
          ..password = passwordController.text.trim()
          ..newPhone = formatPhoneNumber(
            ServiceRegistry.commonRepository.userCountry.value.dialCode!,
            phoneController.text.trim(),
          ),
      );

      ServiceRegistry.accountService.updateUserAccountPhoneNumberService(
        payload,
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
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontal_15,
            ),
            child: Row(
              children: [
                const CustomBackButton(),
                const SizedBox(width: AppSizes.horizontal_10),
                TitleText(
                  size: 20,
                  title: AppLocale.phoneNumber.getString(context),
                  weight: FontWeight.w700,
                ),
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
              const SizedBox(height: AppSizes.vertical_20),
              FormPhoneField(phoneController: phoneController),
              const SizedBox(height: AppSizes.vertical_10),
              FormPasswordField(
                showSuffixIcon: true,
                label: AppLocale.password.getString(context),
                hintText: AppLocale.enterAccountPassword.getString(context),
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
                          text: AppLocale.updatePhoneNumber.getString(context),
                          width: double.maxFinite,
                          height: 56,
                          fontSize: 16,
                          borderRadius: 16,
                          onTapHandler: handleSubmit,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                          backgroundColor: (isPhoneNumberValid.isFalse)
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
