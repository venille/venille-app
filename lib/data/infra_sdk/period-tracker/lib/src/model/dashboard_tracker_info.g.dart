// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'dashboard_tracker_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DashboardTrackerInfo extends DashboardTrackerInfo {
  @override
  final PeriodTrackerWeekInfo previousWeek;
  @override
  final PeriodTrackerWeekInfo currentWeek;
  @override
  final PeriodTrackerWeekInfo nextWeek;

  factory _$DashboardTrackerInfo(
          [void Function(DashboardTrackerInfoBuilder)? updates]) =>
      (new DashboardTrackerInfoBuilder()..update(updates))._build();

  _$DashboardTrackerInfo._(
      {required this.previousWeek,
      required this.currentWeek,
      required this.nextWeek})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        previousWeek, r'DashboardTrackerInfo', 'previousWeek');
    BuiltValueNullFieldError.checkNotNull(
        currentWeek, r'DashboardTrackerInfo', 'currentWeek');
    BuiltValueNullFieldError.checkNotNull(
        nextWeek, r'DashboardTrackerInfo', 'nextWeek');
  }

  @override
  DashboardTrackerInfo rebuild(
          void Function(DashboardTrackerInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardTrackerInfoBuilder toBuilder() =>
      new DashboardTrackerInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardTrackerInfo &&
        previousWeek == other.previousWeek &&
        currentWeek == other.currentWeek &&
        nextWeek == other.nextWeek;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, previousWeek.hashCode);
    _$hash = $jc(_$hash, currentWeek.hashCode);
    _$hash = $jc(_$hash, nextWeek.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DashboardTrackerInfo')
          ..add('previousWeek', previousWeek)
          ..add('currentWeek', currentWeek)
          ..add('nextWeek', nextWeek))
        .toString();
  }
}

class DashboardTrackerInfoBuilder
    implements Builder<DashboardTrackerInfo, DashboardTrackerInfoBuilder> {
  _$DashboardTrackerInfo? _$v;

  PeriodTrackerWeekInfoBuilder? _previousWeek;
  PeriodTrackerWeekInfoBuilder get previousWeek =>
      _$this._previousWeek ??= new PeriodTrackerWeekInfoBuilder();
  set previousWeek(PeriodTrackerWeekInfoBuilder? previousWeek) =>
      _$this._previousWeek = previousWeek;

  PeriodTrackerWeekInfoBuilder? _currentWeek;
  PeriodTrackerWeekInfoBuilder get currentWeek =>
      _$this._currentWeek ??= new PeriodTrackerWeekInfoBuilder();
  set currentWeek(PeriodTrackerWeekInfoBuilder? currentWeek) =>
      _$this._currentWeek = currentWeek;

  PeriodTrackerWeekInfoBuilder? _nextWeek;
  PeriodTrackerWeekInfoBuilder get nextWeek =>
      _$this._nextWeek ??= new PeriodTrackerWeekInfoBuilder();
  set nextWeek(PeriodTrackerWeekInfoBuilder? nextWeek) =>
      _$this._nextWeek = nextWeek;

  DashboardTrackerInfoBuilder() {
    DashboardTrackerInfo._defaults(this);
  }

  DashboardTrackerInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _previousWeek = $v.previousWeek.toBuilder();
      _currentWeek = $v.currentWeek.toBuilder();
      _nextWeek = $v.nextWeek.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DashboardTrackerInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardTrackerInfo;
  }

  @override
  void update(void Function(DashboardTrackerInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardTrackerInfo build() => _build();

  _$DashboardTrackerInfo _build() {
    _$DashboardTrackerInfo _$result;
    try {
      _$result = _$v ??
          new _$DashboardTrackerInfo._(
              previousWeek: previousWeek.build(),
              currentWeek: currentWeek.build(),
              nextWeek: nextWeek.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'previousWeek';
        previousWeek.build();
        _$failedField = 'currentWeek';
        currentWeek.build();
        _$failedField = 'nextWeek';
        nextWeek.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DashboardTrackerInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
