// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_tracker_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerInfo extends PeriodTrackerInfo {
  @override
  final String today;
  @override
  final PeriodTrackerCalendarInfo calendar;
  @override
  final PeriodTrackerOvulationCountdown ovulationCountdown;
  @override
  final BuiltList<String> symptomsLoggedToday;
  @override
  final BuiltList<PeriodTrackerReminderInfo> reminders;
  @override
  final PeriodTrackerLastPeriodInfo lastPeriod;

  factory _$PeriodTrackerInfo(
          [void Function(PeriodTrackerInfoBuilder)? updates]) =>
      (new PeriodTrackerInfoBuilder()..update(updates))._build();

  _$PeriodTrackerInfo._(
      {required this.today,
      required this.calendar,
      required this.ovulationCountdown,
      required this.symptomsLoggedToday,
      required this.reminders,
      required this.lastPeriod})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(today, r'PeriodTrackerInfo', 'today');
    BuiltValueNullFieldError.checkNotNull(
        calendar, r'PeriodTrackerInfo', 'calendar');
    BuiltValueNullFieldError.checkNotNull(
        ovulationCountdown, r'PeriodTrackerInfo', 'ovulationCountdown');
    BuiltValueNullFieldError.checkNotNull(
        symptomsLoggedToday, r'PeriodTrackerInfo', 'symptomsLoggedToday');
    BuiltValueNullFieldError.checkNotNull(
        reminders, r'PeriodTrackerInfo', 'reminders');
    BuiltValueNullFieldError.checkNotNull(
        lastPeriod, r'PeriodTrackerInfo', 'lastPeriod');
  }

  @override
  PeriodTrackerInfo rebuild(void Function(PeriodTrackerInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerInfoBuilder toBuilder() =>
      new PeriodTrackerInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerInfo &&
        today == other.today &&
        calendar == other.calendar &&
        ovulationCountdown == other.ovulationCountdown &&
        symptomsLoggedToday == other.symptomsLoggedToday &&
        reminders == other.reminders &&
        lastPeriod == other.lastPeriod;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, today.hashCode);
    _$hash = $jc(_$hash, calendar.hashCode);
    _$hash = $jc(_$hash, ovulationCountdown.hashCode);
    _$hash = $jc(_$hash, symptomsLoggedToday.hashCode);
    _$hash = $jc(_$hash, reminders.hashCode);
    _$hash = $jc(_$hash, lastPeriod.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerInfo')
          ..add('today', today)
          ..add('calendar', calendar)
          ..add('ovulationCountdown', ovulationCountdown)
          ..add('symptomsLoggedToday', symptomsLoggedToday)
          ..add('reminders', reminders)
          ..add('lastPeriod', lastPeriod))
        .toString();
  }
}

class PeriodTrackerInfoBuilder
    implements Builder<PeriodTrackerInfo, PeriodTrackerInfoBuilder> {
  _$PeriodTrackerInfo? _$v;

  String? _today;
  String? get today => _$this._today;
  set today(String? today) => _$this._today = today;

  PeriodTrackerCalendarInfoBuilder? _calendar;
  PeriodTrackerCalendarInfoBuilder get calendar =>
      _$this._calendar ??= new PeriodTrackerCalendarInfoBuilder();
  set calendar(PeriodTrackerCalendarInfoBuilder? calendar) =>
      _$this._calendar = calendar;

  PeriodTrackerOvulationCountdownBuilder? _ovulationCountdown;
  PeriodTrackerOvulationCountdownBuilder get ovulationCountdown =>
      _$this._ovulationCountdown ??=
          new PeriodTrackerOvulationCountdownBuilder();
  set ovulationCountdown(
          PeriodTrackerOvulationCountdownBuilder? ovulationCountdown) =>
      _$this._ovulationCountdown = ovulationCountdown;

  ListBuilder<String>? _symptomsLoggedToday;
  ListBuilder<String> get symptomsLoggedToday =>
      _$this._symptomsLoggedToday ??= new ListBuilder<String>();
  set symptomsLoggedToday(ListBuilder<String>? symptomsLoggedToday) =>
      _$this._symptomsLoggedToday = symptomsLoggedToday;

  ListBuilder<PeriodTrackerReminderInfo>? _reminders;
  ListBuilder<PeriodTrackerReminderInfo> get reminders =>
      _$this._reminders ??= new ListBuilder<PeriodTrackerReminderInfo>();
  set reminders(ListBuilder<PeriodTrackerReminderInfo>? reminders) =>
      _$this._reminders = reminders;

  PeriodTrackerLastPeriodInfoBuilder? _lastPeriod;
  PeriodTrackerLastPeriodInfoBuilder get lastPeriod =>
      _$this._lastPeriod ??= new PeriodTrackerLastPeriodInfoBuilder();
  set lastPeriod(PeriodTrackerLastPeriodInfoBuilder? lastPeriod) =>
      _$this._lastPeriod = lastPeriod;

  PeriodTrackerInfoBuilder() {
    PeriodTrackerInfo._defaults(this);
  }

  PeriodTrackerInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _today = $v.today;
      _calendar = $v.calendar.toBuilder();
      _ovulationCountdown = $v.ovulationCountdown.toBuilder();
      _symptomsLoggedToday = $v.symptomsLoggedToday.toBuilder();
      _reminders = $v.reminders.toBuilder();
      _lastPeriod = $v.lastPeriod.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerInfo;
  }

  @override
  void update(void Function(PeriodTrackerInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerInfo build() => _build();

  _$PeriodTrackerInfo _build() {
    _$PeriodTrackerInfo _$result;
    try {
      _$result = _$v ??
          new _$PeriodTrackerInfo._(
              today: BuiltValueNullFieldError.checkNotNull(
                  today, r'PeriodTrackerInfo', 'today'),
              calendar: calendar.build(),
              ovulationCountdown: ovulationCountdown.build(),
              symptomsLoggedToday: symptomsLoggedToday.build(),
              reminders: reminders.build(),
              lastPeriod: lastPeriod.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'calendar';
        calendar.build();
        _$failedField = 'ovulationCountdown';
        ovulationCountdown.build();
        _$failedField = 'symptomsLoggedToday';
        symptomsLoggedToday.build();
        _$failedField = 'reminders';
        reminders.build();
        _$failedField = 'lastPeriod';
        lastPeriod.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeriodTrackerInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
