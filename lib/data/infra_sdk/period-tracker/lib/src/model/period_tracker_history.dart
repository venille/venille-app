// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/predicted_year_tracker_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_tracker_history.g.dart';

/// PeriodTrackerHistory
///
/// Properties:
/// * [years] 
@BuiltValue()
abstract class PeriodTrackerHistory implements Built<PeriodTrackerHistory, PeriodTrackerHistoryBuilder> {
  @BuiltValueField(wireName: r'years')
  BuiltList<PredictedYearTrackerInfo> get years;

  PeriodTrackerHistory._();

  factory PeriodTrackerHistory([void updates(PeriodTrackerHistoryBuilder b)]) = _$PeriodTrackerHistory;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerHistoryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerHistory> get serializer => _$PeriodTrackerHistorySerializer();
}

class _$PeriodTrackerHistorySerializer implements PrimitiveSerializer<PeriodTrackerHistory> {
  @override
  final Iterable<Type> types = const [PeriodTrackerHistory, _$PeriodTrackerHistory];

  @override
  final String wireName = r'PeriodTrackerHistory';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerHistory object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'years';
    yield serializers.serialize(
      object.years,
      specifiedType: const FullType(BuiltList, [FullType(PredictedYearTrackerInfo)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerHistory object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerHistoryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'years':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PredictedYearTrackerInfo)]),
          ) as BuiltList<PredictedYearTrackerInfo>;
          result.years.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerHistory deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerHistoryBuilder();
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

