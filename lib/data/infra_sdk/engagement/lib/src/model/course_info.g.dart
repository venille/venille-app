// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'course_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CourseInfoCategoryEnum _$courseInfoCategoryEnum_understandingYourBody =
    const CourseInfoCategoryEnum._('understandingYourBody');
const CourseInfoCategoryEnum
    _$courseInfoCategoryEnum_sexualPleasureAndWellness =
    const CourseInfoCategoryEnum._('sexualPleasureAndWellness');
const CourseInfoCategoryEnum
    _$courseInfoCategoryEnum_mentalAndEmotionalWellBeing =
    const CourseInfoCategoryEnum._('mentalAndEmotionalWellBeing');
const CourseInfoCategoryEnum
    _$courseInfoCategoryEnum_menopauseAndMidlifeHealth =
    const CourseInfoCategoryEnum._('menopauseAndMidlifeHealth');
const CourseInfoCategoryEnum
    _$courseInfoCategoryEnum_contraceptionAndFamilyPlanning =
    const CourseInfoCategoryEnum._('contraceptionAndFamilyPlanning');
const CourseInfoCategoryEnum
    _$courseInfoCategoryEnum_menstrualHealthAndHygiene =
    const CourseInfoCategoryEnum._('menstrualHealthAndHygiene');
const CourseInfoCategoryEnum
    _$courseInfoCategoryEnum_sexualAndReproductiveRights =
    const CourseInfoCategoryEnum._('sexualAndReproductiveRights');
const CourseInfoCategoryEnum
    _$courseInfoCategoryEnum_sexuallyTransmittedInfections =
    const CourseInfoCategoryEnum._('sexuallyTransmittedInfections');
const CourseInfoCategoryEnum _$courseInfoCategoryEnum_fertilityAndInfertility =
    const CourseInfoCategoryEnum._('fertilityAndInfertility');
const CourseInfoCategoryEnum
    _$courseInfoCategoryEnum_pregnancyAndPostpartumCare =
    const CourseInfoCategoryEnum._('pregnancyAndPostpartumCare');

CourseInfoCategoryEnum _$courseInfoCategoryEnumValueOf(String name) {
  switch (name) {
    case 'understandingYourBody':
      return _$courseInfoCategoryEnum_understandingYourBody;
    case 'sexualPleasureAndWellness':
      return _$courseInfoCategoryEnum_sexualPleasureAndWellness;
    case 'mentalAndEmotionalWellBeing':
      return _$courseInfoCategoryEnum_mentalAndEmotionalWellBeing;
    case 'menopauseAndMidlifeHealth':
      return _$courseInfoCategoryEnum_menopauseAndMidlifeHealth;
    case 'contraceptionAndFamilyPlanning':
      return _$courseInfoCategoryEnum_contraceptionAndFamilyPlanning;
    case 'menstrualHealthAndHygiene':
      return _$courseInfoCategoryEnum_menstrualHealthAndHygiene;
    case 'sexualAndReproductiveRights':
      return _$courseInfoCategoryEnum_sexualAndReproductiveRights;
    case 'sexuallyTransmittedInfections':
      return _$courseInfoCategoryEnum_sexuallyTransmittedInfections;
    case 'fertilityAndInfertility':
      return _$courseInfoCategoryEnum_fertilityAndInfertility;
    case 'pregnancyAndPostpartumCare':
      return _$courseInfoCategoryEnum_pregnancyAndPostpartumCare;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CourseInfoCategoryEnum> _$courseInfoCategoryEnumValues =
    new BuiltSet<CourseInfoCategoryEnum>(const <CourseInfoCategoryEnum>[
  _$courseInfoCategoryEnum_understandingYourBody,
  _$courseInfoCategoryEnum_sexualPleasureAndWellness,
  _$courseInfoCategoryEnum_mentalAndEmotionalWellBeing,
  _$courseInfoCategoryEnum_menopauseAndMidlifeHealth,
  _$courseInfoCategoryEnum_contraceptionAndFamilyPlanning,
  _$courseInfoCategoryEnum_menstrualHealthAndHygiene,
  _$courseInfoCategoryEnum_sexualAndReproductiveRights,
  _$courseInfoCategoryEnum_sexuallyTransmittedInfections,
  _$courseInfoCategoryEnum_fertilityAndInfertility,
  _$courseInfoCategoryEnum_pregnancyAndPostpartumCare,
]);

Serializer<CourseInfoCategoryEnum> _$courseInfoCategoryEnumSerializer =
    new _$CourseInfoCategoryEnumSerializer();

class _$CourseInfoCategoryEnumSerializer
    implements PrimitiveSerializer<CourseInfoCategoryEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'understandingYourBody': 'understanding-your-body',
    'sexualPleasureAndWellness': 'sexual-pleasure-and-wellness',
    'mentalAndEmotionalWellBeing': 'mental-and-emotional-well-being',
    'menopauseAndMidlifeHealth': 'menopause-and-midlife-health',
    'contraceptionAndFamilyPlanning': 'contraception-and-family-planning',
    'menstrualHealthAndHygiene': 'menstrual-health-and-hygiene',
    'sexualAndReproductiveRights': 'sexual-and-reproductive-rights',
    'sexuallyTransmittedInfections': 'sexually-transmitted-infections',
    'fertilityAndInfertility': 'fertility-and-infertility',
    'pregnancyAndPostpartumCare': 'pregnancy-and-postpartum-care',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'understanding-your-body': 'understandingYourBody',
    'sexual-pleasure-and-wellness': 'sexualPleasureAndWellness',
    'mental-and-emotional-well-being': 'mentalAndEmotionalWellBeing',
    'menopause-and-midlife-health': 'menopauseAndMidlifeHealth',
    'contraception-and-family-planning': 'contraceptionAndFamilyPlanning',
    'menstrual-health-and-hygiene': 'menstrualHealthAndHygiene',
    'sexual-and-reproductive-rights': 'sexualAndReproductiveRights',
    'sexually-transmitted-infections': 'sexuallyTransmittedInfections',
    'fertility-and-infertility': 'fertilityAndInfertility',
    'pregnancy-and-postpartum-care': 'pregnancyAndPostpartumCare',
  };

  @override
  final Iterable<Type> types = const <Type>[CourseInfoCategoryEnum];
  @override
  final String wireName = 'CourseInfoCategoryEnum';

  @override
  Object serialize(Serializers serializers, CourseInfoCategoryEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CourseInfoCategoryEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CourseInfoCategoryEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CourseInfo extends CourseInfo {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String coverPhoto;
  @override
  final CourseInfoCategoryEnum category;

  factory _$CourseInfo([void Function(CourseInfoBuilder)? updates]) =>
      (new CourseInfoBuilder()..update(updates))._build();

  _$CourseInfo._(
      {required this.id,
      required this.title,
      required this.description,
      required this.coverPhoto,
      required this.category})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CourseInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'CourseInfo', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'CourseInfo', 'description');
    BuiltValueNullFieldError.checkNotNull(
        coverPhoto, r'CourseInfo', 'coverPhoto');
    BuiltValueNullFieldError.checkNotNull(category, r'CourseInfo', 'category');
  }

  @override
  CourseInfo rebuild(void Function(CourseInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseInfoBuilder toBuilder() => new CourseInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseInfo &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        coverPhoto == other.coverPhoto &&
        category == other.category;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, coverPhoto.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseInfo')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('coverPhoto', coverPhoto)
          ..add('category', category))
        .toString();
  }
}

class CourseInfoBuilder implements Builder<CourseInfo, CourseInfoBuilder> {
  _$CourseInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _coverPhoto;
  String? get coverPhoto => _$this._coverPhoto;
  set coverPhoto(String? coverPhoto) => _$this._coverPhoto = coverPhoto;

  CourseInfoCategoryEnum? _category;
  CourseInfoCategoryEnum? get category => _$this._category;
  set category(CourseInfoCategoryEnum? category) => _$this._category = category;

  CourseInfoBuilder() {
    CourseInfo._defaults(this);
  }

  CourseInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _coverPhoto = $v.coverPhoto;
      _category = $v.category;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CourseInfo;
  }

  @override
  void update(void Function(CourseInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseInfo build() => _build();

  _$CourseInfo _build() {
    final _$result = _$v ??
        new _$CourseInfo._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'CourseInfo', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'CourseInfo', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'CourseInfo', 'description'),
            coverPhoto: BuiltValueNullFieldError.checkNotNull(
                coverPhoto, r'CourseInfo', 'coverPhoto'),
            category: BuiltValueNullFieldError.checkNotNull(
                category, r'CourseInfo', 'category'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
