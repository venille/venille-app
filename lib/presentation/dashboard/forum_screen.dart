import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/skeletons/insecure_dashboard_content.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:venille/components/cards/forum_post_card.dart';
import 'package:venille/components/skeletons/loading_animation.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/skeletons/empty_results_content.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  RxBool fetchingPaginatedData = false.obs;
  ScrollController scrollController = ScrollController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> initializeForumPosts() async {
    if (ServiceRegistry.localStorage
            .read(LocalStorageSecrets.authenticationMethod) ==
        'GUEST') {
      return;
    }

    ServiceRegistry.engagementService.fetchForumPostsService(
      currentPage: 1,
    );
  }

  @override
  void initState() {
    super.initState();

    ServiceRegistry.engagementService.fetchForumPostsService(currentPage: 1);
    scrollController.addListener(_scrollHandler);
  }

  void _scrollHandler() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      fetchingPaginatedData.value = true;

      if (ServiceRegistry.userRepository.forumPostsHasNextPage.value == true) {
        await ServiceRegistry.engagementService.fetchForumPostsService(
          currentPage:
              ServiceRegistry.userRepository.forumPostsCurrentPage.value + 1,
        );

        fetchingPaginatedData.value = false;
      }

      fetchingPaginatedData.value = false;

      debugPrint('[END-OF-CONTENT]');
      debugPrint('[CONFIGURE-PAGINATION]');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      key: scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: TitledAppbar(
          title: 'Forum',
          scaffoldKey: scaffoldKey,
        ),
      ),
      floatingActionButton: ServiceRegistry.localStorage
                  .read(LocalStorageSecrets.authenticationMethod) ==
              'GUEST'
          ? null
          : FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              backgroundColor: AppColors.grayColor,
              foregroundColor: AppColors.whiteColor,
              onPressed: () {
                if (ServiceRegistry.localStorage
                        .read(LocalStorageSecrets.authenticationMethod) ==
                    'GUEST') {
                  Get.toNamed(AppRoutes.loginRoute);
                }

                Get.toNamed(AppRoutes.createForumPostRoute);
              },
              child: const Icon(Icons.add),
            ),
      body: RefreshIndicator(
        onRefresh: initializeForumPosts,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontal_15,
                  ),
                  child: ServiceRegistry.localStorage
                              .read(LocalStorageSecrets.authenticationMethod) ==
                          'GUEST'
                      ? const InsecureDashboardContent()
                      : Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ServiceRegistry.userRepository.forumPosts.isEmpty
                                  ? const EmptyResultsContent(
                                      displayType: 'FORUM_POSTS',
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: ServiceRegistry
                                          .userRepository.forumPosts.length,
                                      itemBuilder: (context, index) {
                                        return ForumPostCard(
                                          forumPost: ServiceRegistry
                                              .userRepository.forumPosts[index],
                                        );
                                      },
                                    ),
                              ServiceRegistry.userRepository
                                              .forumPostsHasNextPage.value ==
                                          true &&
                                      fetchingPaginatedData.value
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: LoadingAnimation(
                                          type: "newtonCradle",
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(height: AppSizes.vertical_40),
                            ],
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (int value) {
          ServiceRegistry.commonRepository.currentScreenIndex.value = value;
        },
        currentPage: ServiceRegistry.commonRepository.currentScreenIndex.value,
      ),
    );
  }
}
