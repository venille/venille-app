import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class CustomShareButton extends StatelessWidget {
  final Color? backgroundColor;
  final Function callBackFunction;
  const CustomShareButton({
    super.key,
    this.backgroundColor,
    required this.callBackFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callBackFunction(),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        child: Icon(
          FluentIcons.share_ios_20_regular,
          size: 20,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
