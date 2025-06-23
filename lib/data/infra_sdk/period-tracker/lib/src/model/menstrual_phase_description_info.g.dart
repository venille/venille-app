// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'menstrual_phase_description_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MenstrualPhaseDescriptionInfo extends MenstrualPhaseDescriptionInfo {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;

  factory _$MenstrualPhaseDescriptionInfo(
          [void Function(MenstrualPhaseDescriptionInfoBuilder)? updates]) =>
      (new MenstrualPhaseDescriptionInfoBuilder()..update(updates))._build();

  _$MenstrualPhaseDescriptionInfo._(
      {required this.id, required this.title, required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'MenstrualPhaseDescriptionInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'MenstrualPhaseDescriptionInfo', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'MenstrualPhaseDescriptionInfo', 'description');
  }

  @override
  MenstrualPhaseDescriptionInfo rebuild(
          void Function(MenstrualPhaseDescriptionInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenstrualPhaseDescriptionInfoBuilder toBuilder() =>
      new MenstrualPhaseDescriptionInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenstrualPhaseDescriptionInfo &&
        id == other.id &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenstrualPhaseDescriptionInfo')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class MenstrualPhaseDescriptionInfoBuilder
    implements
        Builder<MenstrualPhaseDescriptionInfo,
            MenstrualPhaseDescriptionInfoBuilder> {
  _$MenstrualPhaseDescriptionInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  MenstrualPhaseDescriptionInfoBuilder() {
    MenstrualPhaseDescriptionInfo._defaults(this);
  }

  MenstrualPhaseDescriptionInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenstrualPhaseDescriptionInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MenstrualPhaseDescriptionInfo;
  }

  @override
  void update(void Function(MenstrualPhaseDescriptionInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenstrualPhaseDescriptionInfo build() => _build();

  _$MenstrualPhaseDescriptionInfo _build() {
    final _$result = _$v ??
        new _$MenstrualPhaseDescriptionInfo._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'MenstrualPhaseDescriptionInfo', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'MenstrualPhaseDescriptionInfo', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'MenstrualPhaseDescriptionInfo', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
