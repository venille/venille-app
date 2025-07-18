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

part of 'forum_comment_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForumCommentInfo extends ForumCommentInfo {
  @override
  final String id;
  @override
  final String content;
  @override
  final String authorPhoto;
  @override
  final DateTime createdAt;

  factory _$ForumCommentInfo(
          [void Function(ForumCommentInfoBuilder)? updates]) =>
      (new ForumCommentInfoBuilder()..update(updates))._build();

  _$ForumCommentInfo._(
      {required this.id,
      required this.content,
      required this.authorPhoto,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ForumCommentInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(
        content, r'ForumCommentInfo', 'content');
    BuiltValueNullFieldError.checkNotNull(
        authorPhoto, r'ForumCommentInfo', 'authorPhoto');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'ForumCommentInfo', 'createdAt');
  }

  @override
  ForumCommentInfo rebuild(void Function(ForumCommentInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForumCommentInfoBuilder toBuilder() =>
      new ForumCommentInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForumCommentInfo &&
        id == other.id &&
        content == other.content &&
        authorPhoto == other.authorPhoto &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, authorPhoto.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForumCommentInfo')
          ..add('id', id)
          ..add('content', content)
          ..add('authorPhoto', authorPhoto)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ForumCommentInfoBuilder
    implements Builder<ForumCommentInfo, ForumCommentInfoBuilder> {
  _$ForumCommentInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _authorPhoto;
  String? get authorPhoto => _$this._authorPhoto;
  set authorPhoto(String? authorPhoto) => _$this._authorPhoto = authorPhoto;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ForumCommentInfoBuilder() {
    ForumCommentInfo._defaults(this);
  }

  ForumCommentInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _content = $v.content;
      _authorPhoto = $v.authorPhoto;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForumCommentInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForumCommentInfo;
  }

  @override
  void update(void Function(ForumCommentInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForumCommentInfo build() => _build();

  _$ForumCommentInfo _build() {
    final _$result = _$v ??
        new _$ForumCommentInfo._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ForumCommentInfo', 'id'),
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'ForumCommentInfo', 'content'),
            authorPhoto: BuiltValueNullFieldError.checkNotNull(
                authorPhoto, r'ForumCommentInfo', 'authorPhoto'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ForumCommentInfo', 'createdAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
