// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_tracker_week_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerWeekInfo extends PeriodTrackerWeekInfo {
  @override
  final String monthTitle;
  @override
  final BuiltList<PeriodTrackerDayInfo> days;

  factory _$PeriodTrackerWeekInfo(
          [void Function(PeriodTrackerWeekInfoBuilder)? updates]) =>
      (new PeriodTrackerWeekInfoBuilder()..update(updates))._build();

  _$PeriodTrackerWeekInfo._({required this.monthTitle, required this.days})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        monthTitle, r'PeriodTrackerWeekInfo', 'monthTitle');
    BuiltValueNullFieldError.checkNotNull(
        days, r'PeriodTrackerWeekInfo', 'days');
  }

  @override
  PeriodTrackerWeekInfo rebuild(
          void Function(PeriodTrackerWeekInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerWeekInfoBuilder toBuilder() =>
      new PeriodTrackerWeekInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerWeekInfo &&
        monthTitle == other.monthTitle &&
        days == other.days;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, monthTitle.hashCode);
    _$hash = $jc(_$hash, days.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerWeekInfo')
          ..add('monthTitle', monthTitle)
          ..add('days', days))
        .toString();
  }
}

class PeriodTrackerWeekInfoBuilder
    implements Builder<PeriodTrackerWeekInfo, PeriodTrackerWeekInfoBuilder> {
  _$PeriodTrackerWeekInfo? _$v;

  String? _monthTitle;
  String? get monthTitle => _$this._monthTitle;
  set monthTitle(String? monthTitle) => _$this._monthTitle = monthTitle;

  ListBuilder<PeriodTrackerDayInfo>? _days;
  ListBuilder<PeriodTrackerDayInfo> get days =>
      _$this._days ??= new ListBuilder<PeriodTrackerDayInfo>();
  set days(ListBuilder<PeriodTrackerDayInfo>? days) => _$this._days = days;

  PeriodTrackerWeekInfoBuilder() {
    PeriodTrackerWeekInfo._defaults(this);
  }

  PeriodTrackerWeekInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _monthTitle = $v.monthTitle;
      _days = $v.days.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerWeekInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerWeekInfo;
  }

  @override
  void update(void Function(PeriodTrackerWeekInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerWeekInfo build() => _build();

  _$PeriodTrackerWeekInfo _build() {
    _$PeriodTrackerWeekInfo _$result;
    try {
      _$result = _$v ??
          new _$PeriodTrackerWeekInfo._(
              monthTitle: BuiltValueNullFieldError.checkNotNull(
                  monthTitle, r'PeriodTrackerWeekInfo', 'monthTitle'),
              days: days.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'days';
        days.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeriodTrackerWeekInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
