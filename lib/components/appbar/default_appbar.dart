import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/buttons/custom_notification_button.dart';

class DefaultAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DefaultAppBar({super.key, required this.scaffoldKey});

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      padding: const EdgeInsets.only(
        bottom: AppSizes.vertical_5,
        left: AppSizes.horizontal_10,
        right: AppSizes.horizontal_10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (ServiceRegistry.localStorage
                            .read(LocalStorageSecrets.authenticationMethod) ==
                        'GUEST') {
                      return;
                    }

                    widget.scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Row(
                    children: [
                      Icon(
                        FluentIcons.navigation_16_filled,
                        color: AppColors.blueLightColor,
                      ),
                      SizedBox(width: 5),
                      TitleText(
                        size: 26,
                        title: 'Venille',
                        letterSpacing: 1.3,
                        fontFamily: 'Pacifico',
                        color: AppColors.blueLightColor,
                      ),
                    ],
                  ),
                ),
                const CustomNotificationButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
