// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'translate_text_info.g.dart';

/// TranslateTextInfo
///
/// Properties:
/// * [isTranslated] 
/// * [translatedText] 
@BuiltValue()
abstract class TranslateTextInfo implements Built<TranslateTextInfo, TranslateTextInfoBuilder> {
  @BuiltValueField(wireName: r'isTranslated')
  bool get isTranslated;

  @BuiltValueField(wireName: r'translatedText')
  String get translatedText;

  TranslateTextInfo._();

  factory TranslateTextInfo([void updates(TranslateTextInfoBuilder b)]) = _$TranslateTextInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TranslateTextInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslateTextInfo> get serializer => _$TranslateTextInfoSerializer();
}

class _$TranslateTextInfoSerializer implements PrimitiveSerializer<TranslateTextInfo> {
  @override
  final Iterable<Type> types = const [TranslateTextInfo, _$TranslateTextInfo];

  @override
  final String wireName = r'TranslateTextInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TranslateTextInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'isTranslated';
    yield serializers.serialize(
      object.isTranslated,
      specifiedType: const FullType(bool),
    );
    yield r'translatedText';
    yield serializers.serialize(
      object.translatedText,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TranslateTextInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TranslateTextInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'isTranslated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isTranslated = valueDes;
          break;
        case r'translatedText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.translatedText = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TranslateTextInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslateTextInfoBuilder();
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

