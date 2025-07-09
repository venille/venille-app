import 'dart:io';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/skeletons/empty_results_content.dart';

class OnboardingQuestionsScreen extends StatefulWidget {
  const OnboardingQuestionsScreen({super.key});

  @override
  State<OnboardingQuestionsScreen> createState() =>
      _OnboardingQuestionsScreenState();
}

class _OnboardingQuestionsScreenState extends State<OnboardingQuestionsScreen> {
  int questionIndex = 0;
  Map<String, dynamic> selectedOptions = {};
  Map<String, List<String>> multipleSelectedOptions = {};

  Future<void> initializeOnboardingQuestions() async {
    await ServiceRegistry.accountService.fetchOnboardingQuestionsService();

    setState(() {
      questionIndex = 0;
      selectedOptions.clear();
      multipleSelectedOptions.clear();
    });
  }

  DateTime? _selectedDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
      initialDate: _selectedDate ?? DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    initializeOnboardingQuestions();
  }

  BoxDecoration getBoxDecoration({String optionType = 'text'}) {
    return BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: AppColors.grayColor.withOpacity(0.3),
      ),
    );
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/image_background_1.jpg',
                  ),
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: ReturnToAppbar(
                title: 'Onboarding Survey',
                onTap: () {
                  return;
                  // Get.back();
                },
              ),
            ),
            body: RefreshIndicator(
              onRefresh: initializeOnboardingQuestions,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.horizontal_15,
                          ),
                          child: ServiceRegistry
                                  .userRepository.onboardingQuestions.isEmpty
                              ? const Column(
                                  children: [
                                    EmptyResultsContent(
                                      displayType: 'ONBOARDING_QUESTIONS',
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                        height: AppSizes.vertical_10),
                                    Container(
                                      width: double.infinity,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: (questionIndex + 1) /
                                            ServiceRegistry.userRepository
                                                .onboardingQuestions.length,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.purpleColor,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: AppSizes.vertical_20),
                                    BodyText(
                                      weight: FontWeight.w600,
                                      color: AppColors.purpleColor,
                                      text: 'Question ${questionIndex + 1}',
                                    ),
                                    const SizedBox(
                                        height: AppSizes.vertical_30),
                                    SubtitleText(
                                      size: 25,
                                      weight: FontWeight.w500,
                                      text: ServiceRegistry.userRepository
                                          .onboardingQuestion.value.question,
                                    ),
                                    const SizedBox(
                                        height: AppSizes.vertical_10),
                                    ServiceRegistry
                                                .userRepository
                                                .onboardingQuestion
                                                .value
                                                .questionType ==
                                            'date'
                                        ? GestureDetector(
                                            onTap: () async {
                                              final DateTime? picked =
                                                  await showDatePicker(
                                                context: context,
                                                lastDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                initialDate: _selectedDate ??
                                                    DateTime.now(),
                                              );

                                              if (picked != null &&
                                                  picked != _selectedDate) {
                                                setState(() {
                                                  selectedOptions[
                                                      ServiceRegistry
                                                          .userRepository
                                                          .onboardingQuestion
                                                          .value
                                                          .question] = picked
                                                      .toString();
                                                });
                                              }

                                              log('[SELECTED-OPTIONS] :: $selectedOptions');
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: AppSizes.vertical_10,
                                                horizontal:
                                                    AppSizes.horizontal_10,
                                              ),
                                              decoration: getBoxDecoration(),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  BodyText(
                                                    size: 16,
                                                    weight: FontWeight.w400,
                                                    text: selectedOptions[
                                                                ServiceRegistry
                                                                    .userRepository
                                                                    .onboardingQuestion
                                                                    .value
                                                                    .question] !=
                                                            null
                                                        ? formatDate(DateTime
                                                            .parse(selectedOptions[
                                                                ServiceRegistry
                                                                    .userRepository
                                                                    .onboardingQuestion
                                                                    .value
                                                                    .question]!))
                                                        : 'Select date',
                                                  ),
                                                  const Icon(
                                                    FluentIcons
                                                        .calendar_12_regular,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : ServiceRegistry
                                                    .userRepository
                                                    .onboardingQuestion
                                                    .value
                                                    .questionType ==
                                                'radio'
                                            ? Wrap(
                                                children: ServiceRegistry
                                                    .userRepository
                                                    .onboardingQuestion
                                                    .value
                                                    .options
                                                    .map((option) {
                                                  return InkWell(
                                                    onTap: () {
                                                      log('[OPTION] :: $option');

                                                      setState(() {
                                                        if (ServiceRegistry
                                                                .userRepository
                                                                .onboardingQuestion
                                                                .value
                                                                .question ==
                                                            'What is the average length of your menstrual cycle?') {
                                                          selectedOptions[ServiceRegistry
                                                              .userRepository
                                                              .onboardingQuestion
                                                              .value
                                                              .question] = option;
                                                          selectedOptions[
                                                                  questionIndex
                                                                      .toString()] =
                                                              option.substring(
                                                                  0, 2);
                                                        } else {
                                                          selectedOptions[ServiceRegistry
                                                              .userRepository
                                                              .onboardingQuestion
                                                              .value
                                                              .question] = option;
                                                        }
                                                      });

                                                      log('[SELECTED-OPTIONS] :: $selectedOptions');
                                                    },
                                                    overlayColor:
                                                        WidgetStateProperty.all(
                                                      Colors.transparent,
                                                    ),
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical:
                                                            AppSizes.vertical_2,
                                                        horizontal: AppSizes
                                                            .horizontal_10,
                                                      ),
                                                      margin:
                                                          const EdgeInsets.only(
                                                        bottom: AppSizes
                                                            .vertical_10,
                                                      ),
                                                      decoration:
                                                          getBoxDecoration(),
                                                      child: Row(
                                                        children: [
                                                          Radio(
                                                            value: option,
                                                            groupValue: selectedOptions[
                                                                ServiceRegistry
                                                                    .userRepository
                                                                    .onboardingQuestion
                                                                    .value
                                                                    .question],
                                                            onChanged:
                                                                (value) {},
                                                          ),
                                                          const SizedBox(
                                                              width: AppSizes
                                                                  .horizontal_10),
                                                          BodyText(
                                                            size: 16,
                                                            text: option,
                                                            weight:
                                                                FontWeight.w400,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              )
                                            : ServiceRegistry
                                                        .userRepository
                                                        .onboardingQuestion
                                                        .value
                                                        .questionType ==
                                                    'multi_choice'
                                                ? Wrap(
                                                    spacing: 8,
                                                    runSpacing: 12,
                                                    children: ServiceRegistry
                                                        .userRepository
                                                        .onboardingQuestion
                                                        .value
                                                        .options
                                                        .map((option) {
                                                      return FilterChip(
                                                        // showCheckmark: false,
                                                        checkmarkColor:
                                                            AppColors
                                                                .blackColor,
                                                        backgroundColor:
                                                            AppColors
                                                                .whiteColor,
                                                        label: SubtitleText(
                                                            text: option),
                                                        selected: multipleSelectedOptions[
                                                                    ServiceRegistry
                                                                        .userRepository
                                                                        .onboardingQuestion
                                                                        .value
                                                                        .question]
                                                                ?.contains(
                                                                    option) ??
                                                            false,
                                                        onSelected:
                                                            (isSelected) {
                                                          setState(() {
                                                            final key = ServiceRegistry
                                                                .userRepository
                                                                .onboardingQuestion
                                                                .value
                                                                .question;
                                                            final list = List<
                                                                    String>.from(
                                                                multipleSelectedOptions[
                                                                        key] ??
                                                                    <String>[]);
                                                            if (isSelected) {
                                                              if (!list
                                                                  .contains(
                                                                      option)) {
                                                                list.add(
                                                                    option);
                                                              }
                                                              multipleSelectedOptions[
                                                                  key] = list;
                                                            } else {
                                                              list.remove(
                                                                  option);
                                                              if (list
                                                                  .isEmpty) {
                                                                multipleSelectedOptions
                                                                    .remove(
                                                                        key);
                                                              } else {
                                                                multipleSelectedOptions[
                                                                    key] = list;
                                                              }
                                                            }

                                                            selectedOptions[
                                                                    key] =
                                                                jsonEncode(
                                                                    list);
                                                          });

                                                          log('[SELECTED-OPTIONS] :: $selectedOptions');
                                                        },
                                                        selectedColor: AppColors
                                                            .grayLightColor,
                                                        side: const BorderSide(
                                                          width: 1,
                                                          color: AppColors
                                                              .grayLightColor,
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  )
                                                : const SizedBox(),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  );
                },
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
                  child: Visibility(
                    visible: ServiceRegistry
                        .userRepository.onboardingQuestions.isNotEmpty,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: questionIndex > 0,
                          child: Expanded(
                            child: CustomButton(
                              text: 'Previous',
                              width: double.maxFinite,
                              height: 46,
                              fontSize: 14,
                              borderRadius: 16,
                              onTapHandler: () {
                                if (ServiceRegistry
                                    .accountService
                                    .isSubmitOnboardingQuestionsProcessing
                                    .isTrue) {
                                  return;
                                }

                                setState(() {
                                  questionIndex--;
                                });

                                ServiceRegistry.userRepository
                                        .onboardingQuestion.value =
                                    ServiceRegistry.userRepository
                                        .onboardingQuestions[questionIndex];
                              },
                              fontWeight: FontWeight.w500,
                              fontColor: AppColors.blackColor,
                              borderColor: AppColors.grayLightColor,
                              backgroundColor: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.horizontal_10),
                        Visibility(
                          visible: questionIndex <
                              ServiceRegistry.userRepository.onboardingQuestions
                                      .length -
                                  1,
                          child: Expanded(
                            child: CustomButton(
                              text: 'Next',
                              width: double.maxFinite,
                              height: 46,
                              fontSize: 14,
                              borderRadius: 16,
                              onTapHandler: () {
                                if (selectedOptions[ServiceRegistry
                                        .userRepository
                                        .onboardingQuestion
                                        .value
                                        .question] ==
                                    null) {
                                  return customErrorMessageSnackbar(
                                    title: 'Message',
                                    message:
                                        'Please select an option for this question.',
                                  );
                                } else if (questionIndex == 0 &&
                                    DateTime.now().year -
                                            DateTime.parse(selectedOptions[
                                                    'What is your birthday?']!)
                                                .year <=
                                        14) {
                                  return customErrorMessageSnackbar(
                                    title: 'Message',
                                    message:
                                        'You must be at least 16 years old.',
                                  );
                                }

                                setState(() {
                                  questionIndex++;
                                  _selectedDate = null;
                                });

                                ServiceRegistry.userRepository
                                        .onboardingQuestion.value =
                                    ServiceRegistry.userRepository
                                        .onboardingQuestions[questionIndex];
                              },
                              fontWeight: FontWeight.w500,
                              fontColor: AppColors.whiteColor,
                              backgroundColor: AppColors.blackColor,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: questionIndex ==
                              ServiceRegistry.userRepository.onboardingQuestions
                                      .length -
                                  1,
                          child: Expanded(
                            child: ServiceRegistry
                                    .accountService
                                    .isSubmitOnboardingQuestionsProcessing
                                    .isTrue
                                ? const CustomLoadingButton(
                                    height: 46,
                                    backgroundColor: AppColors.blackColor,
                                  )
                                : CustomButton(
                                    text: 'Submit',
                                    width: double.maxFinite,
                                    height: 46,
                                    fontSize: 14,
                                    borderRadius: 16,
                                    onTapHandler: () {
                                      log('[SELECTED-OPTIONS] :: $selectedOptions');

                                      RegisterPeriodTrackerDTO payload =
                                          RegisterPeriodTrackerDTO(
                                        (instance) => instance
                                          ..age = DateTime.now().year -
                                              DateTime.parse(selectedOptions[
                                                      'What is your birthday?']!)
                                                  .year
                                          ..birthControlMethods = selectedOptions[
                                              'Are you currently using any form of birth control?']
                                          ..cycleLengthDays = int.parse(
                                              selectedOptions[
                                                      'What is the average length of your menstrual cycle?']!
                                                  .substring(0, 2))
                                          ..healthConditions = selectedOptions[
                                              'Do you have any known health conditions?']
                                          ..irregularPeriods = selectedOptions[
                                                      'Do you experience regular or irregular periods?'] ==
                                                  'Regular'
                                              ? false
                                              : true
                                          ..lastPeriodStartDate =
                                              DateTime.parse(
                                            selectedOptions[
                                                'When did your last period start?']!,
                                          ).toString().substring(0, 10)
                                          ..periodLengthDays = int.parse(
                                              selectedOptions[
                                                  'How long does your period usually last (in days)?']!)
                                          ..periodSymptoms = selectedOptions[
                                              'Which symptoms do you usually experience during your period?']
                                          ..trackingOvulation = true,
                                      );

                                      log('[PAYLOAD] :: $payload');

                                      ServiceRegistry.accountService
                                          .submitOnboardingQuestionsService(
                                              payload);
                                    },
                                    fontWeight: FontWeight.w500,
                                    fontColor: AppColors.whiteColor,
                                    backgroundColor: AppColors.blackColor,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
