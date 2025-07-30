// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:engagement_sdk/src/model/forum_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forum_feed_response.g.dart';

/// ForumFeedResponse
///
/// Properties:
/// * [forums] 
/// * [totalPages] 
/// * [hasNextPage] 
@BuiltValue()
abstract class ForumFeedResponse implements Built<ForumFeedResponse, ForumFeedResponseBuilder> {
  @BuiltValueField(wireName: r'forums')
  BuiltList<ForumInfo> get forums;

  @BuiltValueField(wireName: r'totalPages')
  num get totalPages;

  @BuiltValueField(wireName: r'hasNextPage')
  bool get hasNextPage;

  ForumFeedResponse._();

  factory ForumFeedResponse([void updates(ForumFeedResponseBuilder b)]) = _$ForumFeedResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ForumFeedResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ForumFeedResponse> get serializer => _$ForumFeedResponseSerializer();
}

class _$ForumFeedResponseSerializer implements PrimitiveSerializer<ForumFeedResponse> {
  @override
  final Iterable<Type> types = const [ForumFeedResponse, _$ForumFeedResponse];

  @override
  final String wireName = r'ForumFeedResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ForumFeedResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'forums';
    yield serializers.serialize(
      object.forums,
      specifiedType: const FullType(BuiltList, [FullType(ForumInfo)]),
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
    ForumFeedResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ForumFeedResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'forums':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ForumInfo)]),
          ) as BuiltList<ForumInfo>;
          result.forums.replace(valueDes);
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
  ForumFeedResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForumFeedResponseBuilder();
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

