// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
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
/// * [cycleGoal] - Cycle goal.
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
  RegisterPeriodTrackerDTOPeriodSymptomsEnum get periodSymptoms;
  // enum periodSymptomsEnum {  cramps,  bloating,  mood_swings,  headache,  acne,  fatigue,  tender_breasts,  nausea,  other,  };

  /// Is the user tracking ovulation?
  @BuiltValueField(wireName: r'trackingOvulation')
  bool get trackingOvulation;

  /// Age of the user.
  @BuiltValueField(wireName: r'age')
  num get age;

  /// Birth control method.
  @BuiltValueField(wireName: r'birthControlMethods')
  RegisterPeriodTrackerDTOBirthControlMethodsEnum get birthControlMethods;
  // enum birthControlMethodsEnum {  none,  pill,  iud,  implant,  injection,  patch,  condom,  natural,  other,  };

  /// Health condition.
  @BuiltValueField(wireName: r'healthConditions')
  RegisterPeriodTrackerDTOHealthConditionsEnum get healthConditions;
  // enum healthConditionsEnum {  pcos,  endometriosis,  thyroid,  diabetes,  fibroids,  blood_disorder,  other,  };

  /// Cycle goal.
  @BuiltValueField(wireName: r'cycleGoal')
  RegisterPeriodTrackerDTOCycleGoalEnum get cycleGoal;
  // enum cycleGoalEnum {  just_tracking,  trying_to_conceive,  avoiding_pregnancy,  monitoring_health,  };

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
      specifiedType: const FullType(RegisterPeriodTrackerDTOPeriodSymptomsEnum),
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
      specifiedType: const FullType(RegisterPeriodTrackerDTOBirthControlMethodsEnum),
    );
    yield r'healthConditions';
    yield serializers.serialize(
      object.healthConditions,
      specifiedType: const FullType(RegisterPeriodTrackerDTOHealthConditionsEnum),
    );
    yield r'cycleGoal';
    yield serializers.serialize(
      object.cycleGoal,
      specifiedType: const FullType(RegisterPeriodTrackerDTOCycleGoalEnum),
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
            specifiedType: const FullType(RegisterPeriodTrackerDTOPeriodSymptomsEnum),
          ) as RegisterPeriodTrackerDTOPeriodSymptomsEnum;
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
            specifiedType: const FullType(RegisterPeriodTrackerDTOBirthControlMethodsEnum),
          ) as RegisterPeriodTrackerDTOBirthControlMethodsEnum;
          result.birthControlMethods = valueDes;
          break;
        case r'healthConditions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RegisterPeriodTrackerDTOHealthConditionsEnum),
          ) as RegisterPeriodTrackerDTOHealthConditionsEnum;
          result.healthConditions = valueDes;
          break;
        case r'cycleGoal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RegisterPeriodTrackerDTOCycleGoalEnum),
          ) as RegisterPeriodTrackerDTOCycleGoalEnum;
          result.cycleGoal = valueDes;
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

class RegisterPeriodTrackerDTOPeriodSymptomsEnum extends EnumClass {

  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'cramps')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum cramps = _$registerPeriodTrackerDTOPeriodSymptomsEnum_cramps;
  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'bloating')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum bloating = _$registerPeriodTrackerDTOPeriodSymptomsEnum_bloating;
  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'mood_swings')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum moodSwings = _$registerPeriodTrackerDTOPeriodSymptomsEnum_moodSwings;
  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'headache')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum headache = _$registerPeriodTrackerDTOPeriodSymptomsEnum_headache;
  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'acne')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum acne = _$registerPeriodTrackerDTOPeriodSymptomsEnum_acne;
  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'fatigue')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum fatigue = _$registerPeriodTrackerDTOPeriodSymptomsEnum_fatigue;
  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'tender_breasts')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum tenderBreasts = _$registerPeriodTrackerDTOPeriodSymptomsEnum_tenderBreasts;
  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'nausea')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum nausea = _$registerPeriodTrackerDTOPeriodSymptomsEnum_nausea;
  /// Period symptoms.
  @BuiltValueEnumConst(wireName: r'other')
  static const RegisterPeriodTrackerDTOPeriodSymptomsEnum other = _$registerPeriodTrackerDTOPeriodSymptomsEnum_other;

  static Serializer<RegisterPeriodTrackerDTOPeriodSymptomsEnum> get serializer => _$registerPeriodTrackerDTOPeriodSymptomsEnumSerializer;

  const RegisterPeriodTrackerDTOPeriodSymptomsEnum._(String name): super(name);

  static BuiltSet<RegisterPeriodTrackerDTOPeriodSymptomsEnum> get values => _$registerPeriodTrackerDTOPeriodSymptomsEnumValues;
  static RegisterPeriodTrackerDTOPeriodSymptomsEnum valueOf(String name) => _$registerPeriodTrackerDTOPeriodSymptomsEnumValueOf(name);
}

class RegisterPeriodTrackerDTOBirthControlMethodsEnum extends EnumClass {

  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'none')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum none = _$registerPeriodTrackerDTOBirthControlMethodsEnum_none;
  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'pill')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum pill = _$registerPeriodTrackerDTOBirthControlMethodsEnum_pill;
  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'iud')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum iud = _$registerPeriodTrackerDTOBirthControlMethodsEnum_iud;
  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'implant')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum implant = _$registerPeriodTrackerDTOBirthControlMethodsEnum_implant;
  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'injection')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum injection = _$registerPeriodTrackerDTOBirthControlMethodsEnum_injection;
  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'patch')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum patch_ = _$registerPeriodTrackerDTOBirthControlMethodsEnum_patch_;
  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'condom')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum condom = _$registerPeriodTrackerDTOBirthControlMethodsEnum_condom;
  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'natural')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum natural = _$registerPeriodTrackerDTOBirthControlMethodsEnum_natural;
  /// Birth control method.
  @BuiltValueEnumConst(wireName: r'other')
  static const RegisterPeriodTrackerDTOBirthControlMethodsEnum other = _$registerPeriodTrackerDTOBirthControlMethodsEnum_other;

  static Serializer<RegisterPeriodTrackerDTOBirthControlMethodsEnum> get serializer => _$registerPeriodTrackerDTOBirthControlMethodsEnumSerializer;

  const RegisterPeriodTrackerDTOBirthControlMethodsEnum._(String name): super(name);

  static BuiltSet<RegisterPeriodTrackerDTOBirthControlMethodsEnum> get values => _$registerPeriodTrackerDTOBirthControlMethodsEnumValues;
  static RegisterPeriodTrackerDTOBirthControlMethodsEnum valueOf(String name) => _$registerPeriodTrackerDTOBirthControlMethodsEnumValueOf(name);
}

class RegisterPeriodTrackerDTOHealthConditionsEnum extends EnumClass {

  /// Health condition.
  @BuiltValueEnumConst(wireName: r'pcos')
  static const RegisterPeriodTrackerDTOHealthConditionsEnum pcos = _$registerPeriodTrackerDTOHealthConditionsEnum_pcos;
  /// Health condition.
  @BuiltValueEnumConst(wireName: r'endometriosis')
  static const RegisterPeriodTrackerDTOHealthConditionsEnum endometriosis = _$registerPeriodTrackerDTOHealthConditionsEnum_endometriosis;
  /// Health condition.
  @BuiltValueEnumConst(wireName: r'thyroid')
  static const RegisterPeriodTrackerDTOHealthConditionsEnum thyroid = _$registerPeriodTrackerDTOHealthConditionsEnum_thyroid;
  /// Health condition.
  @BuiltValueEnumConst(wireName: r'diabetes')
  static const RegisterPeriodTrackerDTOHealthConditionsEnum diabetes = _$registerPeriodTrackerDTOHealthConditionsEnum_diabetes;
  /// Health condition.
  @BuiltValueEnumConst(wireName: r'fibroids')
  static const RegisterPeriodTrackerDTOHealthConditionsEnum fibroids = _$registerPeriodTrackerDTOHealthConditionsEnum_fibroids;
  /// Health condition.
  @BuiltValueEnumConst(wireName: r'blood_disorder')
  static const RegisterPeriodTrackerDTOHealthConditionsEnum bloodDisorder = _$registerPeriodTrackerDTOHealthConditionsEnum_bloodDisorder;
  /// Health condition.
  @BuiltValueEnumConst(wireName: r'other')
  static const RegisterPeriodTrackerDTOHealthConditionsEnum other = _$registerPeriodTrackerDTOHealthConditionsEnum_other;

  static Serializer<RegisterPeriodTrackerDTOHealthConditionsEnum> get serializer => _$registerPeriodTrackerDTOHealthConditionsEnumSerializer;

  const RegisterPeriodTrackerDTOHealthConditionsEnum._(String name): super(name);

  static BuiltSet<RegisterPeriodTrackerDTOHealthConditionsEnum> get values => _$registerPeriodTrackerDTOHealthConditionsEnumValues;
  static RegisterPeriodTrackerDTOHealthConditionsEnum valueOf(String name) => _$registerPeriodTrackerDTOHealthConditionsEnumValueOf(name);
}

class RegisterPeriodTrackerDTOCycleGoalEnum extends EnumClass {

  /// Cycle goal.
  @BuiltValueEnumConst(wireName: r'just_tracking')
  static const RegisterPeriodTrackerDTOCycleGoalEnum justTracking = _$registerPeriodTrackerDTOCycleGoalEnum_justTracking;
  /// Cycle goal.
  @BuiltValueEnumConst(wireName: r'trying_to_conceive')
  static const RegisterPeriodTrackerDTOCycleGoalEnum tryingToConceive = _$registerPeriodTrackerDTOCycleGoalEnum_tryingToConceive;
  /// Cycle goal.
  @BuiltValueEnumConst(wireName: r'avoiding_pregnancy')
  static const RegisterPeriodTrackerDTOCycleGoalEnum avoidingPregnancy = _$registerPeriodTrackerDTOCycleGoalEnum_avoidingPregnancy;
  /// Cycle goal.
  @BuiltValueEnumConst(wireName: r'monitoring_health')
  static const RegisterPeriodTrackerDTOCycleGoalEnum monitoringHealth = _$registerPeriodTrackerDTOCycleGoalEnum_monitoringHealth;

  static Serializer<RegisterPeriodTrackerDTOCycleGoalEnum> get serializer => _$registerPeriodTrackerDTOCycleGoalEnumSerializer;

  const RegisterPeriodTrackerDTOCycleGoalEnum._(String name): super(name);

  static BuiltSet<RegisterPeriodTrackerDTOCycleGoalEnum> get values => _$registerPeriodTrackerDTOCycleGoalEnumValues;
  static RegisterPeriodTrackerDTOCycleGoalEnum valueOf(String name) => _$registerPeriodTrackerDTOCycleGoalEnumValueOf(name);
}

