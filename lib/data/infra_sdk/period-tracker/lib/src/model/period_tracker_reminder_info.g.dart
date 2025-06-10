// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_tracker_reminder_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerReminderInfo extends PeriodTrackerReminderInfo {
  @override
  final String title;
  @override
  final String reminderTime;
  @override
  final bool isRecurring;
  @override
  final BuiltList<String> daysOfWeek;

  factory _$PeriodTrackerReminderInfo(
          [void Function(PeriodTrackerReminderInfoBuilder)? updates]) =>
      (new PeriodTrackerReminderInfoBuilder()..update(updates))._build();

  _$PeriodTrackerReminderInfo._(
      {required this.title,
      required this.reminderTime,
      required this.isRecurring,
      required this.daysOfWeek})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        title, r'PeriodTrackerReminderInfo', 'title');
    BuiltValueNullFieldError.checkNotNull(
        reminderTime, r'PeriodTrackerReminderInfo', 'reminderTime');
    BuiltValueNullFieldError.checkNotNull(
        isRecurring, r'PeriodTrackerReminderInfo', 'isRecurring');
    BuiltValueNullFieldError.checkNotNull(
        daysOfWeek, r'PeriodTrackerReminderInfo', 'daysOfWeek');
  }

  @override
  PeriodTrackerReminderInfo rebuild(
          void Function(PeriodTrackerReminderInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerReminderInfoBuilder toBuilder() =>
      new PeriodTrackerReminderInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerReminderInfo &&
        title == other.title &&
        reminderTime == other.reminderTime &&
        isRecurring == other.isRecurring &&
        daysOfWeek == other.daysOfWeek;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, reminderTime.hashCode);
    _$hash = $jc(_$hash, isRecurring.hashCode);
    _$hash = $jc(_$hash, daysOfWeek.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerReminderInfo')
          ..add('title', title)
          ..add('reminderTime', reminderTime)
          ..add('isRecurring', isRecurring)
          ..add('daysOfWeek', daysOfWeek))
        .toString();
  }
}

class PeriodTrackerReminderInfoBuilder
    implements
        Builder<PeriodTrackerReminderInfo, PeriodTrackerReminderInfoBuilder> {
  _$PeriodTrackerReminderInfo? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _reminderTime;
  String? get reminderTime => _$this._reminderTime;
  set reminderTime(String? reminderTime) => _$this._reminderTime = reminderTime;

  bool? _isRecurring;
  bool? get isRecurring => _$this._isRecurring;
  set isRecurring(bool? isRecurring) => _$this._isRecurring = isRecurring;

  ListBuilder<String>? _daysOfWeek;
  ListBuilder<String> get daysOfWeek =>
      _$this._daysOfWeek ??= new ListBuilder<String>();
  set daysOfWeek(ListBuilder<String>? daysOfWeek) =>
      _$this._daysOfWeek = daysOfWeek;

  PeriodTrackerReminderInfoBuilder() {
    PeriodTrackerReminderInfo._defaults(this);
  }

  PeriodTrackerReminderInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _reminderTime = $v.reminderTime;
      _isRecurring = $v.isRecurring;
      _daysOfWeek = $v.daysOfWeek.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerReminderInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerReminderInfo;
  }

  @override
  void update(void Function(PeriodTrackerReminderInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerReminderInfo build() => _build();

  _$PeriodTrackerReminderInfo _build() {
    _$PeriodTrackerReminderInfo _$result;
    try {
      _$result = _$v ??
          new _$PeriodTrackerReminderInfo._(
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'PeriodTrackerReminderInfo', 'title'),
              reminderTime: BuiltValueNullFieldError.checkNotNull(
                  reminderTime, r'PeriodTrackerReminderInfo', 'reminderTime'),
              isRecurring: BuiltValueNullFieldError.checkNotNull(
                  isRecurring, r'PeriodTrackerReminderInfo', 'isRecurring'),
              daysOfWeek: daysOfWeek.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'daysOfWeek';
        daysOfWeek.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeriodTrackerReminderInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
