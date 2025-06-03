import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/data/infra_sdk/engagement/lib/engagement_sdk.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';

class ForumPostCard extends StatelessWidget {
  final ForumInfo forumPost;
  const ForumPostCard({super.key, required this.forumPost});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ServiceRegistry.userRepository.forumPost.value = forumPost;

        Get.toNamed(AppRoutes.forumDescriptionRoute);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   color: AppColors.grayLightColor,
          // ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
              color: AppColors.grayLightColor.withOpacity(0.8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppSizes.vertical_5,
                left: AppSizes.horizontal_15,
                right: AppSizes.horizontal_15,
              ),
              child: Row(
                children: [
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
                        imageUrl: forumPost.authorPhoto,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timeago.format(forumPost.createdAt),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     forumPost.title,
            //     style: const TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.horizontal_15,
                right: AppSizes.horizontal_15,
                bottom: AppSizes.vertical_5,
              ),
              child: Text(
                forumPost.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (forumPost.image.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImageWidget(
                    height: 200,
                    width: double.maxFinite,
                    imageUrl: forumPost.image,
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Obx(
                    () => InkWell(
                      onTap: () {
                        ServiceRegistry.engagementService
                            .likeUnlikeForumPostService(
                          forumId: int.parse(forumPost.id),
                        );
                      },
                      child: Icon(
                        forumPost.likes.contains(
                          int.parse(ServiceRegistry
                              .userRepository.accountInfo.value.id),
                        )
                            ? FluentIcons.heart_circle_16_regular
                            : FluentIcons.heart_circle_16_regular,
                        size: 24,
                        color: forumPost.likes.contains(
                          int.parse(ServiceRegistry
                              .userRepository.accountInfo.value.id),
                        )
                            ? AppColors.redColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${forumPost.likeCount}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    FluentIcons.chat_20_regular,
                    size: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${forumPost.comments}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
