// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_day_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodDayInfo extends PeriodDayInfo {
  @override
  final DateTime date;
  @override
  final bool isToday;
  @override
  final bool isLoggedPeriodDay;
  @override
  final bool isPredictedPeriodDay;
  @override
  final bool isPredictedOvulationDay;
  @override
  final bool isFertileWindow;
  @override
  final num cycleDayCount;
  @override
  final String insights;

  factory _$PeriodDayInfo([void Function(PeriodDayInfoBuilder)? updates]) =>
      (new PeriodDayInfoBuilder()..update(updates))._build();

  _$PeriodDayInfo._(
      {required this.date,
      required this.isToday,
      required this.isLoggedPeriodDay,
      required this.isPredictedPeriodDay,
      required this.isPredictedOvulationDay,
      required this.isFertileWindow,
      required this.cycleDayCount,
      required this.insights})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(date, r'PeriodDayInfo', 'date');
    BuiltValueNullFieldError.checkNotNull(isToday, r'PeriodDayInfo', 'isToday');
    BuiltValueNullFieldError.checkNotNull(
        isLoggedPeriodDay, r'PeriodDayInfo', 'isLoggedPeriodDay');
    BuiltValueNullFieldError.checkNotNull(
        isPredictedPeriodDay, r'PeriodDayInfo', 'isPredictedPeriodDay');
    BuiltValueNullFieldError.checkNotNull(
        isPredictedOvulationDay, r'PeriodDayInfo', 'isPredictedOvulationDay');
    BuiltValueNullFieldError.checkNotNull(
        isFertileWindow, r'PeriodDayInfo', 'isFertileWindow');
    BuiltValueNullFieldError.checkNotNull(
        cycleDayCount, r'PeriodDayInfo', 'cycleDayCount');
    BuiltValueNullFieldError.checkNotNull(
        insights, r'PeriodDayInfo', 'insights');
  }

  @override
  PeriodDayInfo rebuild(void Function(PeriodDayInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodDayInfoBuilder toBuilder() => new PeriodDayInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodDayInfo &&
        date == other.date &&
        isToday == other.isToday &&
        isLoggedPeriodDay == other.isLoggedPeriodDay &&
        isPredictedPeriodDay == other.isPredictedPeriodDay &&
        isPredictedOvulationDay == other.isPredictedOvulationDay &&
        isFertileWindow == other.isFertileWindow &&
        cycleDayCount == other.cycleDayCount &&
        insights == other.insights;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, isToday.hashCode);
    _$hash = $jc(_$hash, isLoggedPeriodDay.hashCode);
    _$hash = $jc(_$hash, isPredictedPeriodDay.hashCode);
    _$hash = $jc(_$hash, isPredictedOvulationDay.hashCode);
    _$hash = $jc(_$hash, isFertileWindow.hashCode);
    _$hash = $jc(_$hash, cycleDayCount.hashCode);
    _$hash = $jc(_$hash, insights.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodDayInfo')
          ..add('date', date)
          ..add('isToday', isToday)
          ..add('isLoggedPeriodDay', isLoggedPeriodDay)
          ..add('isPredictedPeriodDay', isPredictedPeriodDay)
          ..add('isPredictedOvulationDay', isPredictedOvulationDay)
          ..add('isFertileWindow', isFertileWindow)
          ..add('cycleDayCount', cycleDayCount)
          ..add('insights', insights))
        .toString();
  }
}

class PeriodDayInfoBuilder
    implements Builder<PeriodDayInfo, PeriodDayInfoBuilder> {
  _$PeriodDayInfo? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  bool? _isToday;
  bool? get isToday => _$this._isToday;
  set isToday(bool? isToday) => _$this._isToday = isToday;

  bool? _isLoggedPeriodDay;
  bool? get isLoggedPeriodDay => _$this._isLoggedPeriodDay;
  set isLoggedPeriodDay(bool? isLoggedPeriodDay) =>
      _$this._isLoggedPeriodDay = isLoggedPeriodDay;

  bool? _isPredictedPeriodDay;
  bool? get isPredictedPeriodDay => _$this._isPredictedPeriodDay;
  set isPredictedPeriodDay(bool? isPredictedPeriodDay) =>
      _$this._isPredictedPeriodDay = isPredictedPeriodDay;

  bool? _isPredictedOvulationDay;
  bool? get isPredictedOvulationDay => _$this._isPredictedOvulationDay;
  set isPredictedOvulationDay(bool? isPredictedOvulationDay) =>
      _$this._isPredictedOvulationDay = isPredictedOvulationDay;

  bool? _isFertileWindow;
  bool? get isFertileWindow => _$this._isFertileWindow;
  set isFertileWindow(bool? isFertileWindow) =>
      _$this._isFertileWindow = isFertileWindow;

  num? _cycleDayCount;
  num? get cycleDayCount => _$this._cycleDayCount;
  set cycleDayCount(num? cycleDayCount) =>
      _$this._cycleDayCount = cycleDayCount;

  String? _insights;
  String? get insights => _$this._insights;
  set insights(String? insights) => _$this._insights = insights;

  PeriodDayInfoBuilder() {
    PeriodDayInfo._defaults(this);
  }

  PeriodDayInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _isToday = $v.isToday;
      _isLoggedPeriodDay = $v.isLoggedPeriodDay;
      _isPredictedPeriodDay = $v.isPredictedPeriodDay;
      _isPredictedOvulationDay = $v.isPredictedOvulationDay;
      _isFertileWindow = $v.isFertileWindow;
      _cycleDayCount = $v.cycleDayCount;
      _insights = $v.insights;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodDayInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodDayInfo;
  }

  @override
  void update(void Function(PeriodDayInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodDayInfo build() => _build();

  _$PeriodDayInfo _build() {
    final _$result = _$v ??
        new _$PeriodDayInfo._(
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'PeriodDayInfo', 'date'),
            isToday: BuiltValueNullFieldError.checkNotNull(
                isToday, r'PeriodDayInfo', 'isToday'),
            isLoggedPeriodDay: BuiltValueNullFieldError.checkNotNull(
                isLoggedPeriodDay, r'PeriodDayInfo', 'isLoggedPeriodDay'),
            isPredictedPeriodDay: BuiltValueNullFieldError.checkNotNull(
                isPredictedPeriodDay, r'PeriodDayInfo', 'isPredictedPeriodDay'),
            isPredictedOvulationDay: BuiltValueNullFieldError.checkNotNull(
                isPredictedOvulationDay, r'PeriodDayInfo', 'isPredictedOvulationDay'),
            isFertileWindow: BuiltValueNullFieldError.checkNotNull(
                isFertileWindow, r'PeriodDayInfo', 'isFertileWindow'),
            cycleDayCount: BuiltValueNullFieldError.checkNotNull(
                cycleDayCount, r'PeriodDayInfo', 'cycleDayCount'),
            insights: BuiltValueNullFieldError.checkNotNull(
                insights, r'PeriodDayInfo', 'insights'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
