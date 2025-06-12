// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'forum_feed_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForumFeedResponse extends ForumFeedResponse {
  @override
  final BuiltList<ForumInfo> forums;
  @override
  final num totalPages;
  @override
  final bool hasNextPage;

  factory _$ForumFeedResponse(
          [void Function(ForumFeedResponseBuilder)? updates]) =>
      (new ForumFeedResponseBuilder()..update(updates))._build();

  _$ForumFeedResponse._(
      {required this.forums,
      required this.totalPages,
      required this.hasNextPage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        forums, r'ForumFeedResponse', 'forums');
    BuiltValueNullFieldError.checkNotNull(
        totalPages, r'ForumFeedResponse', 'totalPages');
    BuiltValueNullFieldError.checkNotNull(
        hasNextPage, r'ForumFeedResponse', 'hasNextPage');
  }

  @override
  ForumFeedResponse rebuild(void Function(ForumFeedResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForumFeedResponseBuilder toBuilder() =>
      new ForumFeedResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForumFeedResponse &&
        forums == other.forums &&
        totalPages == other.totalPages &&
        hasNextPage == other.hasNextPage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, forums.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jc(_$hash, hasNextPage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForumFeedResponse')
          ..add('forums', forums)
          ..add('totalPages', totalPages)
          ..add('hasNextPage', hasNextPage))
        .toString();
  }
}

class ForumFeedResponseBuilder
    implements Builder<ForumFeedResponse, ForumFeedResponseBuilder> {
  _$ForumFeedResponse? _$v;

  ListBuilder<ForumInfo>? _forums;
  ListBuilder<ForumInfo> get forums =>
      _$this._forums ??= new ListBuilder<ForumInfo>();
  set forums(ListBuilder<ForumInfo>? forums) => _$this._forums = forums;

  num? _totalPages;
  num? get totalPages => _$this._totalPages;
  set totalPages(num? totalPages) => _$this._totalPages = totalPages;

  bool? _hasNextPage;
  bool? get hasNextPage => _$this._hasNextPage;
  set hasNextPage(bool? hasNextPage) => _$this._hasNextPage = hasNextPage;

  ForumFeedResponseBuilder() {
    ForumFeedResponse._defaults(this);
  }

  ForumFeedResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _forums = $v.forums.toBuilder();
      _totalPages = $v.totalPages;
      _hasNextPage = $v.hasNextPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForumFeedResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForumFeedResponse;
  }

  @override
  void update(void Function(ForumFeedResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForumFeedResponse build() => _build();

  _$ForumFeedResponse _build() {
    _$ForumFeedResponse _$result;
    try {
      _$result = _$v ??
          new _$ForumFeedResponse._(
              forums: forums.build(),
              totalPages: BuiltValueNullFieldError.checkNotNull(
                  totalPages, r'ForumFeedResponse', 'totalPages'),
              hasNextPage: BuiltValueNullFieldError.checkNotNull(
                  hasNextPage, r'ForumFeedResponse', 'hasNextPage'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'forums';
        forums.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ForumFeedResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
