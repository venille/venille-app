// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'course_info.g.dart';

/// CourseInfo
///
/// Properties:
/// * [id] - Course ID (Auto generated).
/// * [title] - Course info title e.g Understanding Your Body.
/// * [description] - Course info description e.g This course is about understanding your body.
/// * [coverPhoto] - Course info cover photo e.g https://example.com/cover-photo.jpg.
/// * [category] - Course info category e.g understanding-your-body.
@BuiltValue()
abstract class CourseInfo implements Built<CourseInfo, CourseInfoBuilder> {
  /// Course ID (Auto generated).
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Course info title e.g Understanding Your Body.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Course info description e.g This course is about understanding your body.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Course info cover photo e.g https://example.com/cover-photo.jpg.
  @BuiltValueField(wireName: r'coverPhoto')
  String get coverPhoto;

  /// Course info category e.g understanding-your-body.
  @BuiltValueField(wireName: r'category')
  CourseInfoCategoryEnum get category;
  // enum categoryEnum {  understanding-your-body,  sexual-pleasure-and-wellness,  mental-and-emotional-well-being,  menopause-and-midlife-health,  contraception-and-family-planning,  menstrual-health-and-hygiene,  sexual-and-reproductive-rights,  sexually-transmitted-infections,  fertility-and-infertility,  pregnancy-and-postpartum-care,  };

  CourseInfo._();

  factory CourseInfo([void updates(CourseInfoBuilder b)]) = _$CourseInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CourseInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CourseInfo> get serializer => _$CourseInfoSerializer();
}

class _$CourseInfoSerializer implements PrimitiveSerializer<CourseInfo> {
  @override
  final Iterable<Type> types = const [CourseInfo, _$CourseInfo];

  @override
  final String wireName = r'CourseInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CourseInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
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
    yield r'coverPhoto';
    yield serializers.serialize(
      object.coverPhoto,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(CourseInfoCategoryEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CourseInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CourseInfoBuilder result,
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
        case r'coverPhoto':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.coverPhoto = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CourseInfoCategoryEnum),
          ) as CourseInfoCategoryEnum;
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
  CourseInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CourseInfoBuilder();
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

class CourseInfoCategoryEnum extends EnumClass {

  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'understanding-your-body')
  static const CourseInfoCategoryEnum understandingYourBody = _$courseInfoCategoryEnum_understandingYourBody;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'sexual-pleasure-and-wellness')
  static const CourseInfoCategoryEnum sexualPleasureAndWellness = _$courseInfoCategoryEnum_sexualPleasureAndWellness;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'mental-and-emotional-well-being')
  static const CourseInfoCategoryEnum mentalAndEmotionalWellBeing = _$courseInfoCategoryEnum_mentalAndEmotionalWellBeing;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'menopause-and-midlife-health')
  static const CourseInfoCategoryEnum menopauseAndMidlifeHealth = _$courseInfoCategoryEnum_menopauseAndMidlifeHealth;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'contraception-and-family-planning')
  static const CourseInfoCategoryEnum contraceptionAndFamilyPlanning = _$courseInfoCategoryEnum_contraceptionAndFamilyPlanning;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'menstrual-health-and-hygiene')
  static const CourseInfoCategoryEnum menstrualHealthAndHygiene = _$courseInfoCategoryEnum_menstrualHealthAndHygiene;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'sexual-and-reproductive-rights')
  static const CourseInfoCategoryEnum sexualAndReproductiveRights = _$courseInfoCategoryEnum_sexualAndReproductiveRights;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'sexually-transmitted-infections')
  static const CourseInfoCategoryEnum sexuallyTransmittedInfections = _$courseInfoCategoryEnum_sexuallyTransmittedInfections;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'fertility-and-infertility')
  static const CourseInfoCategoryEnum fertilityAndInfertility = _$courseInfoCategoryEnum_fertilityAndInfertility;
  /// Course info category e.g understanding-your-body.
  @BuiltValueEnumConst(wireName: r'pregnancy-and-postpartum-care')
  static const CourseInfoCategoryEnum pregnancyAndPostpartumCare = _$courseInfoCategoryEnum_pregnancyAndPostpartumCare;

  static Serializer<CourseInfoCategoryEnum> get serializer => _$courseInfoCategoryEnumSerializer;

  const CourseInfoCategoryEnum._(String name): super(name);

  static BuiltSet<CourseInfoCategoryEnum> get values => _$courseInfoCategoryEnumValues;
  static CourseInfoCategoryEnum valueOf(String name) => _$courseInfoCategoryEnumValueOf(name);
}

