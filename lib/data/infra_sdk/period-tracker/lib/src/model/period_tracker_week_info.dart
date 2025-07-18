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
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_day_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_tracker_week_info.g.dart';

/// PeriodTrackerWeekInfo
///
/// Properties:
/// * [monthTitle] 
/// * [days] 
@BuiltValue()
abstract class PeriodTrackerWeekInfo implements Built<PeriodTrackerWeekInfo, PeriodTrackerWeekInfoBuilder> {
  @BuiltValueField(wireName: r'monthTitle')
  String get monthTitle;

  @BuiltValueField(wireName: r'days')
  BuiltList<PeriodTrackerDayInfo> get days;

  PeriodTrackerWeekInfo._();

  factory PeriodTrackerWeekInfo([void updates(PeriodTrackerWeekInfoBuilder b)]) = _$PeriodTrackerWeekInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerWeekInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerWeekInfo> get serializer => _$PeriodTrackerWeekInfoSerializer();
}

class _$PeriodTrackerWeekInfoSerializer implements PrimitiveSerializer<PeriodTrackerWeekInfo> {
  @override
  final Iterable<Type> types = const [PeriodTrackerWeekInfo, _$PeriodTrackerWeekInfo];

  @override
  final String wireName = r'PeriodTrackerWeekInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerWeekInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'monthTitle';
    yield serializers.serialize(
      object.monthTitle,
      specifiedType: const FullType(String),
    );
    yield r'days';
    yield serializers.serialize(
      object.days,
      specifiedType: const FullType(BuiltList, [FullType(PeriodTrackerDayInfo)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerWeekInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerWeekInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'monthTitle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.monthTitle = valueDes;
          break;
        case r'days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PeriodTrackerDayInfo)]),
          ) as BuiltList<PeriodTrackerDayInfo>;
          result.days.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerWeekInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerWeekInfoBuilder();
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

