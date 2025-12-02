import 'dart:io';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/components/text/large_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_button.dart';

class AppUpdateScreen extends StatefulWidget {
  const AppUpdateScreen({super.key});

  @override
  State<AppUpdateScreen> createState() => _AppUpdateScreenState();
}

class _AppUpdateScreenState extends State<AppUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        return Future.value();
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: AppSizes.screenHeight(context),
            height: AppSizes.screenHeight(context),
            padding: EdgeInsets.only(
              left: AppSizes.horizontal_15,
              right: AppSizes.horizontal_15,
              bottom: Platform.isAndroid
                  ? AppSizes.vertical_10
                  : AppSizes.horizontal_20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(height: AppSizes.vertical_30),
                    Container(
                      height: 220,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 1,
                            color: AppColors.grayLightColor,
                            offset: Offset(0, 4),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/image_update_app.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.vertical_30),
                    Center(
                      child: TitleText(
                        size: 18,
                        alignment: TextAlign.center,
                        title: "We have an app update for you",
                      ),
                    ),
                    Center(
                      child: LargeText(
                        alignment: TextAlign.center,
                        text:
                            "We've made the app even better! Update now to enjoy a more seamless experience.",
                      ),
                    ),
                    const SizedBox(height: AppSizes.vertical_30),
                    Center(
                      child: Image.asset(
                        'assets/icons/icon_${Platform.isAndroid ? 'playstore' : 'appstore'}.png',
                        width: Platform.isAndroid ? 60 : 50,
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  height: 56,
                  fontSize: 16,
                  borderRadius: 16,
                  text: "Upgrade Now",
                  width: double.maxFinite,
                  fontWeight: FontWeight.w500,
                  fontColor: AppColors.whiteColor,
                  backgroundColor: AppColors.buttonPrimaryColor,
                  onTapHandler: () {
                    if (Platform.isIOS) {
                      launchExternalBrowserUrl(
                        dotenv.env['APP_LINK_IOS']!,
                      );
                    } else if (Platform.isAndroid) {
                      launchExternalBrowserUrl(
                        dotenv.env['APP_LINK_ANDROID']!,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
