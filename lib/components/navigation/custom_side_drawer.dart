import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/utilities/index.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/core/models/drawer_item_model.dart';
import 'package:venille/components/modals/logout_confirmation_modal.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';

class CustomDrawer extends StatefulWidget {
  final String? title;
  final Widget? headerWidget;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawer({
    super.key,
    this.title = 'Venille',
    this.headerWidget,
    required this.scaffoldKey,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void initializeProfile() {
    if (ServiceRegistry.userRepository.accountInfo.value.id == '') {
      ServiceRegistry.accountService.fetchDetailedUserAccountInfoService();
    }
  }

  @override
  void initState() {
    super.initState();

    initializeProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      width: AppSizes.screenWidth(context) * 0.70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_20,
          ),
          color: AppColors.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  widget.scaffoldKey.currentState?.closeDrawer();

                  Get.toNamed(AppRoutes.accountRoute);
                },
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                child: widget.headerWidget ??
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.vertical_10,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.grayLightColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Obx(
                        () {
                          return Row(
                            children: [
                              // const LivestocxIconBadge(size: 20),
                              Container(
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
                                    imageUrl: ServiceRegistry.userRepository
                                        .accountInfo.value.profilePhoto,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSizes.horizontal_10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: ServiceRegistry.userRepository
                                            .accountInfo.value.firstName !=
                                        '',
                                    child: SubtitleText(
                                      weight: FontWeight.w500,
                                      text: ServiceRegistry.userRepository
                                          .accountInfo.value.firstName,
                                    ),
                                  ),
                                  const TitleText(
                                    size: 16,
                                    title: 'My account',
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
              ),
              const SizedBox(height: AppSizes.vertical_10),
              ...drawerItems.map((item) => _buildDrawerItem(item)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(DrawerItem item) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.scaffoldKey.currentState?.closeDrawer();

            if (item.routeTo.isNotEmpty) {
              Get.toNamed(item.routeTo);
            } else if (item.title == 'Logout') {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    const LogoutConfirmationModal(),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontal_10,
              vertical: AppSizes.vertical_15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: item.routeTo == Get.currentRoute
                  ? AppColors.grayLightColor
                  : AppColors.whiteColor,
            ),
            child: Row(
              children: [
                item.iconData != null
                    ? Icon(
                        item.iconData,
                        size: 20,
                        color: AppColors.blackColor,
                      )
                    : Image.asset(
                        item.icon,
                        width: 19,
                        height: 19,
                        color: item.title == 'Logout'
                            ? AppColors.redColor
                            : AppColors.blackColor,
                      ),
                const SizedBox(width: AppSizes.horizontal_15),
                SubtitleText(
                  text: item.title,
                  weight: FontWeight.w500,
                  color: item.title == 'Logout'
                      ? AppColors.redColor
                      : AppColors.blackColor,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.vertical_10),
      ],
    );
  }
}
