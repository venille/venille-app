// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'predicted_year_tracker_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PredictedYearTrackerInfo extends PredictedYearTrackerInfo {
  @override
  final num currentYear;
  @override
  final BuiltList<MonthlyPeriodInfo> months;

  factory _$PredictedYearTrackerInfo(
          [void Function(PredictedYearTrackerInfoBuilder)? updates]) =>
      (new PredictedYearTrackerInfoBuilder()..update(updates))._build();

  _$PredictedYearTrackerInfo._(
      {required this.currentYear, required this.months})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currentYear, r'PredictedYearTrackerInfo', 'currentYear');
    BuiltValueNullFieldError.checkNotNull(
        months, r'PredictedYearTrackerInfo', 'months');
  }

  @override
  PredictedYearTrackerInfo rebuild(
          void Function(PredictedYearTrackerInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PredictedYearTrackerInfoBuilder toBuilder() =>
      new PredictedYearTrackerInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PredictedYearTrackerInfo &&
        currentYear == other.currentYear &&
        months == other.months;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentYear.hashCode);
    _$hash = $jc(_$hash, months.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PredictedYearTrackerInfo')
          ..add('currentYear', currentYear)
          ..add('months', months))
        .toString();
  }
}

class PredictedYearTrackerInfoBuilder
    implements
        Builder<PredictedYearTrackerInfo, PredictedYearTrackerInfoBuilder> {
  _$PredictedYearTrackerInfo? _$v;

  num? _currentYear;
  num? get currentYear => _$this._currentYear;
  set currentYear(num? currentYear) => _$this._currentYear = currentYear;

  ListBuilder<MonthlyPeriodInfo>? _months;
  ListBuilder<MonthlyPeriodInfo> get months =>
      _$this._months ??= new ListBuilder<MonthlyPeriodInfo>();
  set months(ListBuilder<MonthlyPeriodInfo>? months) => _$this._months = months;

  PredictedYearTrackerInfoBuilder() {
    PredictedYearTrackerInfo._defaults(this);
  }

  PredictedYearTrackerInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentYear = $v.currentYear;
      _months = $v.months.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PredictedYearTrackerInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PredictedYearTrackerInfo;
  }

  @override
  void update(void Function(PredictedYearTrackerInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PredictedYearTrackerInfo build() => _build();

  _$PredictedYearTrackerInfo _build() {
    _$PredictedYearTrackerInfo _$result;
    try {
      _$result = _$v ??
          new _$PredictedYearTrackerInfo._(
              currentYear: BuiltValueNullFieldError.checkNotNull(
                  currentYear, r'PredictedYearTrackerInfo', 'currentYear'),
              months: months.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'months';
        months.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PredictedYearTrackerInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
