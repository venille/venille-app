import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venille/components/text/custom_text_widget.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final String icon;
  final double width;
  final double height;
  final Color fontColor;
  final double fontSize;
  final Color? borderColor;
  final double borderRadius;
  final Function onTapHandler;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final TextAlign? textAlignment;

  const CustomIconButton({
    super.key,
    this.borderColor,
    this.textAlignment,
    required this.icon,
    required this.text,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.fontColor,
    required this.fontWeight,
    required this.borderRadius,
    required this.onTapHandler,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          surfaceTintColor: backgroundColor,
          splashFactory: NoSplash.splashFactory,
          foregroundColor: AppColors.whiteColor,
          overlayColor: AppColors.grayLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
          ),
        ),
        onPressed: () => onTapHandler(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon == 'GOOGLE'
                  ? 'assets/icons/icon_google.svg'
                  : icon == 'APPLE'
                      ? 'assets/icons/icon_apple.svg'
                      : icon == 'EMAIL'
                          ? 'assets/icons/icon_email.svg'
                          : '',
              width: icon == 'APPLE' ? 26 : 22,
            ),
            const SizedBox(width: AppSizes.horizontal_5),
            CustomTextWidget(
              text: text,
              color: fontColor,
              size: fontSize,
              weight: fontWeight,
              alignment: textAlignment ?? TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
