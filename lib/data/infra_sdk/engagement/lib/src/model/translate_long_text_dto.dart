// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'translate_long_text_dto.g.dart';

/// TranslateLongTextDto
///
/// Properties:
/// * [text] - The text to translate
@BuiltValue()
abstract class TranslateLongTextDto implements Built<TranslateLongTextDto, TranslateLongTextDtoBuilder> {
  /// The text to translate
  @BuiltValueField(wireName: r'text')
  String get text;

  TranslateLongTextDto._();

  factory TranslateLongTextDto([void updates(TranslateLongTextDtoBuilder b)]) = _$TranslateLongTextDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TranslateLongTextDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslateLongTextDto> get serializer => _$TranslateLongTextDtoSerializer();
}

class _$TranslateLongTextDtoSerializer implements PrimitiveSerializer<TranslateLongTextDto> {
  @override
  final Iterable<Type> types = const [TranslateLongTextDto, _$TranslateLongTextDto];

  @override
  final String wireName = r'TranslateLongTextDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TranslateLongTextDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TranslateLongTextDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TranslateLongTextDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TranslateLongTextDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslateLongTextDtoBuilder();
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

