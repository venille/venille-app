// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_month_dto.g.dart';

/// PeriodMonthDto
///
/// Properties:
/// * [startDate] 
/// * [endDate] 
@BuiltValue()
abstract class PeriodMonthDto implements Built<PeriodMonthDto, PeriodMonthDtoBuilder> {
  @BuiltValueField(wireName: r'startDate')
  String get startDate;

  @BuiltValueField(wireName: r'endDate')
  String get endDate;

  PeriodMonthDto._();

  factory PeriodMonthDto([void updates(PeriodMonthDtoBuilder b)]) = _$PeriodMonthDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodMonthDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodMonthDto> get serializer => _$PeriodMonthDtoSerializer();
}

class _$PeriodMonthDtoSerializer implements PrimitiveSerializer<PeriodMonthDto> {
  @override
  final Iterable<Type> types = const [PeriodMonthDto, _$PeriodMonthDto];

  @override
  final String wireName = r'PeriodMonthDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodMonthDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'startDate';
    yield serializers.serialize(
      object.startDate,
      specifiedType: const FullType(String),
    );
    yield r'endDate';
    yield serializers.serialize(
      object.endDate,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodMonthDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodMonthDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'startDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.startDate = valueDes;
          break;
        case r'endDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.endDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodMonthDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodMonthDtoBuilder();
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

