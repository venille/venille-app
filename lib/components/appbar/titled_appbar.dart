import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/profile_appbar.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class TitledAppbar extends StatelessWidget {
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TitledAppbar(
      {super.key, required this.title, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(
          top: AppSizes.vertical_5,
          left: AppSizes.horizontal_15,
          right: AppSizes.horizontal_15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: const Center(
                    child: Icon(
                      FluentIcons.navigation_16_filled,
                      // color: AppColors.greenColor,
                    ),
                  ),
                ),
                TitleText(
                  size: 18,
                  title: title.tr,
                ),
                const SizedBox(width: AppSizes.horizontal_25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
