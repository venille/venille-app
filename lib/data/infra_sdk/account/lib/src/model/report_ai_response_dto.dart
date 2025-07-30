// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_ai_response_dto.g.dart';

/// ReportAIResponseDTO
///
/// Properties:
/// * [prompt] 
/// * [responseType] - Report response type e.g \"OFFENSIVE\"
@BuiltValue()
abstract class ReportAIResponseDTO implements Built<ReportAIResponseDTO, ReportAIResponseDTOBuilder> {
  @BuiltValueField(wireName: r'prompt')
  String get prompt;

  /// Report response type e.g \"OFFENSIVE\"
  @BuiltValueField(wireName: r'responseType')
  String get responseType;

  ReportAIResponseDTO._();

  factory ReportAIResponseDTO([void updates(ReportAIResponseDTOBuilder b)]) = _$ReportAIResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportAIResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportAIResponseDTO> get serializer => _$ReportAIResponseDTOSerializer();
}

class _$ReportAIResponseDTOSerializer implements PrimitiveSerializer<ReportAIResponseDTO> {
  @override
  final Iterable<Type> types = const [ReportAIResponseDTO, _$ReportAIResponseDTO];

  @override
  final String wireName = r'ReportAIResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportAIResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'prompt';
    yield serializers.serialize(
      object.prompt,
      specifiedType: const FullType(String),
    );
    yield r'responseType';
    yield serializers.serialize(
      object.responseType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportAIResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReportAIResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'prompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.prompt = valueDes;
          break;
        case r'responseType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.responseType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportAIResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportAIResponseDTOBuilder();
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

