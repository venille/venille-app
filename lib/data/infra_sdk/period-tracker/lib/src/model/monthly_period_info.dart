// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:period_tracker_sdk/src/model/period_day_info.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'monthly_period_info.g.dart';

/// MonthlyPeriodInfo
///
/// Properties:
/// * [month] 
/// * [monthName] 
/// * [days] 
@BuiltValue()
abstract class MonthlyPeriodInfo implements Built<MonthlyPeriodInfo, MonthlyPeriodInfoBuilder> {
  @BuiltValueField(wireName: r'month')
  num get month;

  @BuiltValueField(wireName: r'monthName')
  String get monthName;

  @BuiltValueField(wireName: r'days')
  BuiltList<PeriodDayInfo> get days;

  MonthlyPeriodInfo._();

  factory MonthlyPeriodInfo([void updates(MonthlyPeriodInfoBuilder b)]) = _$MonthlyPeriodInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MonthlyPeriodInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MonthlyPeriodInfo> get serializer => _$MonthlyPeriodInfoSerializer();
}

class _$MonthlyPeriodInfoSerializer implements PrimitiveSerializer<MonthlyPeriodInfo> {
  @override
  final Iterable<Type> types = const [MonthlyPeriodInfo, _$MonthlyPeriodInfo];

  @override
  final String wireName = r'MonthlyPeriodInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MonthlyPeriodInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'month';
    yield serializers.serialize(
      object.month,
      specifiedType: const FullType(num),
    );
    yield r'monthName';
    yield serializers.serialize(
      object.monthName,
      specifiedType: const FullType(String),
    );
    yield r'days';
    yield serializers.serialize(
      object.days,
      specifiedType: const FullType(BuiltList, [FullType(PeriodDayInfo)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MonthlyPeriodInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MonthlyPeriodInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'month':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.month = valueDes;
          break;
        case r'monthName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.monthName = valueDes;
          break;
        case r'days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PeriodDayInfo)]),
          ) as BuiltList<PeriodDayInfo>;
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
  MonthlyPeriodInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MonthlyPeriodInfoBuilder();
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

