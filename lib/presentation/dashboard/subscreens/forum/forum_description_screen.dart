import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/small_text.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/engagement/lib/engagement_sdk.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';

class ForumDescriptionScreen extends StatefulWidget {
  const ForumDescriptionScreen({
    super.key,
  });

  @override
  State<ForumDescriptionScreen> createState() => _ForumDescriptionScreenState();
}

class _ForumDescriptionScreenState extends State<ForumDescriptionScreen> {
  final FocusNode _commentFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  final TextEditingController _commentController = TextEditingController();

  final RxBool showOriginal = false.obs;
///////////////
  Future<void> fetchForumPostComments() async {
    ServiceRegistry.engagementService.fetchForumCommentsService(
      currentPage: 1,
      forumId: int.parse(ServiceRegistry.userRepository.forumPost.value.id),
    );
  }

  @override
  void dispose() {
    _commentFocusNode.dispose();
    _commentController.dispose();

    fetchForumPostComments();

    super.dispose();
  }

  void _submitComment() {
    if (ServiceRegistry.engagementService.isAddForumCommentProcessing.isTrue) {
      return;
    } else if (_commentController.text.trim().isEmpty) {
      return customErrorMessageSnackbar(
        title: AppLocale.message.getString(context),
        message: AppLocale.pleaseEnterComment.getString(context),
      );
    } else {
      CreateForumCommentDto payload = CreateForumCommentDto(
        (instance) => instance..content = _commentController.text.trim(),
      );

      ServiceRegistry.engagementService.addForumCommentService(
        payload: payload,
        focusNode: _commentFocusNode,
        commentController: _commentController,
        forumId: int.parse(ServiceRegistry.userRepository.forumPost.value.id),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ServiceRegistry.userRepository.forumPostComments.clear();

        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: ReturnToAppbar(
              title: AppLocale.forumPost.getString(context),
              onTap: () {
                ServiceRegistry.userRepository.forumPostComments.clear();

                Get.back();
              }),
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontal_15,
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: AppSizes.horizontal_5,
                      right: AppSizes.horizontal_5,
                      top: AppSizes.vertical_5,
                    ),
                    color: AppColors.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
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
                                    imageUrl: ServiceRegistry.userRepository
                                        .forumPost.value.authorPhoto,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    timeago.format(ServiceRegistry
                                        .userRepository
                                        .forumPost
                                        .value
                                        .createdAt),
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
                        const SizedBox(height: AppSizes.vertical_10),
                        SubtitleText(
                          text: ServiceRegistry
                              .userRepository.forumPost.value.description,
                        ),

                        //TODO: Add a button to translate the post description
                        Visibility(
                          visible: Get.locale?.languageCode != 'en',
                          child: InkWell(
                            onTap: () {
                              ServiceRegistry.engagementService
                                  .translateForumPostDescriptionService(
                                updateLocalState: () {
                                  showOriginal.value = !showOriginal.value;
                                },
                                text: ServiceRegistry
                                    .userRepository.forumPost.value.description,
                                postId: ServiceRegistry
                                    .userRepository.forumPost.value.id,
                                sourceLanguage: showOriginal.isFalse
                                    ? 'en'
                                    : '${Get.locale?.languageCode}',
                                targetLanguage: showOriginal.isFalse
                                    ? '${Get.locale?.languageCode}'
                                    : 'en',
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSizes.vertical_10,
                              ),
                              child: BodyText(
                                  weight: FontWeight.w600,
                                  text:
                                      'Show ${showOriginal.isFalse ? AppLocale.translation.getString(context) : AppLocale.original.getString(context)}'),
                            ),
                          ),
                        ),

                        if (ServiceRegistry
                            .userRepository.forumPost.value.image.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: ClipRRect(
                              // borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImageWidget(
                                height: 250,
                                width: double.maxFinite,
                                imageUrl: ServiceRegistry
                                    .userRepository.forumPost.value.image,
                              ),
                            ),
                          ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  ServiceRegistry.engagementService
                                      .likeUnlikeForumPostService(
                                    forumId: int.parse(ServiceRegistry
                                        .userRepository.forumPost.value.id),
                                  );
                                },
                                child: Icon(
                                  ServiceRegistry
                                          .userRepository.forumPost.value.likes
                                          .contains(
                                    int.parse(ServiceRegistry
                                        .userRepository.accountInfo.value.id),
                                  )
                                      ? FluentIcons.heart_circle_16_regular
                                      : FluentIcons.heart_circle_16_regular,
                                  size: 24,
                                  color: ServiceRegistry
                                          .userRepository.forumPost.value.likes
                                          .contains(
                                    int.parse(ServiceRegistry
                                        .userRepository.accountInfo.value.id),
                                  )
                                      ? AppColors.redColor
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${ServiceRegistry.userRepository.forumPost.value.likeCount}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 24),
                              const Icon(Icons.chat_bubble_outline,
                                  size: 24, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                '${ServiceRegistry.userRepository.forumPost.value.comments}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSizes.horizontal_5),
                        // Comments section
                        if (ServiceRegistry
                            .userRepository.forumPostComments.isNotEmpty) ...[
                          TitleText(
                            title: AppLocale.comments.getString(context),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: ServiceRegistry
                                .userRepository.forumPostComments.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSizes.vertical_10,
                                  horizontal: AppSizes.horizontal_10,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      index == 0 ? 12 : 0,
                                    ),
                                    topRight: Radius.circular(
                                      index == 0 ? 12 : 0,
                                    ),
                                    bottomLeft: Radius.circular(
                                      index ==
                                              ServiceRegistry
                                                      .userRepository
                                                      .forumPostComments
                                                      .length -
                                                  1
                                          ? 12
                                          : 0,
                                    ),
                                    bottomRight: Radius.circular(
                                      index ==
                                              ServiceRegistry
                                                      .userRepository
                                                      .forumPostComments
                                                      .length -
                                                  1
                                          ? 12
                                          : 0,
                                    ),
                                  ),
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: AppColors.grayLightColor
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                              .userRepository
                                              .forumPostComments[index]
                                              .authorPhoto,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SmallText(
                                            weight: FontWeight.bold,
                                            text: timeago.format(
                                              ServiceRegistry
                                                  .userRepository
                                                  .forumPostComments[index]
                                                  .createdAt,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          SubtitleText(
                                            text: ServiceRegistry
                                                .userRepository
                                                .forumPostComments[index]
                                                .content,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                        // Add some bottom padding for better spacing
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontal_15,
                  vertical: AppSizes.vertical_10,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border(
                    top: BorderSide(
                      color: AppColors.grayLightColor,
                      width: 1,
                    ),
                  ),
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          focusNode: _commentFocusNode,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: AppLocale.addComment.getString(context),
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(
                                color: AppColors.grayLightColor,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(
                                color: AppColors.grayLightColor,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(
                                color: AppColors.grayLightColor,
                                width: 1,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _submitComment(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: ServiceRegistry.engagementService
                                  .isAddForumCommentProcessing.isTrue
                              ? AppColors.grayColor
                              : AppColors.blackColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: IconButton(
                          onPressed: ServiceRegistry.engagementService
                                  .isAddForumCommentProcessing.isTrue
                              ? null
                              : _submitComment,
                          icon: ServiceRegistry.engagementService
                                  .isAddForumCommentProcessing.isTrue
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 20,
                                ),
                          // padding: const EdgeInsets.all(12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
