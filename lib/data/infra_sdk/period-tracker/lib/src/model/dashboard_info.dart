// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:period_tracker_sdk/src/model/menstrual_phase_info.dart';
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/previous_cycle_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dashboard_info.g.dart';

/// DashboardInfo
///
/// Properties:
/// * [previousCycleInfo] - The previous cycle info
/// * [menstrualPhases] - The menstrual phase info
@BuiltValue()
abstract class DashboardInfo implements Built<DashboardInfo, DashboardInfoBuilder> {
  /// The previous cycle info
  @BuiltValueField(wireName: r'previousCycleInfo')
  PreviousCycleInfo get previousCycleInfo;

  /// The menstrual phase info
  @BuiltValueField(wireName: r'menstrualPhases')
  BuiltList<MenstrualPhaseInfo> get menstrualPhases;

  DashboardInfo._();

  factory DashboardInfo([void updates(DashboardInfoBuilder b)]) = _$DashboardInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DashboardInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DashboardInfo> get serializer => _$DashboardInfoSerializer();
}

class _$DashboardInfoSerializer implements PrimitiveSerializer<DashboardInfo> {
  @override
  final Iterable<Type> types = const [DashboardInfo, _$DashboardInfo];

  @override
  final String wireName = r'DashboardInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DashboardInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'previousCycleInfo';
    yield serializers.serialize(
      object.previousCycleInfo,
      specifiedType: const FullType(PreviousCycleInfo),
    );
    yield r'menstrualPhases';
    yield serializers.serialize(
      object.menstrualPhases,
      specifiedType: const FullType(BuiltList, [FullType(MenstrualPhaseInfo)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DashboardInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DashboardInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'previousCycleInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PreviousCycleInfo),
          ) as PreviousCycleInfo;
          result.previousCycleInfo.replace(valueDes);
          break;
        case r'menstrualPhases':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MenstrualPhaseInfo)]),
          ) as BuiltList<MenstrualPhaseInfo>;
          result.menstrualPhases.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DashboardInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DashboardInfoBuilder();
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

