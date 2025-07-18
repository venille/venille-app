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
import 'package:period_tracker_sdk/src/model/period_tracker_week_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dashboard_tracker_info.g.dart';

/// DashboardTrackerInfo
///
/// Properties:
/// * [previousWeek] 
/// * [currentWeek] 
/// * [nextWeek] 
@BuiltValue()
abstract class DashboardTrackerInfo implements Built<DashboardTrackerInfo, DashboardTrackerInfoBuilder> {
  @BuiltValueField(wireName: r'previousWeek')
  PeriodTrackerWeekInfo get previousWeek;

  @BuiltValueField(wireName: r'currentWeek')
  PeriodTrackerWeekInfo get currentWeek;

  @BuiltValueField(wireName: r'nextWeek')
  PeriodTrackerWeekInfo get nextWeek;

  DashboardTrackerInfo._();

  factory DashboardTrackerInfo([void updates(DashboardTrackerInfoBuilder b)]) = _$DashboardTrackerInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DashboardTrackerInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DashboardTrackerInfo> get serializer => _$DashboardTrackerInfoSerializer();
}

class _$DashboardTrackerInfoSerializer implements PrimitiveSerializer<DashboardTrackerInfo> {
  @override
  final Iterable<Type> types = const [DashboardTrackerInfo, _$DashboardTrackerInfo];

  @override
  final String wireName = r'DashboardTrackerInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DashboardTrackerInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'previousWeek';
    yield serializers.serialize(
      object.previousWeek,
      specifiedType: const FullType(PeriodTrackerWeekInfo),
    );
    yield r'currentWeek';
    yield serializers.serialize(
      object.currentWeek,
      specifiedType: const FullType(PeriodTrackerWeekInfo),
    );
    yield r'nextWeek';
    yield serializers.serialize(
      object.nextWeek,
      specifiedType: const FullType(PeriodTrackerWeekInfo),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DashboardTrackerInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DashboardTrackerInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'previousWeek':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PeriodTrackerWeekInfo),
          ) as PeriodTrackerWeekInfo;
          result.previousWeek.replace(valueDes);
          break;
        case r'currentWeek':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PeriodTrackerWeekInfo),
          ) as PeriodTrackerWeekInfo;
          result.currentWeek.replace(valueDes);
          break;
        case r'nextWeek':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PeriodTrackerWeekInfo),
          ) as PeriodTrackerWeekInfo;
          result.nextWeek.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DashboardTrackerInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DashboardTrackerInfoBuilder();
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

