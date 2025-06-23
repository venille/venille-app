// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:period_tracker_sdk/src/model/period_month_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_year_dto.g.dart';

/// PeriodYearDto
///
/// Properties:
/// * [year] 
/// * [months] 
@BuiltValue()
abstract class PeriodYearDto implements Built<PeriodYearDto, PeriodYearDtoBuilder> {
  @BuiltValueField(wireName: r'year')
  num get year;

  @BuiltValueField(wireName: r'months')
  BuiltList<PeriodMonthDto> get months;

  PeriodYearDto._();

  factory PeriodYearDto([void updates(PeriodYearDtoBuilder b)]) = _$PeriodYearDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodYearDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodYearDto> get serializer => _$PeriodYearDtoSerializer();
}

class _$PeriodYearDtoSerializer implements PrimitiveSerializer<PeriodYearDto> {
  @override
  final Iterable<Type> types = const [PeriodYearDto, _$PeriodYearDto];

  @override
  final String wireName = r'PeriodYearDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodYearDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'year';
    yield serializers.serialize(
      object.year,
      specifiedType: const FullType(num),
    );
    yield r'months';
    yield serializers.serialize(
      object.months,
      specifiedType: const FullType(BuiltList, [FullType(PeriodMonthDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodYearDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodYearDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.year = valueDes;
          break;
        case r'months':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PeriodMonthDto)]),
          ) as BuiltList<PeriodMonthDto>;
          result.months.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodYearDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodYearDtoBuilder();
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

