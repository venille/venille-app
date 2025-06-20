// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_tracker_calendar_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerCalendarInfo extends PeriodTrackerCalendarInfo {
  @override
  final String currentMonth;
  @override
  final num currentYear;
  @override
  final BuiltList<String> predictedPeriodDays;
  @override
  final BuiltList<DailyInsightsSummary> dailyInsights;
  @override
  final String ovulationDate;

  factory _$PeriodTrackerCalendarInfo(
          [void Function(PeriodTrackerCalendarInfoBuilder)? updates]) =>
      (new PeriodTrackerCalendarInfoBuilder()..update(updates))._build();

  _$PeriodTrackerCalendarInfo._(
      {required this.currentMonth,
      required this.currentYear,
      required this.predictedPeriodDays,
      required this.dailyInsights,
      required this.ovulationDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currentMonth, r'PeriodTrackerCalendarInfo', 'currentMonth');
    BuiltValueNullFieldError.checkNotNull(
        currentYear, r'PeriodTrackerCalendarInfo', 'currentYear');
    BuiltValueNullFieldError.checkNotNull(predictedPeriodDays,
        r'PeriodTrackerCalendarInfo', 'predictedPeriodDays');
    BuiltValueNullFieldError.checkNotNull(
        dailyInsights, r'PeriodTrackerCalendarInfo', 'dailyInsights');
    BuiltValueNullFieldError.checkNotNull(
        ovulationDate, r'PeriodTrackerCalendarInfo', 'ovulationDate');
  }

  @override
  PeriodTrackerCalendarInfo rebuild(
          void Function(PeriodTrackerCalendarInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerCalendarInfoBuilder toBuilder() =>
      new PeriodTrackerCalendarInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerCalendarInfo &&
        currentMonth == other.currentMonth &&
        currentYear == other.currentYear &&
        predictedPeriodDays == other.predictedPeriodDays &&
        dailyInsights == other.dailyInsights &&
        ovulationDate == other.ovulationDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentMonth.hashCode);
    _$hash = $jc(_$hash, currentYear.hashCode);
    _$hash = $jc(_$hash, predictedPeriodDays.hashCode);
    _$hash = $jc(_$hash, dailyInsights.hashCode);
    _$hash = $jc(_$hash, ovulationDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerCalendarInfo')
          ..add('currentMonth', currentMonth)
          ..add('currentYear', currentYear)
          ..add('predictedPeriodDays', predictedPeriodDays)
          ..add('dailyInsights', dailyInsights)
          ..add('ovulationDate', ovulationDate))
        .toString();
  }
}

class PeriodTrackerCalendarInfoBuilder
    implements
        Builder<PeriodTrackerCalendarInfo, PeriodTrackerCalendarInfoBuilder> {
  _$PeriodTrackerCalendarInfo? _$v;

  String? _currentMonth;
  String? get currentMonth => _$this._currentMonth;
  set currentMonth(String? currentMonth) => _$this._currentMonth = currentMonth;

  num? _currentYear;
  num? get currentYear => _$this._currentYear;
  set currentYear(num? currentYear) => _$this._currentYear = currentYear;

  ListBuilder<String>? _predictedPeriodDays;
  ListBuilder<String> get predictedPeriodDays =>
      _$this._predictedPeriodDays ??= new ListBuilder<String>();
  set predictedPeriodDays(ListBuilder<String>? predictedPeriodDays) =>
      _$this._predictedPeriodDays = predictedPeriodDays;

  ListBuilder<DailyInsightsSummary>? _dailyInsights;
  ListBuilder<DailyInsightsSummary> get dailyInsights =>
      _$this._dailyInsights ??= new ListBuilder<DailyInsightsSummary>();
  set dailyInsights(ListBuilder<DailyInsightsSummary>? dailyInsights) =>
      _$this._dailyInsights = dailyInsights;

  String? _ovulationDate;
  String? get ovulationDate => _$this._ovulationDate;
  set ovulationDate(String? ovulationDate) =>
      _$this._ovulationDate = ovulationDate;

  PeriodTrackerCalendarInfoBuilder() {
    PeriodTrackerCalendarInfo._defaults(this);
  }

  PeriodTrackerCalendarInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentMonth = $v.currentMonth;
      _currentYear = $v.currentYear;
      _predictedPeriodDays = $v.predictedPeriodDays.toBuilder();
      _dailyInsights = $v.dailyInsights.toBuilder();
      _ovulationDate = $v.ovulationDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerCalendarInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerCalendarInfo;
  }

  @override
  void update(void Function(PeriodTrackerCalendarInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerCalendarInfo build() => _build();

  _$PeriodTrackerCalendarInfo _build() {
    _$PeriodTrackerCalendarInfo _$result;
    try {
      _$result = _$v ??
          new _$PeriodTrackerCalendarInfo._(
              currentMonth: BuiltValueNullFieldError.checkNotNull(
                  currentMonth, r'PeriodTrackerCalendarInfo', 'currentMonth'),
              currentYear: BuiltValueNullFieldError.checkNotNull(
                  currentYear, r'PeriodTrackerCalendarInfo', 'currentYear'),
              predictedPeriodDays: predictedPeriodDays.build(),
              dailyInsights: dailyInsights.build(),
              ovulationDate: BuiltValueNullFieldError.checkNotNull(
                  ovulationDate,
                  r'PeriodTrackerCalendarInfo',
                  'ovulationDate'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'predictedPeriodDays';
        predictedPeriodDays.build();
        _$failedField = 'dailyInsights';
        dailyInsights.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeriodTrackerCalendarInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
