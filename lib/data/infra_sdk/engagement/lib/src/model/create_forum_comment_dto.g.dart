// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'create_forum_comment_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateForumCommentDto extends CreateForumCommentDto {
  @override
  final String content;

  factory _$CreateForumCommentDto(
          [void Function(CreateForumCommentDtoBuilder)? updates]) =>
      (new CreateForumCommentDtoBuilder()..update(updates))._build();

  _$CreateForumCommentDto._({required this.content}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        content, r'CreateForumCommentDto', 'content');
  }

  @override
  CreateForumCommentDto rebuild(
          void Function(CreateForumCommentDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateForumCommentDtoBuilder toBuilder() =>
      new CreateForumCommentDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateForumCommentDto && content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateForumCommentDto')
          ..add('content', content))
        .toString();
  }
}

class CreateForumCommentDtoBuilder
    implements Builder<CreateForumCommentDto, CreateForumCommentDtoBuilder> {
  _$CreateForumCommentDto? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  CreateForumCommentDtoBuilder() {
    CreateForumCommentDto._defaults(this);
  }

  CreateForumCommentDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateForumCommentDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateForumCommentDto;
  }

  @override
  void update(void Function(CreateForumCommentDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateForumCommentDto build() => _build();

  _$CreateForumCommentDto _build() {
    final _$result = _$v ??
        new _$CreateForumCommentDto._(
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'CreateForumCommentDto', 'content'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
