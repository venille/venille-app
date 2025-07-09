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

part of 'menstrual_phase_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MenstrualPhaseInfo extends MenstrualPhaseInfo {
  @override
  final String id;
  @override
  final String title;
  @override
  final String coverPhoto;
  @override
  final BuiltList<MenstrualPhaseDescriptionInfo> descriptions;
  @override
  final num position;

  factory _$MenstrualPhaseInfo(
          [void Function(MenstrualPhaseInfoBuilder)? updates]) =>
      (new MenstrualPhaseInfoBuilder()..update(updates))._build();

  _$MenstrualPhaseInfo._(
      {required this.id,
      required this.title,
      required this.coverPhoto,
      required this.descriptions,
      required this.position})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'MenstrualPhaseInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'MenstrualPhaseInfo', 'title');
    BuiltValueNullFieldError.checkNotNull(
        coverPhoto, r'MenstrualPhaseInfo', 'coverPhoto');
    BuiltValueNullFieldError.checkNotNull(
        descriptions, r'MenstrualPhaseInfo', 'descriptions');
    BuiltValueNullFieldError.checkNotNull(
        position, r'MenstrualPhaseInfo', 'position');
  }

  @override
  MenstrualPhaseInfo rebuild(
          void Function(MenstrualPhaseInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenstrualPhaseInfoBuilder toBuilder() =>
      new MenstrualPhaseInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenstrualPhaseInfo &&
        id == other.id &&
        title == other.title &&
        coverPhoto == other.coverPhoto &&
        descriptions == other.descriptions &&
        position == other.position;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, coverPhoto.hashCode);
    _$hash = $jc(_$hash, descriptions.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenstrualPhaseInfo')
          ..add('id', id)
          ..add('title', title)
          ..add('coverPhoto', coverPhoto)
          ..add('descriptions', descriptions)
          ..add('position', position))
        .toString();
  }
}

class MenstrualPhaseInfoBuilder
    implements Builder<MenstrualPhaseInfo, MenstrualPhaseInfoBuilder> {
  _$MenstrualPhaseInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _coverPhoto;
  String? get coverPhoto => _$this._coverPhoto;
  set coverPhoto(String? coverPhoto) => _$this._coverPhoto = coverPhoto;

  ListBuilder<MenstrualPhaseDescriptionInfo>? _descriptions;
  ListBuilder<MenstrualPhaseDescriptionInfo> get descriptions =>
      _$this._descriptions ??= new ListBuilder<MenstrualPhaseDescriptionInfo>();
  set descriptions(ListBuilder<MenstrualPhaseDescriptionInfo>? descriptions) =>
      _$this._descriptions = descriptions;

  num? _position;
  num? get position => _$this._position;
  set position(num? position) => _$this._position = position;

  MenstrualPhaseInfoBuilder() {
    MenstrualPhaseInfo._defaults(this);
  }

  MenstrualPhaseInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _coverPhoto = $v.coverPhoto;
      _descriptions = $v.descriptions.toBuilder();
      _position = $v.position;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenstrualPhaseInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MenstrualPhaseInfo;
  }

  @override
  void update(void Function(MenstrualPhaseInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenstrualPhaseInfo build() => _build();

  _$MenstrualPhaseInfo _build() {
    _$MenstrualPhaseInfo _$result;
    try {
      _$result = _$v ??
          new _$MenstrualPhaseInfo._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'MenstrualPhaseInfo', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'MenstrualPhaseInfo', 'title'),
              coverPhoto: BuiltValueNullFieldError.checkNotNull(
                  coverPhoto, r'MenstrualPhaseInfo', 'coverPhoto'),
              descriptions: descriptions.build(),
              position: BuiltValueNullFieldError.checkNotNull(
                  position, r'MenstrualPhaseInfo', 'position'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'descriptions';
        descriptions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MenstrualPhaseInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
