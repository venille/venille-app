// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:engagement_sdk/src/model/course_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'course_category_info.g.dart';

/// CourseCategoryInfo
///
/// Properties:
/// * [title] 
/// * [courses] - Course info list.
@BuiltValue()
abstract class CourseCategoryInfo implements Built<CourseCategoryInfo, CourseCategoryInfoBuilder> {
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Course info list.
  @BuiltValueField(wireName: r'courses')
  BuiltList<CourseInfo> get courses;

  CourseCategoryInfo._();

  factory CourseCategoryInfo([void updates(CourseCategoryInfoBuilder b)]) = _$CourseCategoryInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CourseCategoryInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CourseCategoryInfo> get serializer => _$CourseCategoryInfoSerializer();
}

class _$CourseCategoryInfoSerializer implements PrimitiveSerializer<CourseCategoryInfo> {
  @override
  final Iterable<Type> types = const [CourseCategoryInfo, _$CourseCategoryInfo];

  @override
  final String wireName = r'CourseCategoryInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CourseCategoryInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'courses';
    yield serializers.serialize(
      object.courses,
      specifiedType: const FullType(BuiltList, [FullType(CourseInfo)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CourseCategoryInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CourseCategoryInfoBuilder result,
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
        case r'courses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CourseInfo)]),
          ) as BuiltList<CourseInfo>;
          result.courses.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CourseCategoryInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CourseCategoryInfoBuilder();
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

