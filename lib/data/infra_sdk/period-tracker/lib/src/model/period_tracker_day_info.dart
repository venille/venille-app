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

part 'period_tracker_day_info.g.dart';

/// PeriodTrackerDayInfo
///
/// Properties:
/// * [date] 
/// * [isToday] 
/// * [periodDayCount] 
/// * [cycleDayCount] 
/// * [isPredictedPeriodDay] 
/// * [isFertileDay] 
/// * [isPredictedOvulationDay] 
/// * [insights] 
@BuiltValue()
abstract class PeriodTrackerDayInfo implements Built<PeriodTrackerDayInfo, PeriodTrackerDayInfoBuilder> {
  @BuiltValueField(wireName: r'date')
  DateTime get date;

  @BuiltValueField(wireName: r'isToday')
  bool get isToday;

  @BuiltValueField(wireName: r'periodDayCount')
  num get periodDayCount;

  @BuiltValueField(wireName: r'cycleDayCount')
  num get cycleDayCount;

  @BuiltValueField(wireName: r'isPredictedPeriodDay')
  bool get isPredictedPeriodDay;

  @BuiltValueField(wireName: r'isFertileDay')
  bool get isFertileDay;

  @BuiltValueField(wireName: r'isPredictedOvulationDay')
  bool get isPredictedOvulationDay;

  @BuiltValueField(wireName: r'insights')
  String get insights;

  PeriodTrackerDayInfo._();

  factory PeriodTrackerDayInfo([void updates(PeriodTrackerDayInfoBuilder b)]) = _$PeriodTrackerDayInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerDayInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerDayInfo> get serializer => _$PeriodTrackerDayInfoSerializer();
}

class _$PeriodTrackerDayInfoSerializer implements PrimitiveSerializer<PeriodTrackerDayInfo> {
  @override
  final Iterable<Type> types = const [PeriodTrackerDayInfo, _$PeriodTrackerDayInfo];

  @override
  final String wireName = r'PeriodTrackerDayInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerDayInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'date';
    yield serializers.serialize(
      object.date,
      specifiedType: const FullType(DateTime),
    );
    yield r'isToday';
    yield serializers.serialize(
      object.isToday,
      specifiedType: const FullType(bool),
    );
    yield r'periodDayCount';
    yield serializers.serialize(
      object.periodDayCount,
      specifiedType: const FullType(num),
    );
    yield r'cycleDayCount';
    yield serializers.serialize(
      object.cycleDayCount,
      specifiedType: const FullType(num),
    );
    yield r'isPredictedPeriodDay';
    yield serializers.serialize(
      object.isPredictedPeriodDay,
      specifiedType: const FullType(bool),
    );
    yield r'isFertileDay';
    yield serializers.serialize(
      object.isFertileDay,
      specifiedType: const FullType(bool),
    );
    yield r'isPredictedOvulationDay';
    yield serializers.serialize(
      object.isPredictedOvulationDay,
      specifiedType: const FullType(bool),
    );
    yield r'insights';
    yield serializers.serialize(
      object.insights,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerDayInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerDayInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.date = valueDes;
          break;
        case r'isToday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isToday = valueDes;
          break;
        case r'periodDayCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.periodDayCount = valueDes;
          break;
        case r'cycleDayCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.cycleDayCount = valueDes;
          break;
        case r'isPredictedPeriodDay':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPredictedPeriodDay = valueDes;
          break;
        case r'isFertileDay':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFertileDay = valueDes;
          break;
        case r'isPredictedOvulationDay':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPredictedOvulationDay = valueDes;
          break;
        case r'insights':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.insights = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerDayInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerDayInfoBuilder();
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

