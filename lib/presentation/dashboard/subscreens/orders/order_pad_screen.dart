import 'dart:io';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/text/form_label_text.dart';
import 'package:venille/components/form/form_text_field.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';

class OrderPadScreen extends StatefulWidget {
  const OrderPadScreen({super.key});

  @override
  State<OrderPadScreen> createState() => _OrderPadScreenState();
}

class _OrderPadScreenState extends State<OrderPadScreen> {
  int quantity = 1;
  RxBool isAddressValid = false.obs;
  String deliveryMethod = 'delivery';

  TextEditingController addressController = TextEditingController();
  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController nearestLandMarkController = TextEditingController();

  @override
  void initState() {
    super.initState();

    addressController.addListener(() {
      if (addressController.text.length > 5) {
        isAddressValid.value = true;
      } else {
        isAddressValid.value = false;
      }
    });
  }

  void handleSubmit() {
    if (isAddressValid.isFalse) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.addressMustBeAtleast5Characters.getString(context),
      );
    } else if (addressController.text.isEmpty) {
      return customErrorMessageSnackbar(
        duration: 5500,
        title: AppLocale.message.getString(context),
        message: AppLocale.addressRequired.getString(context),
      );
    } else if (buildingNumberController.text.isEmpty) {
      return customErrorMessageSnackbar(
        duration: 5500,
        title: AppLocale.message.getString(context),
        message: AppLocale.buildingNumberIsRequired.getString(context),
      );
    } else if (nearestLandMarkController.text.isEmpty) {
      return customErrorMessageSnackbar(
        duration: 5500,
        title: AppLocale.message.getString(context),
        message: AppLocale.nearestLandMark.getString(context),
      );
    } else {
      OrderSanitaryPadDTO payload = OrderSanitaryPadDTO(
        (instance) => instance
          ..quantity = quantity
          ..address = addressController.text.trim()
          ..deliveryMethod = deliveryMethod.toUpperCase()
          ..buildingNumber = buildingNumberController.text.trim()
          ..nearestLandmark = nearestLandMarkController.text.trim(),
      );

      ServiceRegistry.orderService.createSanitaryPadOrderService(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: SafeArea(
          // padding: MediaQuery.of(context).padding,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.only(
              left: AppSizes.horizontal_15,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.whiteColor,
                  AppColors.grayLightColor,
                ],
              ),
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: AppSizes.vertical_10,
                  ),
                  child: const CustomBackButton(
                    backgroundColor: AppColors.whiteColor,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 160,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/image_sanitary_pad_2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TitleText(
                    size: 20,
                    title: AppLocale.orderSanitaryPad.getString(context),
                  ),
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
              FormLabelText(
                text: AppLocale.quantity.getString(context),
                size: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.grayLightColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.remove,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SubtitleText(
                    text: '$quantity',
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.grayLightColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.vertical_12),
              FormLabelText(
                text: AppLocale.deliveryMethod.getString(context),
                size: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Radio<String>(
                          value: 'delivery',
                          groupValue: deliveryMethod,
                          onChanged: (value) {
                            setState(() {
                              deliveryMethod = value!;
                            });
                          },
                          activeColor: AppColors.greenColor,
                        ),
                        SubtitleText(
                          text: AppLocale.delivery.getString(context),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio<String>(
                          value: 'pickup',
                          groupValue: deliveryMethod,
                          onChanged: (value) {
                            setState(() {
                              deliveryMethod = value!;
                            });
                          },
                          activeColor: AppColors.greenColor,
                        ),
                        SubtitleText(
                          text: AppLocale.pickUp.getString(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.vertical_12),
              FormTextField(
                label: AppLocale.address.getString(context),
                hintText: 'e.g Abiola Adefemi Street',
                textController: addressController,
              ),
              const SizedBox(height: AppSizes.vertical_12),
              FormTextField(
                label: AppLocale.buildingNumber.getString(context),
                hintText: 'e.g 12A',
                textController: buildingNumberController,
              ),
              const SizedBox(height: AppSizes.vertical_12),
              FormTextField(
                label: AppLocale.nearestLandMark.getString(context),
                hintText: 'e.g bank, hospital etc...',
                textController: nearestLandMarkController,
              ),
              const SizedBox(height: AppSizes.vertical_50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              top: AppSizes.vertical_10,
              left: AppSizes.horizontal_15,
              right: AppSizes.horizontal_15,
              bottom: Platform.isAndroid
                  ? AppSizes.vertical_10
                  : AppSizes.vertical_25,
            ),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: ServiceRegistry
                    .orderService.isCreateSanitaryPadOrderProcessing.value
                ? const CustomLoadingButton(
                    height: 56,
                    backgroundColor: AppColors.blackColor,
                  )
                : CustomButton(
                    text: AppLocale.confirmDetails.getString(context),
                    width: double.maxFinite,
                    height: 56,
                    fontSize: 16,
                    borderRadius: 16,
                    onTapHandler: handleSubmit,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.whiteColor,
                    backgroundColor: isAddressValid.isFalse
                        ? AppColors.buttonPrimaryDisabledColor
                        : AppColors.buttonPrimaryColor,
                  ),
          );
        },
      ),
    );
  }
}
