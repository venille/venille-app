// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_day_info.g.dart';

/// PeriodDayInfo
///
/// Properties:
/// * [date] 
/// * [isToday] 
/// * [isLoggedPeriodDay] 
/// * [isPredictedPeriodDay] 
/// * [isPredictedOvulationDay] 
/// * [isFertileWindow] 
/// * [cycleDayCount] 
/// * [insights] 
@BuiltValue()
abstract class PeriodDayInfo implements Built<PeriodDayInfo, PeriodDayInfoBuilder> {
  @BuiltValueField(wireName: r'date')
  DateTime get date;

  @BuiltValueField(wireName: r'isToday')
  bool get isToday;

  @BuiltValueField(wireName: r'isLoggedPeriodDay')
  bool get isLoggedPeriodDay;

  @BuiltValueField(wireName: r'isPredictedPeriodDay')
  bool get isPredictedPeriodDay;

  @BuiltValueField(wireName: r'isPredictedOvulationDay')
  bool get isPredictedOvulationDay;

  @BuiltValueField(wireName: r'isFertileWindow')
  bool get isFertileWindow;

  @BuiltValueField(wireName: r'cycleDayCount')
  num get cycleDayCount;

  @BuiltValueField(wireName: r'insights')
  String get insights;

  PeriodDayInfo._();

  factory PeriodDayInfo([void updates(PeriodDayInfoBuilder b)]) = _$PeriodDayInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodDayInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodDayInfo> get serializer => _$PeriodDayInfoSerializer();
}

class _$PeriodDayInfoSerializer implements PrimitiveSerializer<PeriodDayInfo> {
  @override
  final Iterable<Type> types = const [PeriodDayInfo, _$PeriodDayInfo];

  @override
  final String wireName = r'PeriodDayInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodDayInfo object, {
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
    yield r'isLoggedPeriodDay';
    yield serializers.serialize(
      object.isLoggedPeriodDay,
      specifiedType: const FullType(bool),
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
    yield r'isFertileWindow';
    yield serializers.serialize(
      object.isFertileWindow,
      specifiedType: const FullType(bool),
    );
    yield r'cycleDayCount';
    yield serializers.serialize(
      object.cycleDayCount,
      specifiedType: const FullType(num),
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
    PeriodDayInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodDayInfoBuilder result,
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
        case r'isLoggedPeriodDay':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isLoggedPeriodDay = valueDes;
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
        case r'isFertileWindow':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFertileWindow = valueDes;
          break;
        case r'cycleDayCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.cycleDayCount = valueDes;
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
  PeriodDayInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodDayInfoBuilder();
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

