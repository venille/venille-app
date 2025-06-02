// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_forum_dto.g.dart';

/// CreateForumDto
///
/// Properties:
/// * [title] - The title of the forum
/// * [description] - The description of the forum
/// * [image] - The image of the forum
/// * [category] - The category of the forum
@BuiltValue()
abstract class CreateForumDto implements Built<CreateForumDto, CreateForumDtoBuilder> {
  /// The title of the forum
  @BuiltValueField(wireName: r'title')
  String get title;

  /// The description of the forum
  @BuiltValueField(wireName: r'description')
  String get description;

  /// The image of the forum
  @BuiltValueField(wireName: r'image')
  String get image;

  /// The category of the forum
  @BuiltValueField(wireName: r'category')
  CreateForumDtoCategoryEnum get category;
  // enum categoryEnum {  general,  health,  fitness,  nutrition,  mental-health,  menstrual-cycle,  sexual-health,  contraception,  relationships,  family,  beauty-and-wellness,  pregnancy,  parenthood,  };

  CreateForumDto._();

  factory CreateForumDto([void updates(CreateForumDtoBuilder b)]) = _$CreateForumDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateForumDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateForumDto> get serializer => _$CreateForumDtoSerializer();
}

class _$CreateForumDtoSerializer implements PrimitiveSerializer<CreateForumDto> {
  @override
  final Iterable<Type> types = const [CreateForumDto, _$CreateForumDto];

  @override
  final String wireName = r'CreateForumDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateForumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'image';
    yield serializers.serialize(
      object.image,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(CreateForumDtoCategoryEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateForumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateForumDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'image':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.image = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateForumDtoCategoryEnum),
          ) as CreateForumDtoCategoryEnum;
          result.category = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateForumDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateForumDtoBuilder();
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

class CreateForumDtoCategoryEnum extends EnumClass {

  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'general')
  static const CreateForumDtoCategoryEnum general = _$createForumDtoCategoryEnum_general;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'health')
  static const CreateForumDtoCategoryEnum health = _$createForumDtoCategoryEnum_health;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'fitness')
  static const CreateForumDtoCategoryEnum fitness = _$createForumDtoCategoryEnum_fitness;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'nutrition')
  static const CreateForumDtoCategoryEnum nutrition = _$createForumDtoCategoryEnum_nutrition;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'mental-health')
  static const CreateForumDtoCategoryEnum mentalHealth = _$createForumDtoCategoryEnum_mentalHealth;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'menstrual-cycle')
  static const CreateForumDtoCategoryEnum menstrualCycle = _$createForumDtoCategoryEnum_menstrualCycle;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'sexual-health')
  static const CreateForumDtoCategoryEnum sexualHealth = _$createForumDtoCategoryEnum_sexualHealth;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'contraception')
  static const CreateForumDtoCategoryEnum contraception = _$createForumDtoCategoryEnum_contraception;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'relationships')
  static const CreateForumDtoCategoryEnum relationships = _$createForumDtoCategoryEnum_relationships;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'family')
  static const CreateForumDtoCategoryEnum family = _$createForumDtoCategoryEnum_family;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'beauty-and-wellness')
  static const CreateForumDtoCategoryEnum beautyAndWellness = _$createForumDtoCategoryEnum_beautyAndWellness;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'pregnancy')
  static const CreateForumDtoCategoryEnum pregnancy = _$createForumDtoCategoryEnum_pregnancy;
  /// The category of the forum
  @BuiltValueEnumConst(wireName: r'parenthood')
  static const CreateForumDtoCategoryEnum parenthood = _$createForumDtoCategoryEnum_parenthood;

  static Serializer<CreateForumDtoCategoryEnum> get serializer => _$createForumDtoCategoryEnumSerializer;

  const CreateForumDtoCategoryEnum._(String name): super(name);

  static BuiltSet<CreateForumDtoCategoryEnum> get values => _$createForumDtoCategoryEnumValues;
  static CreateForumDtoCategoryEnum valueOf(String name) => _$createForumDtoCategoryEnumValueOf(name);
}

