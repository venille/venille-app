import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/core/constants/routes.dart';

class CustomSupportButton extends StatelessWidget {
  final Function? onTapHandler;
  const CustomSupportButton({super.key, this.onTapHandler});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('[REDIRECT-TO -> SUPPORT_SCREEN_ROUTE]');

        // Get.toNamed(AppRoutes.supportRoute);

        // launchExternalBrowserUrl(
        //   'https://wa.me/+2347076366208',
        // );

        // onTapHandler();
      },
      overlayColor: WidgetStateProperty.all(
        Colors.transparent,
      ),
      child: Image.asset(
        'assets/icons/icon_support.png',
        width: 22,
      ),
    );
  }
}
