// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/presentation/dashboard/home_screen.dart';
import 'package:venille/presentation/dashboard/learn_screen.dart';
import 'package:venille/presentation/dashboard/forum_screen.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/presentation/dashboard/tracker_screen.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/presentation/dashboard/venille_ai_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? currentBackPressTime;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> screens = [
    const HomeScreen(),
    const TrackerScreen(),
    const VenilleAiScreen(),
    const LearnScreen(),
    const ForumScreen(),
  ];

  void initializeAppInfo() {
    Future.wait([
      ServiceRegistry.periodTrackerService.fetchDashboardInfoService(),
      ServiceRegistry.accountService.fetchOnboardingQuestionsService(),
      ServiceRegistry.accountService.fetchNotificationsService(page: 1),
      ServiceRegistry.accountService.fetchDetailedUserAccountInfoService(),
      ServiceRegistry.engagementService.fetchCoursesService(currentPage: 1),
      ServiceRegistry.engagementService.fetchForumPostsService(currentPage: 1),
    ]);
  }

  void initializeCoreServices() async {
    await Future.delayed(const Duration(seconds: 6));

    ServiceRegistry.firebaseNotificationService.init(context);
  }

  @override
  initState() {
    initializeAppInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WillPopScope(
        onWillPop: () async {
          if (ServiceRegistry.localStorage
                      .read(LocalStorageSecrets.accessToken) !=
                  null &&
              ServiceRegistry.localStorage
                      .read(LocalStorageSecrets.authenticationMethod) ==
                  'SECURE') {
            if (currentBackPressTime == null ||
                DateTime.now().difference(currentBackPressTime!) >
                    const Duration(seconds: 2)) {
              // First press
              currentBackPressTime = DateTime.now();

              customErrorMessageSnackbar(
                title: 'Message',
                message: 'Press back again to exit',
              );

              return false;
            }

            SystemNavigator.pop();

            return false;
          } else {
            Get.toNamed(AppRoutes.loginRoute);

            return false;
          }
        },
        child: Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(scaffoldKey: scaffoldKey),
          body: screens[
              ServiceRegistry.commonRepository.currentScreenIndex.value],
        ),
      );
    });
  }
}
