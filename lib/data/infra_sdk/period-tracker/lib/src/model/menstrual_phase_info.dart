// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:period_tracker_sdk/src/model/menstrual_phase_description_info.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menstrual_phase_info.g.dart';

/// MenstrualPhaseInfo
///
/// Properties:
/// * [id] - Menstrual phase info ID (Auto generated).
/// * [title] - Menstrual phase info title e.g Menstrual phase info 1.
/// * [coverPhoto] - Menstrual phase info cover photo e.g https://example.com/cover-photo.jpg.
/// * [descriptions] - Menstrual phase info descriptions e.g Menstrual phase info 1.
@BuiltValue()
abstract class MenstrualPhaseInfo implements Built<MenstrualPhaseInfo, MenstrualPhaseInfoBuilder> {
  /// Menstrual phase info ID (Auto generated).
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Menstrual phase info title e.g Menstrual phase info 1.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Menstrual phase info cover photo e.g https://example.com/cover-photo.jpg.
  @BuiltValueField(wireName: r'coverPhoto')
  String get coverPhoto;

  /// Menstrual phase info descriptions e.g Menstrual phase info 1.
  @BuiltValueField(wireName: r'descriptions')
  BuiltList<MenstrualPhaseDescriptionInfo> get descriptions;

  MenstrualPhaseInfo._();

  factory MenstrualPhaseInfo([void updates(MenstrualPhaseInfoBuilder b)]) = _$MenstrualPhaseInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MenstrualPhaseInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MenstrualPhaseInfo> get serializer => _$MenstrualPhaseInfoSerializer();
}

class _$MenstrualPhaseInfoSerializer implements PrimitiveSerializer<MenstrualPhaseInfo> {
  @override
  final Iterable<Type> types = const [MenstrualPhaseInfo, _$MenstrualPhaseInfo];

  @override
  final String wireName = r'MenstrualPhaseInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MenstrualPhaseInfo object, {
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
    yield r'coverPhoto';
    yield serializers.serialize(
      object.coverPhoto,
      specifiedType: const FullType(String),
    );
    yield r'descriptions';
    yield serializers.serialize(
      object.descriptions,
      specifiedType: const FullType(BuiltList, [FullType(MenstrualPhaseDescriptionInfo)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MenstrualPhaseInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MenstrualPhaseInfoBuilder result,
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
        case r'coverPhoto':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.coverPhoto = valueDes;
          break;
        case r'descriptions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MenstrualPhaseDescriptionInfo)]),
          ) as BuiltList<MenstrualPhaseDescriptionInfo>;
          result.descriptions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MenstrualPhaseInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MenstrualPhaseInfoBuilder();
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

