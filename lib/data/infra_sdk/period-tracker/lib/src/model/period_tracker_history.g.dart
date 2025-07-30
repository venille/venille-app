// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_tracker_history.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerHistory extends PeriodTrackerHistory {
  @override
  final BuiltList<PredictedYearTrackerInfo> years;

  factory _$PeriodTrackerHistory(
          [void Function(PeriodTrackerHistoryBuilder)? updates]) =>
      (new PeriodTrackerHistoryBuilder()..update(updates))._build();

  _$PeriodTrackerHistory._({required this.years}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        years, r'PeriodTrackerHistory', 'years');
  }

  @override
  PeriodTrackerHistory rebuild(
          void Function(PeriodTrackerHistoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerHistoryBuilder toBuilder() =>
      new PeriodTrackerHistoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerHistory && years == other.years;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, years.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerHistory')
          ..add('years', years))
        .toString();
  }
}

class PeriodTrackerHistoryBuilder
    implements Builder<PeriodTrackerHistory, PeriodTrackerHistoryBuilder> {
  _$PeriodTrackerHistory? _$v;

  ListBuilder<PredictedYearTrackerInfo>? _years;
  ListBuilder<PredictedYearTrackerInfo> get years =>
      _$this._years ??= new ListBuilder<PredictedYearTrackerInfo>();
  set years(ListBuilder<PredictedYearTrackerInfo>? years) =>
      _$this._years = years;

  PeriodTrackerHistoryBuilder() {
    PeriodTrackerHistory._defaults(this);
  }

  PeriodTrackerHistoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _years = $v.years.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerHistory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerHistory;
  }

  @override
  void update(void Function(PeriodTrackerHistoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerHistory build() => _build();

  _$PeriodTrackerHistory _build() {
    _$PeriodTrackerHistory _$result;
    try {
      _$result = _$v ?? new _$PeriodTrackerHistory._(years: years.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'years';
        years.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeriodTrackerHistory', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
