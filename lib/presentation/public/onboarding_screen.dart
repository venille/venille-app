import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/utilities/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_button.dart';

import 'package:venille/main.dart';
import 'package:venille/language_selector/languageSelectionScreen.dart';

GetStorage localStorage = GetStorage();

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPageIndex = 0;
  PageController pageController = PageController();

  void initializeAuth() async {
    await Future.delayed(const Duration(milliseconds: 80));

    if (localStorage.read(LocalStorageSecrets.accessToken) != null) {
      Get.toNamed(AppRoutes.dashboardRoute);
    }
  }

  @override
  void initState() {
    super.initState();

    initializeAuth();

    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page?.round() ?? 0;
      });
    });
  }

  // @override
  // void dispose() {
  //   currentPageIndex = 0;

  //   pageController.jumpTo(0);

  //   pageController.dispose();

  //   super.dispose();
  // }

  void handleNextRouteNavigation() async {
    Get.toNamed(AppRoutes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        return Future.value();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: PageView.builder(
          itemCount: onboardingItems.length,
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    '${onboardingItems[index].image}',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    // color: Colors.black.withOpacity(
                    //   0.3,
                    // ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.blackColor
                              .withOpacity(0), // fade to transparent
                          AppColors.blackColor
                              .withOpacity(0.6), // darker at bottom
                        ],
                        // stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/icon_venille_clif.png',
                          width: 60,
                        ),
                        Builder(
                          builder: (context) {
                            return const LanguageSelectorDropdown();
                          },
                        ),
                        // const LanguageSelectorDropdown(),
                        Visibility(
                          visible: index == 0,
                          child: CustomButton(
                            text: 'Skip',
                            width: 85,
                            height: 35,
                            fontSize: 12,
                            borderRadius: 100,
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.whiteColor,
                            borderColor: AppColors.whiteColor,
                            backgroundColor: Colors.transparent,
                            onTapHandler: handleNextRouteNavigation,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    // color: Colors.red,
                    height: screenHeight * 0.58,
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                onboardingItems.length,
                                (index) => Container(
                                  width: index == currentPageIndex ? 50 : 10,
                                  height: 10,
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSizes.vertical_10),
                            TitleText(
                              title: onboardingItems[index].title1!,
                              size: 40,
                              color: AppColors.whiteColor,
                            ),
                            TitleText(
                              title: onboardingItems[index].title2!,
                              size: 40,
                              color: AppColors.whiteColor,
                            ),
                            const SizedBox(height: AppSizes.vertical_70),
                          ],
                        ),
                        CustomButton(
                          text: currentPageIndex == 0 ? 'Next' : 'Continue',
                          width: double.maxFinite,
                          height: 56,
                          fontSize: 16,
                          borderRadius: 15,
                          onTapHandler: () {
                            if (currentPageIndex != 1) {
                              pageController.nextPage(
                                curve: Curves.easeInCubic,
                                duration: const Duration(milliseconds: 500),
                              );
                            } else {
                              handleNextRouteNavigation();
                            }
                          },
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.blackColor,
                          backgroundColor: AppColors.backgroundColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
