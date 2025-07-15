import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:venille/components/skeletons/loading_animation.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/text/small_text.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/components/form/form_description_field.dart';
import 'package:venille/components/buttons/labeled_dropdown_button.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/engagement/lib/engagement_sdk.dart';

class CreateForumPostScreen extends StatefulWidget {
  const CreateForumPostScreen({super.key});

  @override
  State<CreateForumPostScreen> createState() => _CreateForumPostScreenState();
}

class _CreateForumPostScreenState extends State<CreateForumPostScreen> {
  final FocusNode _focusNode = FocusNode();
  String mediaUrl = "";
  RxBool isContentValid = false.obs;
  bool isPostImageUploaded = false;
  late PlatformFile? postPlatformImage;

  TextEditingController contentController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    contentController.addListener(() {
      if (contentController.text.isNotEmpty) {
        isContentValid.value = true;
      } else {
        isContentValid.value = false;
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void submitHandler() {
    if (ServiceRegistry
        .engagementService.isCreateUserForumPostProcessing.isTrue) {
      return;
    } else if (contentController.text.trim().isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.pleaseEnteraMessage.getString(context),
      );
    } else {
      CreateForumDto payload = CreateForumDto(
        (instance) => instance
          ..title = ' '
          ..description = contentController.text
          ..image = mediaUrl,
      );

      ServiceRegistry.engagementService
          .createUserForumPostService(payload: payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(
                  backgroundColor: AppColors.grayLightColor,
                ),
                TitleText(
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                  title: AppLocale.createPost.getString(context),
                ),
                const SizedBox(width: AppSizes.horizontal_35),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      try {
                        if (ServiceRegistry.engagementService
                            .isCreateUserForumPostProcessing.isTrue) {
                          return;
                        }

                        PlatformFile? platformFile =
                            await getImageFromDeviceStorage();

                        if (platformFile != null) {
                          debugPrint('[POST-IMAGE] :: $platformFile');

                          setState(() {
                            isPostImageUploaded = true;
                            postPlatformImage = platformFile;
                          });

                          String imageUrl = await ServiceRegistry.accountService
                              .uploadImage(platformFile);

                          if (imageUrl.isNotEmpty) {
                            setState(() {
                              mediaUrl = imageUrl;
                            });
                          }
                        }
                      } catch (error) {
                        debugPrint('[UPLOAD-POST-IMAGE-ERROR] :: $error');
                      }
                    },
                    child: Container(
                      width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: SmallText(
                        text: AppLocale.addPostImage.getString(context),
                        color: AppColors.whiteColor,
                      )),
                    ),
                  ),
                ],
              ),
              isPostImageUploaded == true
                  ? Container(
                      height: 300,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(
                            File(postPlatformImage!.path!),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: AppSizes.vertical_5),
              FormDescriptionField(
                  label: AppLocale.postContent.getString(context),
                  maxLength: 1500,
                  showCharacterCount: true,
                  height: AppSizes.screenHeight(context) * 0.6,
                  textController: contentController,
                  borderColor: AppColors.whiteColor,
                  hintText: AppLocale
                      .readyToIgniteMeaningfulDiscussionsShareYourInsightsAndPerspectivesWithTheVenilleCommunity
                      .getString(context)
                  // 'Ready to ignite meaningful discussions? Share your insights and perspectives with the Venille community.',
                  ),
              const SizedBox(height: AppSizes.vertical_40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 5,
              color: AppColors.grayLightColor,
            ),
          ],
        ),
        padding: const EdgeInsets.only(
          left: AppSizes.horizontal_15,
          right: AppSizes.horizontal_15,
          bottom: AppSizes.vertical_10,
        ),
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isPostImageUploaded == true
                  ? Container(
                      height: double.maxFinite,
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(
                            File(postPlatformImage!.path!),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const SizedBox(),
              InkWell(
                onTap: submitHandler,
                child: Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.buttonPrimaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: ServiceRegistry.engagementService
                            .isCreateUserForumPostProcessing.isTrue
                        ? const LoadingAnimation(
                            size: 15,
                            color: AppColors.whiteColor,
                          )
                        : SmallText(
                            text: AppLocale.submit.getString(context),
                            color: AppColors.whiteColor,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
