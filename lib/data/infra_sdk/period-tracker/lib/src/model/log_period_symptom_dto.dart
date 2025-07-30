// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:period_tracker_sdk/src/model/period_symptom_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'log_period_symptom_dto.g.dart';

/// LogPeriodSymptomDto
///
/// Properties:
/// * [date] 
/// * [symptoms] 
@BuiltValue()
abstract class LogPeriodSymptomDto implements Built<LogPeriodSymptomDto, LogPeriodSymptomDtoBuilder> {
  @BuiltValueField(wireName: r'date')
  String get date;

  @BuiltValueField(wireName: r'symptoms')
  BuiltList<PeriodSymptomDto> get symptoms;

  LogPeriodSymptomDto._();

  factory LogPeriodSymptomDto([void updates(LogPeriodSymptomDtoBuilder b)]) = _$LogPeriodSymptomDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LogPeriodSymptomDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LogPeriodSymptomDto> get serializer => _$LogPeriodSymptomDtoSerializer();
}

class _$LogPeriodSymptomDtoSerializer implements PrimitiveSerializer<LogPeriodSymptomDto> {
  @override
  final Iterable<Type> types = const [LogPeriodSymptomDto, _$LogPeriodSymptomDto];

  @override
  final String wireName = r'LogPeriodSymptomDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LogPeriodSymptomDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'date';
    yield serializers.serialize(
      object.date,
      specifiedType: const FullType(String),
    );
    yield r'symptoms';
    yield serializers.serialize(
      object.symptoms,
      specifiedType: const FullType(BuiltList, [FullType(PeriodSymptomDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LogPeriodSymptomDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LogPeriodSymptomDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.date = valueDes;
          break;
        case r'symptoms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PeriodSymptomDto)]),
          ) as BuiltList<PeriodSymptomDto>;
          result.symptoms.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LogPeriodSymptomDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LogPeriodSymptomDtoBuilder();
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

