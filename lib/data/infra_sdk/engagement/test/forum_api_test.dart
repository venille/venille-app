import 'package:test/test.dart';
import 'package:engagement_sdk/engagement_sdk.dart';


/// tests for ForumApi
void main() {
  final instance = EngagementSdk().getForumApi();

  group(ForumApi, () {
    //Future<ForumCommentInfo> forumControllerAddForumComment(num forumId, CreateForumCommentDto createForumCommentDto) async
    test('test forumControllerAddForumComment', () async {
      // TODO
    });

    //Future<bool> forumControllerDeleteForumComment(num commentId) async
    test('test forumControllerDeleteForumComment', () async {
      // TODO
    });

    //Future<ForumCommentsResponse> forumControllerFetchForumComments(num page, num forumId, num pageSize) async
    test('test forumControllerFetchForumComments', () async {
      // TODO
    });

    //Future<ForumFeedResponse> forumControllerFetchForumFeed(num page, num pageSize) async
    test('test forumControllerFetchForumFeed', () async {
      // TODO
    });

    //Future<ForumInfo> forumControllerLikeUnlikeForumPost(num forumId) async
    test('test forumControllerLikeUnlikeForumPost', () async {
      // TODO
    });

  });
}
