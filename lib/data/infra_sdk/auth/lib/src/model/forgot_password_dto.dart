// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forgot_password_dto.g.dart';

/// ForgotPasswordDTO
///
/// Properties:
/// * [email] - Account email.
@BuiltValue()
abstract class ForgotPasswordDTO implements Built<ForgotPasswordDTO, ForgotPasswordDTOBuilder> {
  /// Account email.
  @BuiltValueField(wireName: r'email')
  String get email;

  ForgotPasswordDTO._();

  factory ForgotPasswordDTO([void updates(ForgotPasswordDTOBuilder b)]) = _$ForgotPasswordDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ForgotPasswordDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ForgotPasswordDTO> get serializer => _$ForgotPasswordDTOSerializer();
}

class _$ForgotPasswordDTOSerializer implements PrimitiveSerializer<ForgotPasswordDTO> {
  @override
  final Iterable<Type> types = const [ForgotPasswordDTO, _$ForgotPasswordDTO];

  @override
  final String wireName = r'ForgotPasswordDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ForgotPasswordDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ForgotPasswordDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ForgotPasswordDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ForgotPasswordDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForgotPasswordDTOBuilder();
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

