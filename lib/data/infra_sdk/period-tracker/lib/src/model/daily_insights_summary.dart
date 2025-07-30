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
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'daily_insights_summary.g.dart';

/// DailyInsightsSummary
///
/// Properties:
/// * [date] 
/// * [isPredictedPeriodDay] 
/// * [isPredictedOvulationDay] 
/// * [isFertileDay] 
/// * [todayInsights] 
@BuiltValue()
abstract class DailyInsightsSummary implements Built<DailyInsightsSummary, DailyInsightsSummaryBuilder> {
  @BuiltValueField(wireName: r'date')
  DateTime get date;

  @BuiltValueField(wireName: r'isPredictedPeriodDay')
  bool get isPredictedPeriodDay;

  @BuiltValueField(wireName: r'isPredictedOvulationDay')
  bool get isPredictedOvulationDay;

  @BuiltValueField(wireName: r'isFertileDay')
  bool get isFertileDay;

  @BuiltValueField(wireName: r'todayInsights')
  String get todayInsights;

  DailyInsightsSummary._();

  factory DailyInsightsSummary([void updates(DailyInsightsSummaryBuilder b)]) = _$DailyInsightsSummary;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DailyInsightsSummaryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DailyInsightsSummary> get serializer => _$DailyInsightsSummarySerializer();
}

class _$DailyInsightsSummarySerializer implements PrimitiveSerializer<DailyInsightsSummary> {
  @override
  final Iterable<Type> types = const [DailyInsightsSummary, _$DailyInsightsSummary];

  @override
  final String wireName = r'DailyInsightsSummary';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DailyInsightsSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'date';
    yield serializers.serialize(
      object.date,
      specifiedType: const FullType(DateTime),
    );
    yield r'isPredictedPeriodDay';
    yield serializers.serialize(
      object.isPredictedPeriodDay,
      specifiedType: const FullType(bool),
    );
    yield r'isPredictedOvulationDay';
    yield serializers.serialize(
      object.isPredictedOvulationDay,
      specifiedType: const FullType(bool),
    );
    yield r'isFertileDay';
    yield serializers.serialize(
      object.isFertileDay,
      specifiedType: const FullType(bool),
    );
    yield r'todayInsights';
    yield serializers.serialize(
      object.todayInsights,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DailyInsightsSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DailyInsightsSummaryBuilder result,
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
        case r'isPredictedPeriodDay':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPredictedPeriodDay = valueDes;
          break;
        case r'isPredictedOvulationDay':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPredictedOvulationDay = valueDes;
          break;
        case r'isFertileDay':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFertileDay = valueDes;
          break;
        case r'todayInsights':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.todayInsights = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DailyInsightsSummary deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DailyInsightsSummaryBuilder();
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

