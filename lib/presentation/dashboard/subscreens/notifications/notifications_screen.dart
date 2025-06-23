import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/cards/notification_card.dart';
import 'package:venille/components/skeletons/loading_animation.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/skeletons/empty_results_content.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxBool fetchingPaginatedData = false.obs;
  ScrollController scrollController = ScrollController();

  Future<void> initializeNotifications() async {
    ServiceRegistry.accountService.fetchNotificationsService(page: 1);
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(_scrollHandler);

    initializeNotifications();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollHandler);

    super.dispose();
  }

  void _scrollHandler() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      fetchingPaginatedData.value = true;

      if (ServiceRegistry.userRepository.notificationsHasNextPage.value ==
          true) {
        await ServiceRegistry.accountService.fetchNotificationsService(
          page:
              ServiceRegistry.userRepository.notificationsCurrentPage.value + 1,
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
      key: scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Notifications',
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: initializeNotifications,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontal_15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ServiceRegistry.userRepository.notifications.isEmpty
                            ? const EmptyResultsContent(
                                displayType: 'NOTIFICATIONS',
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ServiceRegistry
                                    .userRepository.notifications.length,
                                itemBuilder: (context, index) {
                                  return NotificationCard(
                                    notification: ServiceRegistry
                                        .userRepository.notifications[index],
                                  );
                                },
                              ),
                        ServiceRegistry.userRepository.notificationsHasNextPage
                                        .value ==
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
    );
  }
}
