// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'create_forum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_general =
    const CreateForumDtoCategoryEnum._('general');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_health =
    const CreateForumDtoCategoryEnum._('health');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_fitness =
    const CreateForumDtoCategoryEnum._('fitness');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_nutrition =
    const CreateForumDtoCategoryEnum._('nutrition');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_mentalHealth =
    const CreateForumDtoCategoryEnum._('mentalHealth');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_menstrualCycle =
    const CreateForumDtoCategoryEnum._('menstrualCycle');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_sexualHealth =
    const CreateForumDtoCategoryEnum._('sexualHealth');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_contraception =
    const CreateForumDtoCategoryEnum._('contraception');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_relationships =
    const CreateForumDtoCategoryEnum._('relationships');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_family =
    const CreateForumDtoCategoryEnum._('family');
const CreateForumDtoCategoryEnum
    _$createForumDtoCategoryEnum_beautyAndWellness =
    const CreateForumDtoCategoryEnum._('beautyAndWellness');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_pregnancy =
    const CreateForumDtoCategoryEnum._('pregnancy');
const CreateForumDtoCategoryEnum _$createForumDtoCategoryEnum_parenthood =
    const CreateForumDtoCategoryEnum._('parenthood');

CreateForumDtoCategoryEnum _$createForumDtoCategoryEnumValueOf(String name) {
  switch (name) {
    case 'general':
      return _$createForumDtoCategoryEnum_general;
    case 'health':
      return _$createForumDtoCategoryEnum_health;
    case 'fitness':
      return _$createForumDtoCategoryEnum_fitness;
    case 'nutrition':
      return _$createForumDtoCategoryEnum_nutrition;
    case 'mentalHealth':
      return _$createForumDtoCategoryEnum_mentalHealth;
    case 'menstrualCycle':
      return _$createForumDtoCategoryEnum_menstrualCycle;
    case 'sexualHealth':
      return _$createForumDtoCategoryEnum_sexualHealth;
    case 'contraception':
      return _$createForumDtoCategoryEnum_contraception;
    case 'relationships':
      return _$createForumDtoCategoryEnum_relationships;
    case 'family':
      return _$createForumDtoCategoryEnum_family;
    case 'beautyAndWellness':
      return _$createForumDtoCategoryEnum_beautyAndWellness;
    case 'pregnancy':
      return _$createForumDtoCategoryEnum_pregnancy;
    case 'parenthood':
      return _$createForumDtoCategoryEnum_parenthood;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CreateForumDtoCategoryEnum> _$createForumDtoCategoryEnumValues =
    new BuiltSet<CreateForumDtoCategoryEnum>(const <CreateForumDtoCategoryEnum>[
  _$createForumDtoCategoryEnum_general,
  _$createForumDtoCategoryEnum_health,
  _$createForumDtoCategoryEnum_fitness,
  _$createForumDtoCategoryEnum_nutrition,
  _$createForumDtoCategoryEnum_mentalHealth,
  _$createForumDtoCategoryEnum_menstrualCycle,
  _$createForumDtoCategoryEnum_sexualHealth,
  _$createForumDtoCategoryEnum_contraception,
  _$createForumDtoCategoryEnum_relationships,
  _$createForumDtoCategoryEnum_family,
  _$createForumDtoCategoryEnum_beautyAndWellness,
  _$createForumDtoCategoryEnum_pregnancy,
  _$createForumDtoCategoryEnum_parenthood,
]);

Serializer<CreateForumDtoCategoryEnum> _$createForumDtoCategoryEnumSerializer =
    new _$CreateForumDtoCategoryEnumSerializer();

class _$CreateForumDtoCategoryEnumSerializer
    implements PrimitiveSerializer<CreateForumDtoCategoryEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'general': 'general',
    'health': 'health',
    'fitness': 'fitness',
    'nutrition': 'nutrition',
    'mentalHealth': 'mental-health',
    'menstrualCycle': 'menstrual-cycle',
    'sexualHealth': 'sexual-health',
    'contraception': 'contraception',
    'relationships': 'relationships',
    'family': 'family',
    'beautyAndWellness': 'beauty-and-wellness',
    'pregnancy': 'pregnancy',
    'parenthood': 'parenthood',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'general': 'general',
    'health': 'health',
    'fitness': 'fitness',
    'nutrition': 'nutrition',
    'mental-health': 'mentalHealth',
    'menstrual-cycle': 'menstrualCycle',
    'sexual-health': 'sexualHealth',
    'contraception': 'contraception',
    'relationships': 'relationships',
    'family': 'family',
    'beauty-and-wellness': 'beautyAndWellness',
    'pregnancy': 'pregnancy',
    'parenthood': 'parenthood',
  };

  @override
  final Iterable<Type> types = const <Type>[CreateForumDtoCategoryEnum];
  @override
  final String wireName = 'CreateForumDtoCategoryEnum';

  @override
  Object serialize(Serializers serializers, CreateForumDtoCategoryEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateForumDtoCategoryEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateForumDtoCategoryEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateForumDto extends CreateForumDto {
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;
  @override
  final CreateForumDtoCategoryEnum category;

  factory _$CreateForumDto([void Function(CreateForumDtoBuilder)? updates]) =>
      (new CreateForumDtoBuilder()..update(updates))._build();

  _$CreateForumDto._(
      {required this.title,
      required this.description,
      required this.image,
      required this.category})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'CreateForumDto', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'CreateForumDto', 'description');
    BuiltValueNullFieldError.checkNotNull(image, r'CreateForumDto', 'image');
    BuiltValueNullFieldError.checkNotNull(
        category, r'CreateForumDto', 'category');
  }

  @override
  CreateForumDto rebuild(void Function(CreateForumDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateForumDtoBuilder toBuilder() =>
      new CreateForumDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateForumDto &&
        title == other.title &&
        description == other.description &&
        image == other.image &&
        category == other.category;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateForumDto')
          ..add('title', title)
          ..add('description', description)
          ..add('image', image)
          ..add('category', category))
        .toString();
  }
}

class CreateForumDtoBuilder
    implements Builder<CreateForumDto, CreateForumDtoBuilder> {
  _$CreateForumDto? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  CreateForumDtoCategoryEnum? _category;
  CreateForumDtoCategoryEnum? get category => _$this._category;
  set category(CreateForumDtoCategoryEnum? category) =>
      _$this._category = category;

  CreateForumDtoBuilder() {
    CreateForumDto._defaults(this);
  }

  CreateForumDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _image = $v.image;
      _category = $v.category;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateForumDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateForumDto;
  }

  @override
  void update(void Function(CreateForumDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateForumDto build() => _build();

  _$CreateForumDto _build() {
    final _$result = _$v ??
        new _$CreateForumDto._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'CreateForumDto', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'CreateForumDto', 'description'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'CreateForumDto', 'image'),
            category: BuiltValueNullFieldError.checkNotNull(
                category, r'CreateForumDto', 'category'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
