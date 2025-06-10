// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'daily_insights_summary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DailyInsightsSummary extends DailyInsightsSummary {
  @override
  final DateTime date;
  @override
  final bool isPredictedPeriodDay;
  @override
  final bool isPredictedOvulationDay;
  @override
  final String todayInsights;

  factory _$DailyInsightsSummary(
          [void Function(DailyInsightsSummaryBuilder)? updates]) =>
      (new DailyInsightsSummaryBuilder()..update(updates))._build();

  _$DailyInsightsSummary._(
      {required this.date,
      required this.isPredictedPeriodDay,
      required this.isPredictedOvulationDay,
      required this.todayInsights})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        date, r'DailyInsightsSummary', 'date');
    BuiltValueNullFieldError.checkNotNull(
        isPredictedPeriodDay, r'DailyInsightsSummary', 'isPredictedPeriodDay');
    BuiltValueNullFieldError.checkNotNull(isPredictedOvulationDay,
        r'DailyInsightsSummary', 'isPredictedOvulationDay');
    BuiltValueNullFieldError.checkNotNull(
        todayInsights, r'DailyInsightsSummary', 'todayInsights');
  }

  @override
  DailyInsightsSummary rebuild(
          void Function(DailyInsightsSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DailyInsightsSummaryBuilder toBuilder() =>
      new DailyInsightsSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DailyInsightsSummary &&
        date == other.date &&
        isPredictedPeriodDay == other.isPredictedPeriodDay &&
        isPredictedOvulationDay == other.isPredictedOvulationDay &&
        todayInsights == other.todayInsights;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, isPredictedPeriodDay.hashCode);
    _$hash = $jc(_$hash, isPredictedOvulationDay.hashCode);
    _$hash = $jc(_$hash, todayInsights.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DailyInsightsSummary')
          ..add('date', date)
          ..add('isPredictedPeriodDay', isPredictedPeriodDay)
          ..add('isPredictedOvulationDay', isPredictedOvulationDay)
          ..add('todayInsights', todayInsights))
        .toString();
  }
}

class DailyInsightsSummaryBuilder
    implements Builder<DailyInsightsSummary, DailyInsightsSummaryBuilder> {
  _$DailyInsightsSummary? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  bool? _isPredictedPeriodDay;
  bool? get isPredictedPeriodDay => _$this._isPredictedPeriodDay;
  set isPredictedPeriodDay(bool? isPredictedPeriodDay) =>
      _$this._isPredictedPeriodDay = isPredictedPeriodDay;

  bool? _isPredictedOvulationDay;
  bool? get isPredictedOvulationDay => _$this._isPredictedOvulationDay;
  set isPredictedOvulationDay(bool? isPredictedOvulationDay) =>
      _$this._isPredictedOvulationDay = isPredictedOvulationDay;

  String? _todayInsights;
  String? get todayInsights => _$this._todayInsights;
  set todayInsights(String? todayInsights) =>
      _$this._todayInsights = todayInsights;

  DailyInsightsSummaryBuilder() {
    DailyInsightsSummary._defaults(this);
  }

  DailyInsightsSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _isPredictedPeriodDay = $v.isPredictedPeriodDay;
      _isPredictedOvulationDay = $v.isPredictedOvulationDay;
      _todayInsights = $v.todayInsights;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DailyInsightsSummary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DailyInsightsSummary;
  }

  @override
  void update(void Function(DailyInsightsSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DailyInsightsSummary build() => _build();

  _$DailyInsightsSummary _build() {
    final _$result = _$v ??
        new _$DailyInsightsSummary._(
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'DailyInsightsSummary', 'date'),
            isPredictedPeriodDay: BuiltValueNullFieldError.checkNotNull(
                isPredictedPeriodDay,
                r'DailyInsightsSummary',
                'isPredictedPeriodDay'),
            isPredictedOvulationDay: BuiltValueNullFieldError.checkNotNull(
                isPredictedOvulationDay,
                r'DailyInsightsSummary',
                'isPredictedOvulationDay'),
            todayInsights: BuiltValueNullFieldError.checkNotNull(
                todayInsights, r'DailyInsightsSummary', 'todayInsights'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
