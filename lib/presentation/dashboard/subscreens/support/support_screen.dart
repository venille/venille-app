import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/components/cards/redirect_menu_item_card.dart';
import 'package:venille/core/utilities/appLocale.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          // padding: MediaQuery.of(context).padding,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontal_15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                TitleText(
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                  title: AppLocale.support.getString(context),
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontal_15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.vertical_5),
            const RedirectMenuItemCard(
              title: 'WhatsApp',
              prefixIcon: 'icon_whatsapp',
              suffixIcon: 'icon_redirect',
              routeTo: 'https://wa.me/+2348116947324',
            ),
            RedirectMenuItemCard(
              title: AppLocale.callUs.getString(context),
              prefixIcon: 'icon_telephone',
              suffixIcon: 'icon_redirect',
              routeTo: '+2348116947324',
            ),
          ],
        ),
      ),
    );
  }
}
