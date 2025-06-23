// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'previous_cycle_info.g.dart';

/// PreviousCycleInfo
///
/// Properties:
/// * [startDate] - The start date of the previous cycle
/// * [daysAgo] - The number of days ago the previous cycle started
/// * [duration] - The duration of the previous cycle
/// * [durationStatus] - The status of the duration
/// * [cycleLength] - The cycle length
/// * [cycleLengthStatus] - The status of the cycle length
@BuiltValue()
abstract class PreviousCycleInfo implements Built<PreviousCycleInfo, PreviousCycleInfoBuilder> {
  /// The start date of the previous cycle
  @BuiltValueField(wireName: r'startDate')
  String get startDate;

  /// The number of days ago the previous cycle started
  @BuiltValueField(wireName: r'daysAgo')
  String get daysAgo;

  /// The duration of the previous cycle
  @BuiltValueField(wireName: r'duration')
  String get duration;

  /// The status of the duration
  @BuiltValueField(wireName: r'durationStatus')
  String get durationStatus;

  /// The cycle length
  @BuiltValueField(wireName: r'cycleLength')
  String get cycleLength;

  /// The status of the cycle length
  @BuiltValueField(wireName: r'cycleLengthStatus')
  String get cycleLengthStatus;

  PreviousCycleInfo._();

  factory PreviousCycleInfo([void updates(PreviousCycleInfoBuilder b)]) = _$PreviousCycleInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PreviousCycleInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PreviousCycleInfo> get serializer => _$PreviousCycleInfoSerializer();
}

class _$PreviousCycleInfoSerializer implements PrimitiveSerializer<PreviousCycleInfo> {
  @override
  final Iterable<Type> types = const [PreviousCycleInfo, _$PreviousCycleInfo];

  @override
  final String wireName = r'PreviousCycleInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PreviousCycleInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'startDate';
    yield serializers.serialize(
      object.startDate,
      specifiedType: const FullType(String),
    );
    yield r'daysAgo';
    yield serializers.serialize(
      object.daysAgo,
      specifiedType: const FullType(String),
    );
    yield r'duration';
    yield serializers.serialize(
      object.duration,
      specifiedType: const FullType(String),
    );
    yield r'durationStatus';
    yield serializers.serialize(
      object.durationStatus,
      specifiedType: const FullType(String),
    );
    yield r'cycleLength';
    yield serializers.serialize(
      object.cycleLength,
      specifiedType: const FullType(String),
    );
    yield r'cycleLengthStatus';
    yield serializers.serialize(
      object.cycleLengthStatus,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PreviousCycleInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PreviousCycleInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'startDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.startDate = valueDes;
          break;
        case r'daysAgo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.daysAgo = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.duration = valueDes;
          break;
        case r'durationStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.durationStatus = valueDes;
          break;
        case r'cycleLength':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cycleLength = valueDes;
          break;
        case r'cycleLengthStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cycleLengthStatus = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PreviousCycleInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreviousCycleInfoBuilder();
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

