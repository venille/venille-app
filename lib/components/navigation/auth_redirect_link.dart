import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/utilities/appLocale.dart';

class AuthRedirectLink extends StatelessWidget {
  final String routeType;
  final double fontSize;
  const AuthRedirectLink({
    super.key,
    this.routeType = 'SIGNUP',
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ROUTE TO SIGNUP SCREEN
        if (routeType == 'SIGNUP') {
          Get.toNamed(AppRoutes.signUpRoute);
        } else {
          Get.toNamed(AppRoutes.loginRoute);
        }
      },
      overlayColor: const WidgetStatePropertyAll(
        Colors.transparent,
      ),
      child: routeType == 'SIGNUP'
          ? RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppLocale.dontHaveAnAccount.getString(context),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: fontSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: AppColors.textTertiaryColor,
                        ),
                  ),
                  TextSpan(
                    text: AppLocale.signUp.getString(context),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: fontSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWarningColor,
                        ),
                  ),
                ],
              ),
            )
          : RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppLocale.alreadyHaveAnAccount.getString(context),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: fontSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: AppColors.textTertiaryColor,
                        ),
                  ),
                  TextSpan(
                    text: AppLocale.signIn.getString(context),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: fontSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWarningColor,
                        ),
                  ),
                ],
              ),
            ),
    );
  }
}
