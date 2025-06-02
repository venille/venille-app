import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:venille/components/cards/course_card.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/skeletons/empty_results_content.dart';
import 'package:venille/components/skeletons/loading_animation.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';
import 'package:venille/core/utilities/index.dart';
import 'package:venille/presentation/dashboard/subscreens/course/course_description_screen.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  RxBool fetchingPaginatedData = false.obs;
  ScrollController scrollController = ScrollController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> initializeCourses() async {
    ServiceRegistry.engagementService.fetchCoursesService(
      currentPage: 1,
    );
  }

  @override
  void initState() {
    super.initState();

    ServiceRegistry.engagementService.fetchCoursesService(currentPage: 1);
    scrollController.addListener(_scrollHandler);
  }

  void _scrollHandler() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      fetchingPaginatedData.value = true;

      if (ServiceRegistry.userRepository.coursesHasNextPage.value == true) {
        await ServiceRegistry.engagementService.fetchCoursesService(
          currentPage:
              ServiceRegistry.userRepository.coursesCurrentPage.value + 1,
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
          title: 'Learn',
          scaffoldKey: scaffoldKey,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: initializeCourses,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.only(
                      left: AppSizes.horizontal_15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ServiceRegistry.userRepository.courseCategories.isEmpty
                            ? const EmptyResultsContent(
                                displayType: 'COURSES',
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ServiceRegistry
                                    .userRepository.courseCategories.length,
                                itemBuilder: (context, index) {
                                  final category = ServiceRegistry
                                      .userRepository.courseCategories[index];

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: AppSizes.vertical_10,
                                        ),
                                        child: SubtitleText(
                                          text: category.title,
                                          size: 18,
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        height: 250,
                                        width: double.maxFinite,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          // physics:
                                          //     const NeverScrollableScrollPhysics(),
                                          itemCount: category.courses.length,
                                          itemBuilder: (context, courseIndex) {
                                            return CourseCard(
                                              course:
                                                  category.courses[courseIndex],
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                          height: AppSizes.vertical_20),
                                    ],
                                  );
                                },
                              ),
                        ServiceRegistry.userRepository.forumPostsHasNextPage
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
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (int value) {
          ServiceRegistry.commonRepository.currentScreenIndex.value = value;
        },
        currentPage: ServiceRegistry.commonRepository.currentScreenIndex.value,
      ),
    );
  }
}
