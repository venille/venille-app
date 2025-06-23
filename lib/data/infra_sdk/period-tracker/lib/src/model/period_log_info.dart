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
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'period_log_info.g.dart';

/// PeriodLogInfo
///
/// Properties:
/// * [startDate] 
/// * [endDate] 
/// * [isPredicted] 
@BuiltValue()
abstract class PeriodLogInfo implements Built<PeriodLogInfo, PeriodLogInfoBuilder> {
  @BuiltValueField(wireName: r'startDate')
  DateTime get startDate;

  @BuiltValueField(wireName: r'endDate')
  DateTime get endDate;

  @BuiltValueField(wireName: r'isPredicted')
  bool get isPredicted;

  PeriodLogInfo._();

  factory PeriodLogInfo([void updates(PeriodLogInfoBuilder b)]) = _$PeriodLogInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PeriodLogInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PeriodLogInfo> get serializer => _$PeriodLogInfoSerializer();
}

class _$PeriodLogInfoSerializer implements PrimitiveSerializer<PeriodLogInfo> {
  @override
  final Iterable<Type> types = const [PeriodLogInfo, _$PeriodLogInfo];

  @override
  final String wireName = r'PeriodLogInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PeriodLogInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'startDate';
    yield serializers.serialize(
      object.startDate,
      specifiedType: const FullType(DateTime),
    );
    yield r'endDate';
    yield serializers.serialize(
      object.endDate,
      specifiedType: const FullType(DateTime),
    );
    yield r'isPredicted';
    yield serializers.serialize(
      object.isPredicted,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PeriodLogInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PeriodLogInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'startDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startDate = valueDes;
          break;
        case r'endDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endDate = valueDes;
          break;
        case r'isPredicted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPredicted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PeriodLogInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PeriodLogInfoBuilder();
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

