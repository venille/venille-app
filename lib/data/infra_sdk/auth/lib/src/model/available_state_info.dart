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

part 'available_state_info.g.dart';

/// AvailableStateInfo
///
/// Properties:
/// * [state] - Name of the state.
/// * [stateId] - Value of the state.
/// * [lgas] - Name of the state.
@BuiltValue()
abstract class AvailableStateInfo implements Built<AvailableStateInfo, AvailableStateInfoBuilder> {
  /// Name of the state.
  @BuiltValueField(wireName: r'state')
  String get state;

  /// Value of the state.
  @BuiltValueField(wireName: r'stateId')
  String get stateId;

  /// Name of the state.
  @BuiltValueField(wireName: r'lgas')
  BuiltList<String> get lgas;

  AvailableStateInfo._();

  factory AvailableStateInfo([void updates(AvailableStateInfoBuilder b)]) = _$AvailableStateInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AvailableStateInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AvailableStateInfo> get serializer => _$AvailableStateInfoSerializer();
}

class _$AvailableStateInfoSerializer implements PrimitiveSerializer<AvailableStateInfo> {
  @override
  final Iterable<Type> types = const [AvailableStateInfo, _$AvailableStateInfo];

  @override
  final String wireName = r'AvailableStateInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AvailableStateInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'state';
    yield serializers.serialize(
      object.state,
      specifiedType: const FullType(String),
    );
    yield r'stateId';
    yield serializers.serialize(
      object.stateId,
      specifiedType: const FullType(String),
    );
    yield r'lgas';
    yield serializers.serialize(
      object.lgas,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AvailableStateInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AvailableStateInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.state = valueDes;
          break;
        case r'stateId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.stateId = valueDes;
          break;
        case r'lgas':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.lgas.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AvailableStateInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AvailableStateInfoBuilder();
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

