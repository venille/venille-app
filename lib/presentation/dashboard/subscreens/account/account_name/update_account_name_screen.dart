import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/form/form_text_field.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';

class UpdateAccountNameScreen extends StatefulWidget {
  const UpdateAccountNameScreen({super.key});

  @override
  State<UpdateAccountNameScreen> createState() =>
      _UpdateAccountNameScreenState();
}

class _UpdateAccountNameScreenState extends State<UpdateAccountNameScreen> {
  RxBool isLastNameValid = false.obs;
  RxBool isFirstNameValid = false.obs;

  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  void initializeControllersContent() async {
    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      firstNameController.text =
          ServiceRegistry.userRepository.accountInfo.value.firstName;
      lastNameController.text =
          ServiceRegistry.userRepository.accountInfo.value.lastName;
    });
  }

  @override
  void initState() {
    initializeControllersContent();

    super.initState();

    firstNameController.addListener(() {
      if (firstNameController.text.length > 2) {
        isFirstNameValid.value = true;
      } else {
        isFirstNameValid.value = false;
      }
    });
    lastNameController.addListener(() {
      if (lastNameController.text.length > 2) {
        isLastNameValid.value = true;
      } else {
        isLastNameValid.value = false;
      }
    });
  }

  void submitHandler() {
    if (firstNameController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.firstNameIsRequired.getString(context),
      );
    } else if (lastNameController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.lastNameIsRequired.getString(context),
      );
    } else {
      UpdateAccountNameDTO payload = UpdateAccountNameDTO(
        (instance) => instance
          ..firstName = firstNameController.text.trim()
          ..lastName = lastNameController.text.trim(),
      );

      ServiceRegistry.accountService.updateUserAccountNameService(payload);
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
            child: Row(
              children: [
                const CustomBackButton(),
                const SizedBox(width: AppSizes.horizontal_10),
                TitleText(
                  size: 20,
                  title: AppLocale.accountName.getString(context),
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
              FormTextField(
                label: AppLocale.firstName.getString(context),
                hintText: 'e.g Kunle',
                textController: firstNameController,
              ),
              const SizedBox(height: AppSizes.vertical_20),
              FormTextField(
                label: AppLocale.lastName.getString(context),
                hintText: 'e.g Ahmed',
                textController: lastNameController,
              ),
              const SizedBox(height: AppSizes.vertical_20),
              Obx(
                () {
                  return ServiceRegistry
                          .accountService.isUpdateAccountInfoProcessing.isTrue
                      ? const CustomLoadingButton(height: 56)
                      : CustomButton(
                          text: AppLocale.updateName.getString(context),
                          width: double.maxFinite,
                          height: 56,
                          fontSize: 16,
                          borderRadius: 16,
                          onTapHandler: submitHandler,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                          backgroundColor: (isLastNameValid.isFalse ||
                                  isFirstNameValid.isFalse)
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
