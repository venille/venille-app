import 'dart:io';
import 'package:flutter/material.dart';
import 'package:venille/components/text/small_text.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/middlewares/index.dart';

class AuthBottomNavigationBanner extends StatefulWidget {
  const AuthBottomNavigationBanner({super.key});

  @override
  State<AuthBottomNavigationBanner> createState() =>
      _AuthBottomNavigationBannerState();
}

class _AuthBottomNavigationBannerState
    extends State<AuthBottomNavigationBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 65 : 50,
      padding: EdgeInsets.only(
        left: AppSizes.horizontal_10,
        right: AppSizes.horizontal_10,
        bottom: Platform.isIOS ? AppSizes.vertical_15 : 0,
      ),
      // color: Colors.red,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SmallText(
            // maxLines: 10,
            text: 'By continuing, you automatically accept our ',
          ),
          InkWell(
            onTap: () {
              launchExternalBrowserUrl(
                  'https://venille.com.ng/terms-of-service');
            },
            overlayColor: WidgetStateProperty.all(
              Colors.transparent,
            ),
            child: SmallText(
              // maxLines: 10,
              weight: FontWeight.bold,
              text: 'Terms & Conditions ',
            ),
          ),
          SmallText(
            // maxLines: 10,
            text: 'and ',
          ),
          InkWell(
            onTap: () {
              launchExternalBrowserUrl('https://venille.com.ng/privacy-policy');
            },
            overlayColor: WidgetStateProperty.all(
              Colors.transparent,
            ),
            child: SmallText(
              // maxLines: 10,
              weight: FontWeight.bold,
              text: 'Privacy Policy.',
            ),
          ),
        ],
      ),
    );
  }
}
