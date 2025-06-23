// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_symptom_dto.g.dart';

/// PeriodSymptomDto
///
/// Properties:
/// * [symptomType] 
/// * [symptoms] 
@BuiltValue()
abstract class PeriodSymptomDto implements Built<PeriodSymptomDto, PeriodSymptomDtoBuilder> {
  @BuiltValueField(wireName: r'symptomType')
  String get symptomType;

  @BuiltValueField(wireName: r'symptoms')
  String get symptoms;

  PeriodSymptomDto._();

  factory PeriodSymptomDto([void updates(PeriodSymptomDtoBuilder b)]) = _$PeriodSymptomDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodSymptomDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodSymptomDto> get serializer => _$PeriodSymptomDtoSerializer();
}

class _$PeriodSymptomDtoSerializer implements PrimitiveSerializer<PeriodSymptomDto> {
  @override
  final Iterable<Type> types = const [PeriodSymptomDto, _$PeriodSymptomDto];

  @override
  final String wireName = r'PeriodSymptomDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodSymptomDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'symptomType';
    yield serializers.serialize(
      object.symptomType,
      specifiedType: const FullType(String),
    );
    yield r'symptoms';
    yield serializers.serialize(
      object.symptoms,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodSymptomDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodSymptomDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'symptomType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.symptomType = valueDes;
          break;
        case r'symptoms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.symptoms = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodSymptomDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodSymptomDtoBuilder();
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

