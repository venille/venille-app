import 'package:test/test.dart';
import 'package:engagement_sdk/engagement_sdk.dart';


/// tests for CourseApi
void main() {
  final instance = EngagementSdk().getCourseApi();

  group(CourseApi, () {
    //Future<BuiltList<CourseCategoryInfo>> courseControllerFetchForumFeed(num page, num pageSize) async
    test('test courseControllerFetchForumFeed', () async {
      // TODO
    });

  });
}
