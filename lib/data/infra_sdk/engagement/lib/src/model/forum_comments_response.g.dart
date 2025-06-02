// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'forum_comments_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForumCommentsResponse extends ForumCommentsResponse {
  @override
  final BuiltList<ForumCommentInfo> comments;
  @override
  final num totalPages;
  @override
  final bool hasNextPage;

  factory _$ForumCommentsResponse(
          [void Function(ForumCommentsResponseBuilder)? updates]) =>
      (new ForumCommentsResponseBuilder()..update(updates))._build();

  _$ForumCommentsResponse._(
      {required this.comments,
      required this.totalPages,
      required this.hasNextPage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        comments, r'ForumCommentsResponse', 'comments');
    BuiltValueNullFieldError.checkNotNull(
        totalPages, r'ForumCommentsResponse', 'totalPages');
    BuiltValueNullFieldError.checkNotNull(
        hasNextPage, r'ForumCommentsResponse', 'hasNextPage');
  }

  @override
  ForumCommentsResponse rebuild(
          void Function(ForumCommentsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForumCommentsResponseBuilder toBuilder() =>
      new ForumCommentsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForumCommentsResponse &&
        comments == other.comments &&
        totalPages == other.totalPages &&
        hasNextPage == other.hasNextPage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jc(_$hash, hasNextPage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForumCommentsResponse')
          ..add('comments', comments)
          ..add('totalPages', totalPages)
          ..add('hasNextPage', hasNextPage))
        .toString();
  }
}

class ForumCommentsResponseBuilder
    implements Builder<ForumCommentsResponse, ForumCommentsResponseBuilder> {
  _$ForumCommentsResponse? _$v;

  ListBuilder<ForumCommentInfo>? _comments;
  ListBuilder<ForumCommentInfo> get comments =>
      _$this._comments ??= new ListBuilder<ForumCommentInfo>();
  set comments(ListBuilder<ForumCommentInfo>? comments) =>
      _$this._comments = comments;

  num? _totalPages;
  num? get totalPages => _$this._totalPages;
  set totalPages(num? totalPages) => _$this._totalPages = totalPages;

  bool? _hasNextPage;
  bool? get hasNextPage => _$this._hasNextPage;
  set hasNextPage(bool? hasNextPage) => _$this._hasNextPage = hasNextPage;

  ForumCommentsResponseBuilder() {
    ForumCommentsResponse._defaults(this);
  }

  ForumCommentsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comments = $v.comments.toBuilder();
      _totalPages = $v.totalPages;
      _hasNextPage = $v.hasNextPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForumCommentsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForumCommentsResponse;
  }

  @override
  void update(void Function(ForumCommentsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForumCommentsResponse build() => _build();

  _$ForumCommentsResponse _build() {
    _$ForumCommentsResponse _$result;
    try {
      _$result = _$v ??
          new _$ForumCommentsResponse._(
              comments: comments.build(),
              totalPages: BuiltValueNullFieldError.checkNotNull(
                  totalPages, r'ForumCommentsResponse', 'totalPages'),
              hasNextPage: BuiltValueNullFieldError.checkNotNull(
                  hasNextPage, r'ForumCommentsResponse', 'hasNextPage'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ForumCommentsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
