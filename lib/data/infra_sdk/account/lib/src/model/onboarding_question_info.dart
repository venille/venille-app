// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'onboarding_question_info.g.dart';

/// OnboardingQuestionInfo
///
/// Properties:
/// * [id] 
/// * [question] 
/// * [questionType] 
/// * [optionType] 
/// * [enumType] 
/// * [options] 
/// * [isUserInput] 
/// * [position] 
@BuiltValue()
abstract class OnboardingQuestionInfo implements Built<OnboardingQuestionInfo, OnboardingQuestionInfoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'question')
  String get question;

  @BuiltValueField(wireName: r'questionType')
  String get questionType;

  @BuiltValueField(wireName: r'optionType')
  String get optionType;

  @BuiltValueField(wireName: r'enumType')
  String get enumType;

  @BuiltValueField(wireName: r'options')
  BuiltList<String> get options;

  @BuiltValueField(wireName: r'isUserInput')
  bool get isUserInput;

  @BuiltValueField(wireName: r'position')
  num get position;

  OnboardingQuestionInfo._();

  factory OnboardingQuestionInfo([void updates(OnboardingQuestionInfoBuilder b)]) = _$OnboardingQuestionInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OnboardingQuestionInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OnboardingQuestionInfo> get serializer => _$OnboardingQuestionInfoSerializer();
}

class _$OnboardingQuestionInfoSerializer implements PrimitiveSerializer<OnboardingQuestionInfo> {
  @override
  final Iterable<Type> types = const [OnboardingQuestionInfo, _$OnboardingQuestionInfo];

  @override
  final String wireName = r'OnboardingQuestionInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OnboardingQuestionInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'question';
    yield serializers.serialize(
      object.question,
      specifiedType: const FullType(String),
    );
    yield r'questionType';
    yield serializers.serialize(
      object.questionType,
      specifiedType: const FullType(String),
    );
    yield r'optionType';
    yield serializers.serialize(
      object.optionType,
      specifiedType: const FullType(String),
    );
    yield r'enumType';
    yield serializers.serialize(
      object.enumType,
      specifiedType: const FullType(String),
    );
    yield r'options';
    yield serializers.serialize(
      object.options,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'isUserInput';
    yield serializers.serialize(
      object.isUserInput,
      specifiedType: const FullType(bool),
    );
    yield r'position';
    yield serializers.serialize(
      object.position,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    OnboardingQuestionInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OnboardingQuestionInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'question':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.question = valueDes;
          break;
        case r'questionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.questionType = valueDes;
          break;
        case r'optionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.optionType = valueDes;
          break;
        case r'enumType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.enumType = valueDes;
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.options.replace(valueDes);
          break;
        case r'isUserInput':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isUserInput = valueDes;
          break;
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.position = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OnboardingQuestionInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OnboardingQuestionInfoBuilder();
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

