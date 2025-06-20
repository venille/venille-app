// ignore_for_file: library_prefixes
import 'package:get/get.dart';
import 'package:built_collection/built_collection.dart';
import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart' as AuthSdk;
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart'
    as AccountSdk;
import 'package:venille/data/infra_sdk/engagement/lib/engagement_sdk.dart'
    as EngagementSdk;
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart'
    as PeriodTrackerSdk;

class UserRepository extends GetxController {
  Rx<AccountSdk.AccountInfo> accountInfo = AccountSdk.AccountInfo(
    (account) => account
      ..id = '0'
      ..firstName = ''
      ..lastName = ''
      ..phone = ''
      ..email = ''
      ..state = ''
      ..stateArea = ''
      ..isOnboardingUploaded = false
      ..accountType = AccountSdk.AccountInfoAccountTypeEnum.individual
      ..status = AccountSdk.AccountInfoStatusEnum.active
      ..profilePhoto =
          'https://medexer.s3.eu-north-1.amazonaws.com/avatars/avatar.png'
      ..fcmToken = ''
      ..referralCode = '',
  ).obs;

  Rx<EngagementSdk.ForumInfo> forumPost = EngagementSdk.ForumInfo(
    (forumPost) => forumPost
      ..id = ''
      ..title = ''
      ..description = ''
      ..image = ''
      ..authorPhoto = ''
      ..comments = 0
      ..likeCount = 0
      ..likes = ListBuilder<num>()
      ..category = ''
      ..updatedAt = DateTime.now()
      ..createdAt = DateTime.now(),
  ).obs;

  Rx<PeriodTrackerSdk.PeriodTrackerWeekInfo> dashboardTrackerCurrentWeek =
      PeriodTrackerSdk.PeriodTrackerWeekInfo(
    (period) => period
      ..monthTitle = 'June'
      ..days = ListBuilder<PeriodTrackerSdk.PeriodTrackerDayInfo>(),
  ).obs;

  Rx<PeriodTrackerSdk.PeriodTrackerDayInfo> dashboardTrackerCurrentDay =
      PeriodTrackerSdk.PeriodTrackerDayInfo(
    (period) => period
      ..date = DateTime.now()
      ..insights = ''
      ..cycleDayCount = 0
      ..isFertileDay = false
      ..isPredictedOvulationDay = false
      ..isPredictedPeriodDay = false
      ..isToday = false
      ..periodDayCount = 0,
  ).obs;

  Rx<PeriodTrackerSdk.DashboardTrackerInfo> dashboardPeriodInfo =
      PeriodTrackerSdk.DashboardTrackerInfo(
    (instance) => instance
      ..currentWeek = PeriodTrackerSdk.PeriodTrackerWeekInfo(
        (period) => period
          ..monthTitle = ''
          ..days = ListBuilder<PeriodTrackerSdk.PeriodTrackerDayInfo>(),
      ).toBuilder()
      ..nextWeek = PeriodTrackerSdk.PeriodTrackerWeekInfo(
        (period) => period
          ..monthTitle = ''
          ..days = ListBuilder<PeriodTrackerSdk.PeriodTrackerDayInfo>(),
      ).toBuilder()
      ..previousWeek = PeriodTrackerSdk.PeriodTrackerWeekInfo(
        (period) => period
          ..monthTitle = ''
          ..days = ListBuilder<PeriodTrackerSdk.PeriodTrackerDayInfo>(),
      ).toBuilder(),
  ).obs;

  final RxList<PeriodTrackerSdk.PeriodLogInfo> _periodLogHistory =
      <PeriodTrackerSdk.PeriodLogInfo>[].obs;
  RxList<PeriodTrackerSdk.PeriodLogInfo> get periodLogHistory =>
      _periodLogHistory;

  Rx<EngagementSdk.CourseInfo> courseInfo = EngagementSdk.CourseInfo(
    (courseInfo) => courseInfo
      ..id = ''
      ..title = ''
      ..description = ''
      ..coverPhoto = ''
      ..category =
          EngagementSdk.CourseInfoCategoryEnum.contraceptionAndFamilyPlanning,
  ).obs;

  final RxList<AccountSdk.NotificationInfo> _notifications =
      <AccountSdk.NotificationInfo>[].obs;
  RxList<AccountSdk.NotificationInfo> get notifications => _notifications;

  final RxList<AuthSdk.AvailableStateInfo> _availableStates =
      <AuthSdk.AvailableStateInfo>[].obs;
  RxList<AuthSdk.AvailableStateInfo> get availableStates => _availableStates;

  final RxList<EngagementSdk.ForumInfo> _forumPosts =
      <EngagementSdk.ForumInfo>[].obs;
  RxList<EngagementSdk.ForumInfo> get forumPosts => _forumPosts;

  final RxList<EngagementSdk.ForumInfo> _userForumPosts =
      <EngagementSdk.ForumInfo>[].obs;
  RxList<EngagementSdk.ForumInfo> get userForumPosts => _userForumPosts;

  final RxList<EngagementSdk.ForumCommentInfo> _forumPostComments =
      <EngagementSdk.ForumCommentInfo>[].obs;
  RxList<EngagementSdk.ForumCommentInfo> get forumPostComments =>
      _forumPostComments;

  final RxList<PeriodTrackerSdk.PeriodTrackerInfo> _periodTrackerHistory =
      <PeriodTrackerSdk.PeriodTrackerInfo>[].obs;
  RxList<PeriodTrackerSdk.PeriodTrackerInfo> get periodTrackerHistory =>
      _periodTrackerHistory;

  final RxList<EngagementSdk.CourseCategoryInfo> _courseCategories =
      <EngagementSdk.CourseCategoryInfo>[].obs;
  RxList<EngagementSdk.CourseCategoryInfo> get courseCategories =>
      _courseCategories;

  final RxList<EngagementSdk.CourseCategoryInfo> _courses =
      <EngagementSdk.CourseCategoryInfo>[].obs;
  RxList<EngagementSdk.CourseCategoryInfo> get courses => _courses;

  final RxList<AccountSdk.OnboardingQuestionInfo> _onboardingQuestions =
      <AccountSdk.OnboardingQuestionInfo>[].obs;
  RxList<AccountSdk.OnboardingQuestionInfo> get onboardingQuestions =>
      _onboardingQuestions;

  final RxList<AccountSdk.MonthlySurveyInfo> _surveyHistory =
      <AccountSdk.MonthlySurveyInfo>[].obs;
  RxList<AccountSdk.MonthlySurveyInfo> get surveyHistory => _surveyHistory;

  final RxList<AccountSdk.OrderInfo> _ongoingOrders =
      <AccountSdk.OrderInfo>[].obs;
  RxList<AccountSdk.OrderInfo> get ongoingOrders => _ongoingOrders;

  final RxList<AccountSdk.OrderInfo> _completedOrders =
      <AccountSdk.OrderInfo>[].obs;
  RxList<AccountSdk.OrderInfo> get completedOrders => _completedOrders;

  RxInt notificationsCurrentPage = 1.obs;
  RxBool notificationsHasNextPage = false.obs;

  RxInt forumPostsCurrentPage = 1.obs;
  RxBool forumPostsHasNextPage = false.obs;

  RxInt forumPostCommentsCurrentPage = 1.obs;
  RxBool forumPostCommentsHasNextPage = false.obs;

  RxInt coursesCurrentPage = 1.obs;
  RxBool coursesHasNextPage = false.obs;

  RxInt ordersCurrentPage = 1.obs;
  RxBool ordersHasNextPage = false.obs;

  RxInt surveyHistoryCurrentPage = 1.obs;
  RxBool surveyHistoryHasNextPage = false.obs;
}
