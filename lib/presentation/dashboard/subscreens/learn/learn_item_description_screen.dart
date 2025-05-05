import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/core/models/health_education_topic_model.dart';

class LearnItemDescriptionScreen extends StatefulWidget {
  final HealthEducationTopicModel healthItem;
  const LearnItemDescriptionScreen({super.key, required this.healthItem});

  @override
  State<LearnItemDescriptionScreen> createState() =>
      _LearnItemDescriptionScreenState();
}

class _LearnItemDescriptionScreenState
    extends State<LearnItemDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Container(
          // color: Colors.amber,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            // top: AppSizes.vertical_5,
            horizontal: AppSizes.horizontal_15,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.healthItem.coverImageUrl),
              fit: BoxFit.cover,
            ),
            border: const Border(
              bottom: BorderSide(color: AppColors.grayLightColor),
            ),
          ),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomBackButton(
                  callBackFunction: () {
                    Get.back();
                  },
                  backgroundColor: AppColors.whiteColor,
                ),
                const TitleText(
                  size: 16,
                  title: '',
                ),
                const SizedBox(width: AppSizes.horizontal_35),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TitleText(
                title: widget.healthItem.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.healthItem.description),
            ),
          ],
        ),
      ),
    );
  }
}
