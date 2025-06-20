// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_log_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodLogInfo extends PeriodLogInfo {
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final bool isPredicted;

  factory _$PeriodLogInfo([void Function(PeriodLogInfoBuilder)? updates]) =>
      (new PeriodLogInfoBuilder()..update(updates))._build();

  _$PeriodLogInfo._(
      {required this.startDate,
      required this.endDate,
      required this.isPredicted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        startDate, r'PeriodLogInfo', 'startDate');
    BuiltValueNullFieldError.checkNotNull(endDate, r'PeriodLogInfo', 'endDate');
    BuiltValueNullFieldError.checkNotNull(
        isPredicted, r'PeriodLogInfo', 'isPredicted');
  }

  @override
  PeriodLogInfo rebuild(void Function(PeriodLogInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodLogInfoBuilder toBuilder() => new PeriodLogInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodLogInfo &&
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
    return (newBuiltValueToStringHelper(r'PeriodLogInfo')
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('isPredicted', isPredicted))
        .toString();
  }
}

class PeriodLogInfoBuilder
    implements Builder<PeriodLogInfo, PeriodLogInfoBuilder> {
  _$PeriodLogInfo? _$v;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  bool? _isPredicted;
  bool? get isPredicted => _$this._isPredicted;
  set isPredicted(bool? isPredicted) => _$this._isPredicted = isPredicted;

  PeriodLogInfoBuilder() {
    PeriodLogInfo._defaults(this);
  }

  PeriodLogInfoBuilder get _$this {
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
  void replace(PeriodLogInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodLogInfo;
  }

  @override
  void update(void Function(PeriodLogInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodLogInfo build() => _build();

  _$PeriodLogInfo _build() {
    final _$result = _$v ??
        new _$PeriodLogInfo._(
            startDate: BuiltValueNullFieldError.checkNotNull(
                startDate, r'PeriodLogInfo', 'startDate'),
            endDate: BuiltValueNullFieldError.checkNotNull(
                endDate, r'PeriodLogInfo', 'endDate'),
            isPredicted: BuiltValueNullFieldError.checkNotNull(
                isPredicted, r'PeriodLogInfo', 'isPredicted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
