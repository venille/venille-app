// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_tracker_last_period_info.g.dart';

/// PeriodTrackerLastPeriodInfo
///
/// Properties:
/// * [startDate] 
/// * [endDate] 
/// * [isPredicted] 
@BuiltValue()
abstract class PeriodTrackerLastPeriodInfo implements Built<PeriodTrackerLastPeriodInfo, PeriodTrackerLastPeriodInfoBuilder> {
  @BuiltValueField(wireName: r'startDate')
  String get startDate;

  @BuiltValueField(wireName: r'endDate')
  String get endDate;

  @BuiltValueField(wireName: r'isPredicted')
  bool get isPredicted;

  PeriodTrackerLastPeriodInfo._();

  factory PeriodTrackerLastPeriodInfo([void updates(PeriodTrackerLastPeriodInfoBuilder b)]) = _$PeriodTrackerLastPeriodInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerLastPeriodInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerLastPeriodInfo> get serializer => _$PeriodTrackerLastPeriodInfoSerializer();
}

class _$PeriodTrackerLastPeriodInfoSerializer implements PrimitiveSerializer<PeriodTrackerLastPeriodInfo> {
  @override
  final Iterable<Type> types = const [PeriodTrackerLastPeriodInfo, _$PeriodTrackerLastPeriodInfo];

  @override
  final String wireName = r'PeriodTrackerLastPeriodInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerLastPeriodInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'startDate';
    yield serializers.serialize(
      object.startDate,
      specifiedType: const FullType(String),
    );
    yield r'endDate';
    yield serializers.serialize(
      object.endDate,
      specifiedType: const FullType(String),
    );
    yield r'isPredicted';
    yield serializers.serialize(
      object.isPredicted,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerLastPeriodInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerLastPeriodInfoBuilder result,
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
        case r'endDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.endDate = valueDes;
          break;
        case r'isPredicted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPredicted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerLastPeriodInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerLastPeriodInfoBuilder();
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

