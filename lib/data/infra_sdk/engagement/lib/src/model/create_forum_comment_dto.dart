// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_forum_comment_dto.g.dart';

/// CreateForumCommentDto
///
/// Properties:
/// * [content] - The content of the comment
@BuiltValue()
abstract class CreateForumCommentDto implements Built<CreateForumCommentDto, CreateForumCommentDtoBuilder> {
  /// The content of the comment
  @BuiltValueField(wireName: r'content')
  String get content;

  CreateForumCommentDto._();

  factory CreateForumCommentDto([void updates(CreateForumCommentDtoBuilder b)]) = _$CreateForumCommentDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateForumCommentDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateForumCommentDto> get serializer => _$CreateForumCommentDtoSerializer();
}

class _$CreateForumCommentDtoSerializer implements PrimitiveSerializer<CreateForumCommentDto> {
  @override
  final Iterable<Type> types = const [CreateForumCommentDto, _$CreateForumCommentDto];

  @override
  final String wireName = r'CreateForumCommentDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateForumCommentDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateForumCommentDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateForumCommentDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateForumCommentDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateForumCommentDtoBuilder();
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

