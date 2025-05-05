import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';

class ReturnToAppbar extends StatefulWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  const ReturnToAppbar({super.key, this.title = '', this.icon, this.onTap});

  @override
  State<ReturnToAppbar> createState() => _ReturnToAppbarState();
}

class _ReturnToAppbarState extends State<ReturnToAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.amber,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          // top: AppSizes.vertical_5,
          horizontal: AppSizes.horizontal_15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBackButton(
              callBackFunction: () {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
            ),
            TitleText(
              size: 16,
              title: widget.title,
            ),
            const SizedBox(width: AppSizes.horizontal_35),
          ],
        ),
      ),
    );
  }
}
