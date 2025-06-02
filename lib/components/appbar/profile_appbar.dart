import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_support_button.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';
import 'package:venille/components/modals/update_profile_avatar_bottom_modal.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(
          top: AppSizes.vertical_10,
          left: AppSizes.horizontal_15,
          right: AppSizes.horizontal_15,
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    callBackFunction: () {
                      Get.until((route) =>
                          route.settings.name == AppRoutes.dashboardRoute);
                    },
                  ),
                  const TitleText(
                    size: 16,
                    title: 'Account',
                  ),
                  const SizedBox(width: AppSizes.horizontal_35),
                ],
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        log('[OPEN-UPDATE-PROFILE-AVATAR-MODAL]');

                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return const UpdateProfileAvatarBottomModal();
                          },
                        );
                      },
                      overlayColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 2,
                            color: AppColors.grayLightColor,
                          ),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImageWidget(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            imageUrl: ServiceRegistry
                                .userRepository.accountInfo.value.profilePhoto,
                            errorAssetImage: 'assets/images/default.jpg',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                    // const CustomSupportButton(),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.vertical_8),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(
                          size: 18,
                          // title: '',
                          title:
                              '${ServiceRegistry.userRepository.accountInfo.value.firstName} ${ServiceRegistry.userRepository.accountInfo.value.lastName}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
