// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_cycle_and_ovulation_settings_dto.g.dart';

/// UpdateCycleAndOvulationSettingsDto
///
/// Properties:
/// * [cycleLength] 
/// * [periodLength] 
/// * [lutealPhaseLength] 
@BuiltValue()
abstract class UpdateCycleAndOvulationSettingsDto implements Built<UpdateCycleAndOvulationSettingsDto, UpdateCycleAndOvulationSettingsDtoBuilder> {
  @BuiltValueField(wireName: r'cycleLength')
  num get cycleLength;

  @BuiltValueField(wireName: r'periodLength')
  num get periodLength;

  @BuiltValueField(wireName: r'lutealPhaseLength')
  num get lutealPhaseLength;

  UpdateCycleAndOvulationSettingsDto._();

  factory UpdateCycleAndOvulationSettingsDto([void updates(UpdateCycleAndOvulationSettingsDtoBuilder b)]) = _$UpdateCycleAndOvulationSettingsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCycleAndOvulationSettingsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCycleAndOvulationSettingsDto> get serializer => _$UpdateCycleAndOvulationSettingsDtoSerializer();
}

class _$UpdateCycleAndOvulationSettingsDtoSerializer implements PrimitiveSerializer<UpdateCycleAndOvulationSettingsDto> {
  @override
  final Iterable<Type> types = const [UpdateCycleAndOvulationSettingsDto, _$UpdateCycleAndOvulationSettingsDto];

  @override
  final String wireName = r'UpdateCycleAndOvulationSettingsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCycleAndOvulationSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cycleLength';
    yield serializers.serialize(
      object.cycleLength,
      specifiedType: const FullType(num),
    );
    yield r'periodLength';
    yield serializers.serialize(
      object.periodLength,
      specifiedType: const FullType(num),
    );
    yield r'lutealPhaseLength';
    yield serializers.serialize(
      object.lutealPhaseLength,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateCycleAndOvulationSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateCycleAndOvulationSettingsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cycleLength':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.cycleLength = valueDes;
          break;
        case r'periodLength':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.periodLength = valueDes;
          break;
        case r'lutealPhaseLength':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.lutealPhaseLength = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateCycleAndOvulationSettingsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCycleAndOvulationSettingsDtoBuilder();
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

