import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:venille/presentation/public/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initializeTimeOut() async {
    await Future.delayed(const Duration(milliseconds: 1800));

    if (ServiceRegistry.localStorage.read(LocalStorageSecrets.accessToken) !=
        null) {
      ServiceRegistry.commonRepository.currentScreenIndex.value = 0;

      Get.toNamed(AppRoutes.dashboardRoute);
    } else {
      Get.to(
        transition: Transition.fade,
        duration: const Duration(milliseconds: 600),
        // () => const LoginScreen(),
        () => const OnboardingScreen(),
      );
    }
  }

  @override
  void initState() {
    initializeTimeOut();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            width: AppSizes.screenWidth(context),
            height: AppSizes.screenHeight(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  'assets/images/image_background.jpg',
                ),
                fit: AppSizes.screenWidth(context) > 600 ? BoxFit.cover : null,
              ),
            ),
          ),
        ),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 1200)),
                      SlideEffect(
                        end: Offset(0, 0),
                        begin: Offset(0, -0.3),
                        duration: Duration(milliseconds: 750),
                      ),
                    ],
                    child: Image.asset(
                      'assets/logo.jpg',
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
