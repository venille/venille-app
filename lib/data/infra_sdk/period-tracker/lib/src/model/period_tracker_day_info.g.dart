// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_tracker_day_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerDayInfo extends PeriodTrackerDayInfo {
  @override
  final DateTime date;
  @override
  final bool isToday;
  @override
  final num periodDayCount;
  @override
  final num cycleDayCount;
  @override
  final bool isPredictedPeriodDay;
  @override
  final bool isFertileDay;
  @override
  final bool isPredictedOvulationDay;
  @override
  final String insights;

  factory _$PeriodTrackerDayInfo(
          [void Function(PeriodTrackerDayInfoBuilder)? updates]) =>
      (new PeriodTrackerDayInfoBuilder()..update(updates))._build();

  _$PeriodTrackerDayInfo._(
      {required this.date,
      required this.isToday,
      required this.periodDayCount,
      required this.cycleDayCount,
      required this.isPredictedPeriodDay,
      required this.isFertileDay,
      required this.isPredictedOvulationDay,
      required this.insights})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        date, r'PeriodTrackerDayInfo', 'date');
    BuiltValueNullFieldError.checkNotNull(
        isToday, r'PeriodTrackerDayInfo', 'isToday');
    BuiltValueNullFieldError.checkNotNull(
        periodDayCount, r'PeriodTrackerDayInfo', 'periodDayCount');
    BuiltValueNullFieldError.checkNotNull(
        cycleDayCount, r'PeriodTrackerDayInfo', 'cycleDayCount');
    BuiltValueNullFieldError.checkNotNull(
        isPredictedPeriodDay, r'PeriodTrackerDayInfo', 'isPredictedPeriodDay');
    BuiltValueNullFieldError.checkNotNull(
        isFertileDay, r'PeriodTrackerDayInfo', 'isFertileDay');
    BuiltValueNullFieldError.checkNotNull(isPredictedOvulationDay,
        r'PeriodTrackerDayInfo', 'isPredictedOvulationDay');
    BuiltValueNullFieldError.checkNotNull(
        insights, r'PeriodTrackerDayInfo', 'insights');
  }

  @override
  PeriodTrackerDayInfo rebuild(
          void Function(PeriodTrackerDayInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerDayInfoBuilder toBuilder() =>
      new PeriodTrackerDayInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerDayInfo &&
        date == other.date &&
        isToday == other.isToday &&
        periodDayCount == other.periodDayCount &&
        cycleDayCount == other.cycleDayCount &&
        isPredictedPeriodDay == other.isPredictedPeriodDay &&
        isFertileDay == other.isFertileDay &&
        isPredictedOvulationDay == other.isPredictedOvulationDay &&
        insights == other.insights;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, isToday.hashCode);
    _$hash = $jc(_$hash, periodDayCount.hashCode);
    _$hash = $jc(_$hash, cycleDayCount.hashCode);
    _$hash = $jc(_$hash, isPredictedPeriodDay.hashCode);
    _$hash = $jc(_$hash, isFertileDay.hashCode);
    _$hash = $jc(_$hash, isPredictedOvulationDay.hashCode);
    _$hash = $jc(_$hash, insights.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerDayInfo')
          ..add('date', date)
          ..add('isToday', isToday)
          ..add('periodDayCount', periodDayCount)
          ..add('cycleDayCount', cycleDayCount)
          ..add('isPredictedPeriodDay', isPredictedPeriodDay)
          ..add('isFertileDay', isFertileDay)
          ..add('isPredictedOvulationDay', isPredictedOvulationDay)
          ..add('insights', insights))
        .toString();
  }
}

class PeriodTrackerDayInfoBuilder
    implements Builder<PeriodTrackerDayInfo, PeriodTrackerDayInfoBuilder> {
  _$PeriodTrackerDayInfo? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  bool? _isToday;
  bool? get isToday => _$this._isToday;
  set isToday(bool? isToday) => _$this._isToday = isToday;

  num? _periodDayCount;
  num? get periodDayCount => _$this._periodDayCount;
  set periodDayCount(num? periodDayCount) =>
      _$this._periodDayCount = periodDayCount;

  num? _cycleDayCount;
  num? get cycleDayCount => _$this._cycleDayCount;
  set cycleDayCount(num? cycleDayCount) =>
      _$this._cycleDayCount = cycleDayCount;

  bool? _isPredictedPeriodDay;
  bool? get isPredictedPeriodDay => _$this._isPredictedPeriodDay;
  set isPredictedPeriodDay(bool? isPredictedPeriodDay) =>
      _$this._isPredictedPeriodDay = isPredictedPeriodDay;

  bool? _isFertileDay;
  bool? get isFertileDay => _$this._isFertileDay;
  set isFertileDay(bool? isFertileDay) => _$this._isFertileDay = isFertileDay;

  bool? _isPredictedOvulationDay;
  bool? get isPredictedOvulationDay => _$this._isPredictedOvulationDay;
  set isPredictedOvulationDay(bool? isPredictedOvulationDay) =>
      _$this._isPredictedOvulationDay = isPredictedOvulationDay;

  String? _insights;
  String? get insights => _$this._insights;
  set insights(String? insights) => _$this._insights = insights;

  PeriodTrackerDayInfoBuilder() {
    PeriodTrackerDayInfo._defaults(this);
  }

  PeriodTrackerDayInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _isToday = $v.isToday;
      _periodDayCount = $v.periodDayCount;
      _cycleDayCount = $v.cycleDayCount;
      _isPredictedPeriodDay = $v.isPredictedPeriodDay;
      _isFertileDay = $v.isFertileDay;
      _isPredictedOvulationDay = $v.isPredictedOvulationDay;
      _insights = $v.insights;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerDayInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerDayInfo;
  }

  @override
  void update(void Function(PeriodTrackerDayInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerDayInfo build() => _build();

  _$PeriodTrackerDayInfo _build() {
    final _$result = _$v ??
        new _$PeriodTrackerDayInfo._(
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'PeriodTrackerDayInfo', 'date'),
            isToday: BuiltValueNullFieldError.checkNotNull(
                isToday, r'PeriodTrackerDayInfo', 'isToday'),
            periodDayCount: BuiltValueNullFieldError.checkNotNull(
                periodDayCount, r'PeriodTrackerDayInfo', 'periodDayCount'),
            cycleDayCount: BuiltValueNullFieldError.checkNotNull(
                cycleDayCount, r'PeriodTrackerDayInfo', 'cycleDayCount'),
            isPredictedPeriodDay: BuiltValueNullFieldError.checkNotNull(
                isPredictedPeriodDay, r'PeriodTrackerDayInfo', 'isPredictedPeriodDay'),
            isFertileDay: BuiltValueNullFieldError.checkNotNull(
                isFertileDay, r'PeriodTrackerDayInfo', 'isFertileDay'),
            isPredictedOvulationDay: BuiltValueNullFieldError.checkNotNull(
                isPredictedOvulationDay, r'PeriodTrackerDayInfo', 'isPredictedOvulationDay'),
            insights: BuiltValueNullFieldError.checkNotNull(
                insights, r'PeriodTrackerDayInfo', 'insights'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
