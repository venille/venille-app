import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/components/skeletons/insecure_dashboard_content.dart';
import 'package:venille/components/skeletons/loading_animation.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/default_appbar.dart';
import 'package:venille/components/cards/period_tracker_card.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/sections/daily_insights_section.dart';
import 'package:venille/components/sections/menstrual_phases_section.dart';
import 'package:venille/components/sections/last_period_summary_section.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';
import 'package:venille/core/utilities/appLocale.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();

  Future<void> initializeDashboardInfo() async {
    if (ServiceRegistry.localStorage
            .read(LocalStorageSecrets.authenticationMethod) ==
        'GUEST') {
      return;
    }

    Future.wait([
      ServiceRegistry.periodTrackerService.fetchDashboardInfoService(),
      ServiceRegistry.accountService.fetchNotificationsService(page: 1),
      ServiceRegistry.accountService.fetchDetailedUserAccountInfoService(),
      ServiceRegistry.periodTrackerService.fetchPeriodTrackerHistoryService(),
    ]);
  }

  @override
  void initState() {
    super.initState();

    initializeDashboardInfo();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        return Future.value();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        key: scaffoldKey,
        drawer: CustomDrawer(scaffoldKey: scaffoldKey),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: DefaultAppBar(scaffoldKey: scaffoldKey),
        ),
        body: RefreshIndicator(
          onRefresh: initializeDashboardInfo,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: ServiceRegistry.localStorage
                              .read(LocalStorageSecrets.authenticationMethod) ==
                          'GUEST'
                      ? const InsecureDashboardContent()
                      : Obx(
                          () => ServiceRegistry.userRepository
                                  .periodTrackerHistory.value.years.isEmpty
                              ? SizedBox(
                                  height: 400,
                                  width: double.maxFinite,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const LoadingAnimation(
                                        type: "beat",
                                        color: AppColors.pinkColor,
                                      ),
                                      const SizedBox(
                                          height: AppSizes.vertical_20),
                                      BodyText(
                                        text: AppLocale.buildingYourPeriodTracker.getString(context),
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PeriodTrackerCard(),
                                      SizedBox(height: AppSizes.vertical_10),
                                      DailyInsightsSection(),
                                      SizedBox(height: AppSizes.vertical_20),
                                      LastPeriodSummarySection(),
                                      SizedBox(height: AppSizes.vertical_20),
                                      MenstrualPhasesSection(),
                                      SizedBox(height: AppSizes.vertical_40),
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
          currentPage:
              ServiceRegistry.commonRepository.currentScreenIndex.value,
        ),
      ),
    );
  }
}
