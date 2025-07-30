// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'monthly_period_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MonthlyPeriodInfo extends MonthlyPeriodInfo {
  @override
  final num month;
  @override
  final String monthName;
  @override
  final BuiltList<PeriodDayInfo> days;

  factory _$MonthlyPeriodInfo(
          [void Function(MonthlyPeriodInfoBuilder)? updates]) =>
      (new MonthlyPeriodInfoBuilder()..update(updates))._build();

  _$MonthlyPeriodInfo._(
      {required this.month, required this.monthName, required this.days})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(month, r'MonthlyPeriodInfo', 'month');
    BuiltValueNullFieldError.checkNotNull(
        monthName, r'MonthlyPeriodInfo', 'monthName');
    BuiltValueNullFieldError.checkNotNull(days, r'MonthlyPeriodInfo', 'days');
  }

  @override
  MonthlyPeriodInfo rebuild(void Function(MonthlyPeriodInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonthlyPeriodInfoBuilder toBuilder() =>
      new MonthlyPeriodInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonthlyPeriodInfo &&
        month == other.month &&
        monthName == other.monthName &&
        days == other.days;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jc(_$hash, monthName.hashCode);
    _$hash = $jc(_$hash, days.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MonthlyPeriodInfo')
          ..add('month', month)
          ..add('monthName', monthName)
          ..add('days', days))
        .toString();
  }
}

class MonthlyPeriodInfoBuilder
    implements Builder<MonthlyPeriodInfo, MonthlyPeriodInfoBuilder> {
  _$MonthlyPeriodInfo? _$v;

  num? _month;
  num? get month => _$this._month;
  set month(num? month) => _$this._month = month;

  String? _monthName;
  String? get monthName => _$this._monthName;
  set monthName(String? monthName) => _$this._monthName = monthName;

  ListBuilder<PeriodDayInfo>? _days;
  ListBuilder<PeriodDayInfo> get days =>
      _$this._days ??= new ListBuilder<PeriodDayInfo>();
  set days(ListBuilder<PeriodDayInfo>? days) => _$this._days = days;

  MonthlyPeriodInfoBuilder() {
    MonthlyPeriodInfo._defaults(this);
  }

  MonthlyPeriodInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _month = $v.month;
      _monthName = $v.monthName;
      _days = $v.days.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonthlyPeriodInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MonthlyPeriodInfo;
  }

  @override
  void update(void Function(MonthlyPeriodInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MonthlyPeriodInfo build() => _build();

  _$MonthlyPeriodInfo _build() {
    _$MonthlyPeriodInfo _$result;
    try {
      _$result = _$v ??
          new _$MonthlyPeriodInfo._(
              month: BuiltValueNullFieldError.checkNotNull(
                  month, r'MonthlyPeriodInfo', 'month'),
              monthName: BuiltValueNullFieldError.checkNotNull(
                  monthName, r'MonthlyPeriodInfo', 'monthName'),
              days: days.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'days';
        days.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MonthlyPeriodInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
