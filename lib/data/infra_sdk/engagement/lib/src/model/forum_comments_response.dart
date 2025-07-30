// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:engagement_sdk/src/model/forum_comment_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forum_comments_response.g.dart';

/// ForumCommentsResponse
///
/// Properties:
/// * [comments] 
/// * [totalPages] 
/// * [hasNextPage] 
@BuiltValue()
abstract class ForumCommentsResponse implements Built<ForumCommentsResponse, ForumCommentsResponseBuilder> {
  @BuiltValueField(wireName: r'comments')
  BuiltList<ForumCommentInfo> get comments;

  @BuiltValueField(wireName: r'totalPages')
  num get totalPages;

  @BuiltValueField(wireName: r'hasNextPage')
  bool get hasNextPage;

  ForumCommentsResponse._();

  factory ForumCommentsResponse([void updates(ForumCommentsResponseBuilder b)]) = _$ForumCommentsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ForumCommentsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ForumCommentsResponse> get serializer => _$ForumCommentsResponseSerializer();
}

class _$ForumCommentsResponseSerializer implements PrimitiveSerializer<ForumCommentsResponse> {
  @override
  final Iterable<Type> types = const [ForumCommentsResponse, _$ForumCommentsResponse];

  @override
  final String wireName = r'ForumCommentsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ForumCommentsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'comments';
    yield serializers.serialize(
      object.comments,
      specifiedType: const FullType(BuiltList, [FullType(ForumCommentInfo)]),
    );
    yield r'totalPages';
    yield serializers.serialize(
      object.totalPages,
      specifiedType: const FullType(num),
    );
    yield r'hasNextPage';
    yield serializers.serialize(
      object.hasNextPage,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ForumCommentsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ForumCommentsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'comments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ForumCommentInfo)]),
          ) as BuiltList<ForumCommentInfo>;
          result.comments.replace(valueDes);
          break;
        case r'totalPages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalPages = valueDes;
          break;
        case r'hasNextPage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasNextPage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ForumCommentsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForumCommentsResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

