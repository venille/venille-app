// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:engagement_sdk/src/date_serializer.dart';
import 'package:engagement_sdk/src/model/date.dart';

import 'package:engagement_sdk/src/model/course_category_info.dart';
import 'package:engagement_sdk/src/model/course_info.dart';
import 'package:engagement_sdk/src/model/create_forum_comment_dto.dart';
import 'package:engagement_sdk/src/model/create_forum_dto.dart';
import 'package:engagement_sdk/src/model/forum_comment_info.dart';
import 'package:engagement_sdk/src/model/forum_comments_response.dart';
import 'package:engagement_sdk/src/model/forum_feed_response.dart';
import 'package:engagement_sdk/src/model/forum_info.dart';
import 'package:engagement_sdk/src/model/translate_long_text_dto.dart';
import 'package:engagement_sdk/src/model/translate_text_info.dart';

part 'serializers.g.dart';

@SerializersFor([
  CourseCategoryInfo,
  CourseInfo,
  CreateForumCommentDto,
  CreateForumDto,
  ForumCommentInfo,
  ForumCommentsResponse,
  ForumFeedResponse,
  ForumInfo,
  TranslateLongTextDto,
  TranslateTextInfo,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CourseCategoryInfo)]),
        () => ListBuilder<CourseCategoryInfo>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
