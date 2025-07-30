// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_period_tracker_dto.g.dart';

/// RegisterPeriodTrackerDTO
///
/// Properties:
/// * [lastPeriodStartDate] - Date of first period.
/// * [periodLengthDays] - Length of period in days.
/// * [cycleLengthDays] - Length of cycle in days.
/// * [irregularPeriods] - Is the period irregular?
/// * [periodSymptoms] - Period symptoms.
/// * [trackingOvulation] - Is the user tracking ovulation?
/// * [age] - Age of the user.
/// * [birthControlMethods] - Birth control method.
/// * [healthConditions] - Health condition.
@BuiltValue()
abstract class RegisterPeriodTrackerDTO implements Built<RegisterPeriodTrackerDTO, RegisterPeriodTrackerDTOBuilder> {
  /// Date of first period.
  @BuiltValueField(wireName: r'lastPeriodStartDate')
  String get lastPeriodStartDate;

  /// Length of period in days.
  @BuiltValueField(wireName: r'periodLengthDays')
  num get periodLengthDays;

  /// Length of cycle in days.
  @BuiltValueField(wireName: r'cycleLengthDays')
  num get cycleLengthDays;

  /// Is the period irregular?
  @BuiltValueField(wireName: r'irregularPeriods')
  bool get irregularPeriods;

  /// Period symptoms.
  @BuiltValueField(wireName: r'periodSymptoms')
  String get periodSymptoms;

  /// Is the user tracking ovulation?
  @BuiltValueField(wireName: r'trackingOvulation')
  bool get trackingOvulation;

  /// Age of the user.
  @BuiltValueField(wireName: r'age')
  num get age;

  /// Birth control method.
  @BuiltValueField(wireName: r'birthControlMethods')
  String get birthControlMethods;

  /// Health condition.
  @BuiltValueField(wireName: r'healthConditions')
  String get healthConditions;

  RegisterPeriodTrackerDTO._();

  factory RegisterPeriodTrackerDTO([void updates(RegisterPeriodTrackerDTOBuilder b)]) = _$RegisterPeriodTrackerDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterPeriodTrackerDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterPeriodTrackerDTO> get serializer => _$RegisterPeriodTrackerDTOSerializer();
}

class _$RegisterPeriodTrackerDTOSerializer implements PrimitiveSerializer<RegisterPeriodTrackerDTO> {
  @override
  final Iterable<Type> types = const [RegisterPeriodTrackerDTO, _$RegisterPeriodTrackerDTO];

  @override
  final String wireName = r'RegisterPeriodTrackerDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterPeriodTrackerDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'lastPeriodStartDate';
    yield serializers.serialize(
      object.lastPeriodStartDate,
      specifiedType: const FullType(String),
    );
    yield r'periodLengthDays';
    yield serializers.serialize(
      object.periodLengthDays,
      specifiedType: const FullType(num),
    );
    yield r'cycleLengthDays';
    yield serializers.serialize(
      object.cycleLengthDays,
      specifiedType: const FullType(num),
    );
    yield r'irregularPeriods';
    yield serializers.serialize(
      object.irregularPeriods,
      specifiedType: const FullType(bool),
    );
    yield r'periodSymptoms';
    yield serializers.serialize(
      object.periodSymptoms,
      specifiedType: const FullType(String),
    );
    yield r'trackingOvulation';
    yield serializers.serialize(
      object.trackingOvulation,
      specifiedType: const FullType(bool),
    );
    yield r'age';
    yield serializers.serialize(
      object.age,
      specifiedType: const FullType(num),
    );
    yield r'birthControlMethods';
    yield serializers.serialize(
      object.birthControlMethods,
      specifiedType: const FullType(String),
    );
    yield r'healthConditions';
    yield serializers.serialize(
      object.healthConditions,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterPeriodTrackerDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterPeriodTrackerDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'lastPeriodStartDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastPeriodStartDate = valueDes;
          break;
        case r'periodLengthDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.periodLengthDays = valueDes;
          break;
        case r'cycleLengthDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.cycleLengthDays = valueDes;
          break;
        case r'irregularPeriods':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.irregularPeriods = valueDes;
          break;
        case r'periodSymptoms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.periodSymptoms = valueDes;
          break;
        case r'trackingOvulation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.trackingOvulation = valueDes;
          break;
        case r'age':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.age = valueDes;
          break;
        case r'birthControlMethods':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.birthControlMethods = valueDes;
          break;
        case r'healthConditions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.healthConditions = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterPeriodTrackerDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterPeriodTrackerDTOBuilder();
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

