// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menstrual_phase_description_info.g.dart';

/// MenstrualPhaseDescriptionInfo
///
/// Properties:
/// * [id] - Menstrual phase info ID (Auto generated).
/// * [title] - Menstrual phase info title e.g Menstrual phase info 1.
/// * [description] - Menstrual phase info descriptions e.g Menstrual phase info 1.
@BuiltValue()
abstract class MenstrualPhaseDescriptionInfo implements Built<MenstrualPhaseDescriptionInfo, MenstrualPhaseDescriptionInfoBuilder> {
  /// Menstrual phase info ID (Auto generated).
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Menstrual phase info title e.g Menstrual phase info 1.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Menstrual phase info descriptions e.g Menstrual phase info 1.
  @BuiltValueField(wireName: r'description')
  String get description;

  MenstrualPhaseDescriptionInfo._();

  factory MenstrualPhaseDescriptionInfo([void updates(MenstrualPhaseDescriptionInfoBuilder b)]) = _$MenstrualPhaseDescriptionInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MenstrualPhaseDescriptionInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MenstrualPhaseDescriptionInfo> get serializer => _$MenstrualPhaseDescriptionInfoSerializer();
}

class _$MenstrualPhaseDescriptionInfoSerializer implements PrimitiveSerializer<MenstrualPhaseDescriptionInfo> {
  @override
  final Iterable<Type> types = const [MenstrualPhaseDescriptionInfo, _$MenstrualPhaseDescriptionInfo];

  @override
  final String wireName = r'MenstrualPhaseDescriptionInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MenstrualPhaseDescriptionInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MenstrualPhaseDescriptionInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MenstrualPhaseDescriptionInfoBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MenstrualPhaseDescriptionInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MenstrualPhaseDescriptionInfoBuilder();
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

