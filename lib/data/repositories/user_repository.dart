// ignore_for_file: library_prefixes
import 'package:get/get.dart';
import 'package:built_collection/built_collection.dart';
import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart' as AuthSdk;
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart'
    as AccountSdk;
import 'package:venille/data/infra_sdk/engagement/lib/engagement_sdk.dart'
    as EngagementSdk;

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

  RxInt notificationsCurrentPage = 1.obs;
  RxBool notificationsHasNextPage = false.obs;

  RxInt forumPostsCurrentPage = 1.obs;
  RxBool forumPostsHasNextPage = false.obs;

  RxInt forumPostCommentsCurrentPage = 1.obs;
  RxBool forumPostCommentsHasNextPage = false.obs;

  RxInt coursesCurrentPage = 1.obs;
  RxBool coursesHasNextPage = false.obs;
  
}
