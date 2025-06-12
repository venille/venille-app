// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'forum_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForumInfo extends ForumInfo {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final String image;
  @override
  final String authorPhoto;
  @override
  final BuiltList<num> likes;
  @override
  final num likeCount;
  @override
  final num comments;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$ForumInfo([void Function(ForumInfoBuilder)? updates]) =>
      (new ForumInfoBuilder()..update(updates))._build();

  _$ForumInfo._(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.authorPhoto,
      required this.likes,
      required this.likeCount,
      required this.comments,
      required this.createdAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ForumInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'ForumInfo', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ForumInfo', 'description');
    BuiltValueNullFieldError.checkNotNull(category, r'ForumInfo', 'category');
    BuiltValueNullFieldError.checkNotNull(image, r'ForumInfo', 'image');
    BuiltValueNullFieldError.checkNotNull(
        authorPhoto, r'ForumInfo', 'authorPhoto');
    BuiltValueNullFieldError.checkNotNull(likes, r'ForumInfo', 'likes');
    BuiltValueNullFieldError.checkNotNull(likeCount, r'ForumInfo', 'likeCount');
    BuiltValueNullFieldError.checkNotNull(comments, r'ForumInfo', 'comments');
    BuiltValueNullFieldError.checkNotNull(createdAt, r'ForumInfo', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(updatedAt, r'ForumInfo', 'updatedAt');
  }

  @override
  ForumInfo rebuild(void Function(ForumInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForumInfoBuilder toBuilder() => new ForumInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForumInfo &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        category == other.category &&
        image == other.image &&
        authorPhoto == other.authorPhoto &&
        likes == other.likes &&
        likeCount == other.likeCount &&
        comments == other.comments &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, authorPhoto.hashCode);
    _$hash = $jc(_$hash, likes.hashCode);
    _$hash = $jc(_$hash, likeCount.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForumInfo')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('category', category)
          ..add('image', image)
          ..add('authorPhoto', authorPhoto)
          ..add('likes', likes)
          ..add('likeCount', likeCount)
          ..add('comments', comments)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ForumInfoBuilder implements Builder<ForumInfo, ForumInfoBuilder> {
  _$ForumInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _authorPhoto;
  String? get authorPhoto => _$this._authorPhoto;
  set authorPhoto(String? authorPhoto) => _$this._authorPhoto = authorPhoto;

  ListBuilder<num>? _likes;
  ListBuilder<num> get likes => _$this._likes ??= new ListBuilder<num>();
  set likes(ListBuilder<num>? likes) => _$this._likes = likes;

  num? _likeCount;
  num? get likeCount => _$this._likeCount;
  set likeCount(num? likeCount) => _$this._likeCount = likeCount;

  num? _comments;
  num? get comments => _$this._comments;
  set comments(num? comments) => _$this._comments = comments;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ForumInfoBuilder() {
    ForumInfo._defaults(this);
  }

  ForumInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _category = $v.category;
      _image = $v.image;
      _authorPhoto = $v.authorPhoto;
      _likes = $v.likes.toBuilder();
      _likeCount = $v.likeCount;
      _comments = $v.comments;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForumInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForumInfo;
  }

  @override
  void update(void Function(ForumInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForumInfo build() => _build();

  _$ForumInfo _build() {
    _$ForumInfo _$result;
    try {
      _$result = _$v ??
          new _$ForumInfo._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'ForumInfo', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'ForumInfo', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'ForumInfo', 'description'),
              category: BuiltValueNullFieldError.checkNotNull(
                  category, r'ForumInfo', 'category'),
              image: BuiltValueNullFieldError.checkNotNull(
                  image, r'ForumInfo', 'image'),
              authorPhoto: BuiltValueNullFieldError.checkNotNull(
                  authorPhoto, r'ForumInfo', 'authorPhoto'),
              likes: likes.build(),
              likeCount: BuiltValueNullFieldError.checkNotNull(
                  likeCount, r'ForumInfo', 'likeCount'),
              comments: BuiltValueNullFieldError.checkNotNull(
                  comments, r'ForumInfo', 'comments'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'ForumInfo', 'createdAt'),
              updatedAt: BuiltValueNullFieldError.checkNotNull(
                  updatedAt, r'ForumInfo', 'updatedAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likes';
        likes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ForumInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
