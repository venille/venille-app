// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:period_tracker_sdk/src/model/monthly_period_info.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'predicted_year_tracker_info.g.dart';

/// PredictedYearTrackerInfo
///
/// Properties:
/// * [currentYear] 
/// * [months] 
@BuiltValue()
abstract class PredictedYearTrackerInfo implements Built<PredictedYearTrackerInfo, PredictedYearTrackerInfoBuilder> {
  @BuiltValueField(wireName: r'currentYear')
  num get currentYear;

  @BuiltValueField(wireName: r'months')
  BuiltList<MonthlyPeriodInfo> get months;

  PredictedYearTrackerInfo._();

  factory PredictedYearTrackerInfo([void updates(PredictedYearTrackerInfoBuilder b)]) = _$PredictedYearTrackerInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PredictedYearTrackerInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PredictedYearTrackerInfo> get serializer => _$PredictedYearTrackerInfoSerializer();
}

class _$PredictedYearTrackerInfoSerializer implements PrimitiveSerializer<PredictedYearTrackerInfo> {
  @override
  final Iterable<Type> types = const [PredictedYearTrackerInfo, _$PredictedYearTrackerInfo];

  @override
  final String wireName = r'PredictedYearTrackerInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PredictedYearTrackerInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'currentYear';
    yield serializers.serialize(
      object.currentYear,
      specifiedType: const FullType(num),
    );
    yield r'months';
    yield serializers.serialize(
      object.months,
      specifiedType: const FullType(BuiltList, [FullType(MonthlyPeriodInfo)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PredictedYearTrackerInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PredictedYearTrackerInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'currentYear':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.currentYear = valueDes;
          break;
        case r'months':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MonthlyPeriodInfo)]),
          ) as BuiltList<MonthlyPeriodInfo>;
          result.months.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PredictedYearTrackerInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PredictedYearTrackerInfoBuilder();
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

