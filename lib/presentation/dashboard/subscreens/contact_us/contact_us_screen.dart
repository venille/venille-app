import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/form/form_text_field.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/form/form_description_field.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  RxBool isSubjectValid = false.obs;
  RxBool isMessageValid = false.obs;

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    subjectController.addListener(() {
      if (subjectController.text.length > 3) {
        isSubjectValid.value = true;
      } else {
        isSubjectValid.value = false;
      }
    });

    messageController.addListener(() {
      if (messageController.text.length > 3) {
        isMessageValid.value = true;
      } else {
        isMessageValid.value = false;
      }
    });
  }

  @override
  void dispose() {
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void submitHandler() async {
    if (!isSubjectValid.value) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Invalid subject',
      );
    } else if (!isMessageValid.value) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Invalid message',
      );
    } else {
      FocusScope.of(context).unfocus();

      ContactUsDTO contactUsDTO = ContactUsDTO(
        (instance) => instance
          ..subject = subjectController.text
          ..message = messageController.text
          ..email = ServiceRegistry.userRepository.accountInfo.value.email
          ..name =
              '${ServiceRegistry.userRepository.accountInfo.value.firstName} ${ServiceRegistry.userRepository.accountInfo.value.lastName}',
      );

      debugPrint('CONTACT US DTO - ${contactUsDTO.email}');

      bool isContactUsSuccessful =
          await ServiceRegistry.accountService.contactUsService(contactUsDTO);

      if (isContactUsSuccessful) {
        setState(() {
          subjectController.clear();
          messageController.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Contact Us',
          onTap: () {
            Get.back();
          },
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
                title: 'Having problems?',
              ),
              SubtitleText(
                text:
                    'We are here to help you with any issues you may have. Please contact us using the form below.',
              ),
              const SizedBox(height: AppSizes.vertical_20),
              FormTextField(
                label: 'Subject',
                hintText: 'Period Notification Error',
                textController: subjectController,
              ),
              const SizedBox(height: AppSizes.vertical_15),
              FormDescriptionField(
                label: 'Message',
                maxLength: 250,
                showCharacterCount: true,
                textController: messageController,
                hintText:
                    'I am having issues receiving notifications about my period.',
              ),
              const SizedBox(height: AppSizes.vertical_25),
              Obx(
                () => ServiceRegistry.accountService.isContactUsProcessing.value
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
                        backgroundColor:
                            (isSubjectValid.value && isMessageValid.value)
                                ? AppColors.buttonPrimaryColor
                                : AppColors.buttonPrimaryDisabledColor,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
