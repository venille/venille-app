import 'package:test/test.dart';
import 'package:engagement_sdk/engagement_sdk.dart';


/// tests for MyForumApi
void main() {
  final instance = EngagementSdk().getMyForumApi();

  group(MyForumApi, () {
    //Future<ForumInfo> forumControllerCreateForum(CreateForumDto createForumDto) async
    test('test forumControllerCreateForum', () async {
      // TODO
    });

    //Future<bool> forumControllerDeleteForum(num forumId) async
    test('test forumControllerDeleteForum', () async {
      // TODO
    });

    //Future<ForumFeedResponse> forumControllerFetchUserForumFeed(num page, num pageSize) async
    test('test forumControllerFetchUserForumFeed', () async {
      // TODO
    });

  });
}
