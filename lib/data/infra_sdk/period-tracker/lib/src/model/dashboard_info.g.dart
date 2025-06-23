// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'dashboard_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DashboardInfo extends DashboardInfo {
  @override
  final PreviousCycleInfo previousCycleInfo;
  @override
  final BuiltList<MenstrualPhaseInfo> menstrualPhases;

  factory _$DashboardInfo([void Function(DashboardInfoBuilder)? updates]) =>
      (new DashboardInfoBuilder()..update(updates))._build();

  _$DashboardInfo._(
      {required this.previousCycleInfo, required this.menstrualPhases})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        previousCycleInfo, r'DashboardInfo', 'previousCycleInfo');
    BuiltValueNullFieldError.checkNotNull(
        menstrualPhases, r'DashboardInfo', 'menstrualPhases');
  }

  @override
  DashboardInfo rebuild(void Function(DashboardInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardInfoBuilder toBuilder() => new DashboardInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardInfo &&
        previousCycleInfo == other.previousCycleInfo &&
        menstrualPhases == other.menstrualPhases;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, previousCycleInfo.hashCode);
    _$hash = $jc(_$hash, menstrualPhases.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DashboardInfo')
          ..add('previousCycleInfo', previousCycleInfo)
          ..add('menstrualPhases', menstrualPhases))
        .toString();
  }
}

class DashboardInfoBuilder
    implements Builder<DashboardInfo, DashboardInfoBuilder> {
  _$DashboardInfo? _$v;

  PreviousCycleInfoBuilder? _previousCycleInfo;
  PreviousCycleInfoBuilder get previousCycleInfo =>
      _$this._previousCycleInfo ??= new PreviousCycleInfoBuilder();
  set previousCycleInfo(PreviousCycleInfoBuilder? previousCycleInfo) =>
      _$this._previousCycleInfo = previousCycleInfo;

  ListBuilder<MenstrualPhaseInfo>? _menstrualPhases;
  ListBuilder<MenstrualPhaseInfo> get menstrualPhases =>
      _$this._menstrualPhases ??= new ListBuilder<MenstrualPhaseInfo>();
  set menstrualPhases(ListBuilder<MenstrualPhaseInfo>? menstrualPhases) =>
      _$this._menstrualPhases = menstrualPhases;

  DashboardInfoBuilder() {
    DashboardInfo._defaults(this);
  }

  DashboardInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _previousCycleInfo = $v.previousCycleInfo.toBuilder();
      _menstrualPhases = $v.menstrualPhases.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DashboardInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardInfo;
  }

  @override
  void update(void Function(DashboardInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardInfo build() => _build();

  _$DashboardInfo _build() {
    _$DashboardInfo _$result;
    try {
      _$result = _$v ??
          new _$DashboardInfo._(
              previousCycleInfo: previousCycleInfo.build(),
              menstrualPhases: menstrualPhases.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'previousCycleInfo';
        previousCycleInfo.build();
        _$failedField = 'menstrualPhases';
        menstrualPhases.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DashboardInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
