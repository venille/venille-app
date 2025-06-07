// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:period_tracker_sdk/src/model/period_tracker_calendar_info.dart';
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_last_period_info.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_ovulation_countdown.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_reminder_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_tracker_info.g.dart';

/// PeriodTrackerInfo
///
/// Properties:
/// * [today] 
/// * [calendar] 
/// * [ovulationCountdown] 
/// * [symptomsLoggedToday] 
/// * [reminders] 
/// * [lastPeriod] 
@BuiltValue()
abstract class PeriodTrackerInfo implements Built<PeriodTrackerInfo, PeriodTrackerInfoBuilder> {
  @BuiltValueField(wireName: r'today')
  String get today;

  @BuiltValueField(wireName: r'calendar')
  PeriodTrackerCalendarInfo get calendar;

  @BuiltValueField(wireName: r'ovulationCountdown')
  PeriodTrackerOvulationCountdown get ovulationCountdown;

  @BuiltValueField(wireName: r'symptomsLoggedToday')
  BuiltList<String> get symptomsLoggedToday;

  @BuiltValueField(wireName: r'reminders')
  BuiltList<PeriodTrackerReminderInfo> get reminders;

  @BuiltValueField(wireName: r'lastPeriod')
  PeriodTrackerLastPeriodInfo get lastPeriod;

  PeriodTrackerInfo._();

  factory PeriodTrackerInfo([void updates(PeriodTrackerInfoBuilder b)]) = _$PeriodTrackerInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerInfo> get serializer => _$PeriodTrackerInfoSerializer();
}

class _$PeriodTrackerInfoSerializer implements PrimitiveSerializer<PeriodTrackerInfo> {
  @override
  final Iterable<Type> types = const [PeriodTrackerInfo, _$PeriodTrackerInfo];

  @override
  final String wireName = r'PeriodTrackerInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'today';
    yield serializers.serialize(
      object.today,
      specifiedType: const FullType(String),
    );
    yield r'calendar';
    yield serializers.serialize(
      object.calendar,
      specifiedType: const FullType(PeriodTrackerCalendarInfo),
    );
    yield r'ovulationCountdown';
    yield serializers.serialize(
      object.ovulationCountdown,
      specifiedType: const FullType(PeriodTrackerOvulationCountdown),
    );
    yield r'symptomsLoggedToday';
    yield serializers.serialize(
      object.symptomsLoggedToday,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'reminders';
    yield serializers.serialize(
      object.reminders,
      specifiedType: const FullType(BuiltList, [FullType(PeriodTrackerReminderInfo)]),
    );
    yield r'lastPeriod';
    yield serializers.serialize(
      object.lastPeriod,
      specifiedType: const FullType(PeriodTrackerLastPeriodInfo),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'today':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.today = valueDes;
          break;
        case r'calendar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PeriodTrackerCalendarInfo),
          ) as PeriodTrackerCalendarInfo;
          result.calendar.replace(valueDes);
          break;
        case r'ovulationCountdown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PeriodTrackerOvulationCountdown),
          ) as PeriodTrackerOvulationCountdown;
          result.ovulationCountdown.replace(valueDes);
          break;
        case r'symptomsLoggedToday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.symptomsLoggedToday.replace(valueDes);
          break;
        case r'reminders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PeriodTrackerReminderInfo)]),
          ) as BuiltList<PeriodTrackerReminderInfo>;
          result.reminders.replace(valueDes);
          break;
        case r'lastPeriod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PeriodTrackerLastPeriodInfo),
          ) as PeriodTrackerLastPeriodInfo;
          result.lastPeriod.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerInfoBuilder();
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

