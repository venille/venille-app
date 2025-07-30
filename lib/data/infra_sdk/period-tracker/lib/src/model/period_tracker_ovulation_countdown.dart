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

part 'period_tracker_ovulation_countdown.g.dart';

/// PeriodTrackerOvulationCountdown
///
/// Properties:
/// * [ovulationInDays] 
/// * [isToday] 
@BuiltValue()
abstract class PeriodTrackerOvulationCountdown implements Built<PeriodTrackerOvulationCountdown, PeriodTrackerOvulationCountdownBuilder> {
  @BuiltValueField(wireName: r'ovulationInDays')
  num get ovulationInDays;

  @BuiltValueField(wireName: r'isToday')
  bool get isToday;

  PeriodTrackerOvulationCountdown._();

  factory PeriodTrackerOvulationCountdown([void updates(PeriodTrackerOvulationCountdownBuilder b)]) = _$PeriodTrackerOvulationCountdown;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerOvulationCountdownBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerOvulationCountdown> get serializer => _$PeriodTrackerOvulationCountdownSerializer();
}

class _$PeriodTrackerOvulationCountdownSerializer implements PrimitiveSerializer<PeriodTrackerOvulationCountdown> {
  @override
  final Iterable<Type> types = const [PeriodTrackerOvulationCountdown, _$PeriodTrackerOvulationCountdown];

  @override
  final String wireName = r'PeriodTrackerOvulationCountdown';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerOvulationCountdown object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'ovulationInDays';
    yield serializers.serialize(
      object.ovulationInDays,
      specifiedType: const FullType(num),
    );
    yield r'isToday';
    yield serializers.serialize(
      object.isToday,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerOvulationCountdown object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerOvulationCountdownBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ovulationInDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.ovulationInDays = valueDes;
          break;
        case r'isToday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isToday = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerOvulationCountdown deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerOvulationCountdownBuilder();
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

