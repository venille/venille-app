// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_tracker_last_period_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerLastPeriodInfo extends PeriodTrackerLastPeriodInfo {
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final bool isPredicted;

  factory _$PeriodTrackerLastPeriodInfo(
          [void Function(PeriodTrackerLastPeriodInfoBuilder)? updates]) =>
      (new PeriodTrackerLastPeriodInfoBuilder()..update(updates))._build();

  _$PeriodTrackerLastPeriodInfo._(
      {required this.startDate,
      required this.endDate,
      required this.isPredicted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        startDate, r'PeriodTrackerLastPeriodInfo', 'startDate');
    BuiltValueNullFieldError.checkNotNull(
        endDate, r'PeriodTrackerLastPeriodInfo', 'endDate');
    BuiltValueNullFieldError.checkNotNull(
        isPredicted, r'PeriodTrackerLastPeriodInfo', 'isPredicted');
  }

  @override
  PeriodTrackerLastPeriodInfo rebuild(
          void Function(PeriodTrackerLastPeriodInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerLastPeriodInfoBuilder toBuilder() =>
      new PeriodTrackerLastPeriodInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerLastPeriodInfo &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        isPredicted == other.isPredicted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, isPredicted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerLastPeriodInfo')
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('isPredicted', isPredicted))
        .toString();
  }
}

class PeriodTrackerLastPeriodInfoBuilder
    implements
        Builder<PeriodTrackerLastPeriodInfo,
            PeriodTrackerLastPeriodInfoBuilder> {
  _$PeriodTrackerLastPeriodInfo? _$v;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  bool? _isPredicted;
  bool? get isPredicted => _$this._isPredicted;
  set isPredicted(bool? isPredicted) => _$this._isPredicted = isPredicted;

  PeriodTrackerLastPeriodInfoBuilder() {
    PeriodTrackerLastPeriodInfo._defaults(this);
  }

  PeriodTrackerLastPeriodInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _isPredicted = $v.isPredicted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerLastPeriodInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerLastPeriodInfo;
  }

  @override
  void update(void Function(PeriodTrackerLastPeriodInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerLastPeriodInfo build() => _build();

  _$PeriodTrackerLastPeriodInfo _build() {
    final _$result = _$v ??
        new _$PeriodTrackerLastPeriodInfo._(
            startDate: BuiltValueNullFieldError.checkNotNull(
                startDate, r'PeriodTrackerLastPeriodInfo', 'startDate'),
            endDate: BuiltValueNullFieldError.checkNotNull(
                endDate, r'PeriodTrackerLastPeriodInfo', 'endDate'),
            isPredicted: BuiltValueNullFieldError.checkNotNull(
                isPredicted, r'PeriodTrackerLastPeriodInfo', 'isPredicted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
