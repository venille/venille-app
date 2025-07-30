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
// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/daily_insights_summary.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_tracker_calendar_info.g.dart';

/// PeriodTrackerCalendarInfo
///
/// Properties:
/// * [currentMonth] 
/// * [currentYear] 
/// * [predictedPeriodDays] 
/// * [dailyInsights] 
/// * [ovulationDate] 
@BuiltValue()
abstract class PeriodTrackerCalendarInfo implements Built<PeriodTrackerCalendarInfo, PeriodTrackerCalendarInfoBuilder> {
  @BuiltValueField(wireName: r'currentMonth')
  String get currentMonth;

  @BuiltValueField(wireName: r'currentYear')
  num get currentYear;

  @BuiltValueField(wireName: r'predictedPeriodDays')
  BuiltList<String> get predictedPeriodDays;

  @BuiltValueField(wireName: r'dailyInsights')
  BuiltList<DailyInsightsSummary> get dailyInsights;

  @BuiltValueField(wireName: r'ovulationDate')
  String get ovulationDate;

  PeriodTrackerCalendarInfo._();

  factory PeriodTrackerCalendarInfo([void updates(PeriodTrackerCalendarInfoBuilder b)]) = _$PeriodTrackerCalendarInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerCalendarInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerCalendarInfo> get serializer => _$PeriodTrackerCalendarInfoSerializer();
}

class _$PeriodTrackerCalendarInfoSerializer implements PrimitiveSerializer<PeriodTrackerCalendarInfo> {
  @override
  final Iterable<Type> types = const [PeriodTrackerCalendarInfo, _$PeriodTrackerCalendarInfo];

  @override
  final String wireName = r'PeriodTrackerCalendarInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerCalendarInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'currentMonth';
    yield serializers.serialize(
      object.currentMonth,
      specifiedType: const FullType(String),
    );
    yield r'currentYear';
    yield serializers.serialize(
      object.currentYear,
      specifiedType: const FullType(num),
    );
    yield r'predictedPeriodDays';
    yield serializers.serialize(
      object.predictedPeriodDays,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'dailyInsights';
    yield serializers.serialize(
      object.dailyInsights,
      specifiedType: const FullType(BuiltList, [FullType(DailyInsightsSummary)]),
    );
    yield r'ovulationDate';
    yield serializers.serialize(
      object.ovulationDate,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerCalendarInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerCalendarInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'currentMonth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currentMonth = valueDes;
          break;
        case r'currentYear':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.currentYear = valueDes;
          break;
        case r'predictedPeriodDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.predictedPeriodDays.replace(valueDes);
          break;
        case r'dailyInsights':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DailyInsightsSummary)]),
          ) as BuiltList<DailyInsightsSummary>;
          result.dailyInsights.replace(valueDes);
          break;
        case r'ovulationDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.ovulationDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerCalendarInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerCalendarInfoBuilder();
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

