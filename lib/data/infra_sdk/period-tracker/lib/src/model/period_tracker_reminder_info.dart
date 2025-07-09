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
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_tracker_reminder_info.g.dart';

/// PeriodTrackerReminderInfo
///
/// Properties:
/// * [title] 
/// * [reminderTime] 
/// * [isRecurring] 
/// * [daysOfWeek] 
@BuiltValue()
abstract class PeriodTrackerReminderInfo implements Built<PeriodTrackerReminderInfo, PeriodTrackerReminderInfoBuilder> {
  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'reminderTime')
  String get reminderTime;

  @BuiltValueField(wireName: r'isRecurring')
  bool get isRecurring;

  @BuiltValueField(wireName: r'daysOfWeek')
  BuiltList<String> get daysOfWeek;

  PeriodTrackerReminderInfo._();

  factory PeriodTrackerReminderInfo([void updates(PeriodTrackerReminderInfoBuilder b)]) = _$PeriodTrackerReminderInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerReminderInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerReminderInfo> get serializer => _$PeriodTrackerReminderInfoSerializer();
}

class _$PeriodTrackerReminderInfoSerializer implements PrimitiveSerializer<PeriodTrackerReminderInfo> {
  @override
  final Iterable<Type> types = const [PeriodTrackerReminderInfo, _$PeriodTrackerReminderInfo];

  @override
  final String wireName = r'PeriodTrackerReminderInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerReminderInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'reminderTime';
    yield serializers.serialize(
      object.reminderTime,
      specifiedType: const FullType(String),
    );
    yield r'isRecurring';
    yield serializers.serialize(
      object.isRecurring,
      specifiedType: const FullType(bool),
    );
    yield r'daysOfWeek';
    yield serializers.serialize(
      object.daysOfWeek,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerReminderInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerReminderInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'reminderTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reminderTime = valueDes;
          break;
        case r'isRecurring':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isRecurring = valueDes;
          break;
        case r'daysOfWeek':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.daysOfWeek.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerReminderInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerReminderInfoBuilder();
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

