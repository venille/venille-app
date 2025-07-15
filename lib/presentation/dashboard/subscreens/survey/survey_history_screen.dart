import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/cards/survey_history_item_card.dart';
import 'package:venille/components/skeletons/empty_results_content.dart';
import 'package:venille/core/utilities/appLocale.dart';

class SurveyHistoryScreen extends StatefulWidget {
  const SurveyHistoryScreen({super.key});

  @override
  State<SurveyHistoryScreen> createState() => _SurveyHistoryScreenState();
}

class _SurveyHistoryScreenState extends State<SurveyHistoryScreen> {
  RxBool fetchingPaginatedData = false.obs;

  ScrollController scrollController = ScrollController();

  Future<void> initializeSurveyHistory() async {
    await ServiceRegistry.accountService.fetchSurveyHistoryService(
      currentPage: 1,
    );
  }

  @override
  void initState() {
    super.initState();

    initializeSurveyHistory();
    scrollController.addListener(_scrollHandler);
  }

  void _scrollHandler() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      fetchingPaginatedData.value = true;

      if (ServiceRegistry.userRepository.surveyHistoryHasNextPage.value ==
          true) {
        await ServiceRegistry.accountService.fetchSurveyHistoryService(
          currentPage:
              ServiceRegistry.userRepository.surveyHistoryCurrentPage.value + 1,
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: AppLocale.surveyHistory.getString(context),
          onTap: () {
            Get.back();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        foregroundColor: AppColors.whiteColor,
        onPressed: () {
          Get.toNamed(AppRoutes.registerSurveyRoute);
        },
        child: const Icon(FluentIcons.add_16_regular),
      ),
      body: RefreshIndicator(
        onRefresh: initializeSurveyHistory,
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
                        ServiceRegistry.userRepository.surveyHistory.isEmpty
                            ? const EmptyResultsContent(
                                displayType: 'SURVEY_HISTORY',
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ServiceRegistry
                                    .userRepository.surveyHistory.length,
                                itemBuilder: (_, index) {
                                  return SurveyHistoryItemCard(
                                    surveyInfo: ServiceRegistry
                                        .userRepository.surveyHistory[index],
                                  );
                                },
                              ),
                        const SizedBox(height: AppSizes.vertical_50),
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
