// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forum_comment_info.g.dart';

/// ForumCommentInfo
///
/// Properties:
/// * [id] 
/// * [content] 
/// * [authorPhoto] 
/// * [createdAt] 
@BuiltValue()
abstract class ForumCommentInfo implements Built<ForumCommentInfo, ForumCommentInfoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'authorPhoto')
  String get authorPhoto;

  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  ForumCommentInfo._();

  factory ForumCommentInfo([void updates(ForumCommentInfoBuilder b)]) = _$ForumCommentInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ForumCommentInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ForumCommentInfo> get serializer => _$ForumCommentInfoSerializer();
}

class _$ForumCommentInfoSerializer implements PrimitiveSerializer<ForumCommentInfo> {
  @override
  final Iterable<Type> types = const [ForumCommentInfo, _$ForumCommentInfo];

  @override
  final String wireName = r'ForumCommentInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ForumCommentInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    yield r'authorPhoto';
    yield serializers.serialize(
      object.authorPhoto,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ForumCommentInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ForumCommentInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'authorPhoto':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.authorPhoto = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ForumCommentInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForumCommentInfoBuilder();
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

