// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/period_year_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_tracker_history_dto.g.dart';

/// PeriodTrackerHistoryDto
///
/// Properties:
/// * [years] 
@BuiltValue()
abstract class PeriodTrackerHistoryDto implements Built<PeriodTrackerHistoryDto, PeriodTrackerHistoryDtoBuilder> {
  @BuiltValueField(wireName: r'years')
  BuiltList<PeriodYearDto> get years;

  PeriodTrackerHistoryDto._();

  factory PeriodTrackerHistoryDto([void updates(PeriodTrackerHistoryDtoBuilder b)]) = _$PeriodTrackerHistoryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodTrackerHistoryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodTrackerHistoryDto> get serializer => _$PeriodTrackerHistoryDtoSerializer();
}

class _$PeriodTrackerHistoryDtoSerializer implements PrimitiveSerializer<PeriodTrackerHistoryDto> {
  @override
  final Iterable<Type> types = const [PeriodTrackerHistoryDto, _$PeriodTrackerHistoryDto];

  @override
  final String wireName = r'PeriodTrackerHistoryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodTrackerHistoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'years';
    yield serializers.serialize(
      object.years,
      specifiedType: const FullType(BuiltList, [FullType(PeriodYearDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodTrackerHistoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodTrackerHistoryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'years':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PeriodYearDto)]),
          ) as BuiltList<PeriodYearDto>;
          result.years.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodTrackerHistoryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodTrackerHistoryDtoBuilder();
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

