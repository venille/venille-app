// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cycle_ovulation_info.g.dart';

/// CycleOvulationInfo
///
/// Properties:
/// * [cycleLength] 
/// * [periodLength] 
/// * [lutealPhaseLength] 
@BuiltValue()
abstract class CycleOvulationInfo implements Built<CycleOvulationInfo, CycleOvulationInfoBuilder> {
  @BuiltValueField(wireName: r'cycleLength')
  num get cycleLength;

  @BuiltValueField(wireName: r'periodLength')
  num get periodLength;

  @BuiltValueField(wireName: r'lutealPhaseLength')
  num get lutealPhaseLength;

  CycleOvulationInfo._();

  factory CycleOvulationInfo([void updates(CycleOvulationInfoBuilder b)]) = _$CycleOvulationInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CycleOvulationInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CycleOvulationInfo> get serializer => _$CycleOvulationInfoSerializer();
}

class _$CycleOvulationInfoSerializer implements PrimitiveSerializer<CycleOvulationInfo> {
  @override
  final Iterable<Type> types = const [CycleOvulationInfo, _$CycleOvulationInfo];

  @override
  final String wireName = r'CycleOvulationInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CycleOvulationInfo object, {
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
    CycleOvulationInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CycleOvulationInfoBuilder result,
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
  CycleOvulationInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CycleOvulationInfoBuilder();
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

