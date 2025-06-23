import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/cards/menstrual_phase_description_card.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';

class MenstrualPhaseDescriptionScreen extends StatefulWidget {
  const MenstrualPhaseDescriptionScreen({super.key});

  @override
  State<MenstrualPhaseDescriptionScreen> createState() =>
      _MenstrualPhaseDescriptionScreenState();
}

class _MenstrualPhaseDescriptionScreenState
    extends State<MenstrualPhaseDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: ReturnToAppbar(
            title:
                ServiceRegistry.userRepository.menstrualPhaseInfo.value.title,
            onTap: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CachedNetworkImageWidget(
                  height: 150,
                  width: 160,
                  imageUrl: ServiceRegistry
                      .userRepository.menstrualPhaseInfo.value.coverPhoto,
                ),
              ),
              const SizedBox(height: AppSizes.vertical_20),
              ...ServiceRegistry
                  .userRepository.menstrualPhaseInfo.value.descriptions
                  .map(
                (description) => MenstrualPhaseDescriptionCard(
                  description: description,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
