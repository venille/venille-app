import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/data/infra_sdk/engagement/lib/engagement_sdk.dart';

class CourseDescriptionScreen extends StatefulWidget {
  // final CourseInfo course;
  const CourseDescriptionScreen({
    super.key,
    // required this.course
  });

  @override
  State<CourseDescriptionScreen> createState() =>
      _CourseDescriptionScreenState();
}

class _CourseDescriptionScreenState extends State<CourseDescriptionScreen> {
  final RxBool showOriginal = false.obs;

  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(250),
            child: SafeArea(
              child: Container(
                // color: Colors.amber,
                height: double.maxFinite,
                padding: const EdgeInsets.only(
                  top: AppSizes.vertical_5,
                  left: AppSizes.horizontal_15,
                  right: AppSizes.horizontal_15,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ServiceRegistry
                        .userRepository.courseInfo.value.coverPhoto),
                    fit: BoxFit.cover,
                  ),
                  border: const Border(
                    bottom: BorderSide(color: AppColors.grayLightColor),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomBackButton(
                      callBackFunction: () {
                        Get.back();
                      },
                      iconColor: AppColors.whiteColor,
                      backgroundColor: AppColors.blackColor,
                    ),
                    const TitleText(
                      size: 16,
                      title: '',
                    ),
                    const SizedBox(width: AppSizes.horizontal_35),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: AppSizes.vertical_10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        TranslateLongTextDto payload = TranslateLongTextDto(
                          (instance) => instance
                            ..text = ServiceRegistry
                                .userRepository.courseInfo.value.description,
                        );

                        ServiceRegistry.engagementService
                            .translateCourseDescriptionService(
                          payload: payload,
                          courseId: ServiceRegistry
                              .userRepository.courseInfo.value.id,
                          sourceLanguage: showOriginal.isFalse
                              ? 'en'
                              : '${_localization.currentLocale?.languageCode}',
                          targetLanguage: showOriginal.isFalse
                              ? '${_localization.currentLocale?.languageCode}'
                              : 'en',
                          courseCategory: ServiceRegistry
                              .userRepository.courseCategory.value,
                          updateLocalState: () {
                            showOriginal.value = !showOriginal.value;
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSizes.vertical_5,
                          horizontal: AppSizes.horizontal_15,
                        ),
                        child: BodyText(
                          color: AppColors.whiteColor,
                          weight: FontWeight.w400,
                          text:
                              'Show ${showOriginal.isFalse ? "translation" : "original"}'
                                  .tr,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppSizes.horizontal_10,
                    right: AppSizes.horizontal_10,
                  ),
                  child: Markdown(
                    data: ServiceRegistry
                        .userRepository.courseInfo.value.description,
                    shrinkWrap: true,
                    styleSheet: MarkdownStyleSheet(
                      h1: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                      h2: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                      h3: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                      p: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                    onTapLink: (text, href, title) {
                      log('[TEXT] :: $text');
                      log('[HREF] :: $href');
                      log('[TITLE] :: $title');

                      if (href != null) {
                        launchExternalBrowserUrl(href);
                      }
                    },
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
