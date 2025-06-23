// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'create_forum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateForumDto extends CreateForumDto {
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;

  factory _$CreateForumDto([void Function(CreateForumDtoBuilder)? updates]) =>
      (new CreateForumDtoBuilder()..update(updates))._build();

  _$CreateForumDto._(
      {required this.title, required this.description, required this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'CreateForumDto', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'CreateForumDto', 'description');
    BuiltValueNullFieldError.checkNotNull(image, r'CreateForumDto', 'image');
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
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateForumDto')
          ..add('title', title)
          ..add('description', description)
          ..add('image', image))
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

  CreateForumDtoBuilder() {
    CreateForumDto._defaults(this);
  }

  CreateForumDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _image = $v.image;
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
                image, r'CreateForumDto', 'image'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
