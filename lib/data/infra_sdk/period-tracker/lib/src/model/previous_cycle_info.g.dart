// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'previous_cycle_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PreviousCycleInfo extends PreviousCycleInfo {
  @override
  final String startDate;
  @override
  final String daysAgo;
  @override
  final String duration;
  @override
  final String durationStatus;
  @override
  final String cycleLength;
  @override
  final String cycleLengthStatus;

  factory _$PreviousCycleInfo(
          [void Function(PreviousCycleInfoBuilder)? updates]) =>
      (new PreviousCycleInfoBuilder()..update(updates))._build();

  _$PreviousCycleInfo._(
      {required this.startDate,
      required this.daysAgo,
      required this.duration,
      required this.durationStatus,
      required this.cycleLength,
      required this.cycleLengthStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        startDate, r'PreviousCycleInfo', 'startDate');
    BuiltValueNullFieldError.checkNotNull(
        daysAgo, r'PreviousCycleInfo', 'daysAgo');
    BuiltValueNullFieldError.checkNotNull(
        duration, r'PreviousCycleInfo', 'duration');
    BuiltValueNullFieldError.checkNotNull(
        durationStatus, r'PreviousCycleInfo', 'durationStatus');
    BuiltValueNullFieldError.checkNotNull(
        cycleLength, r'PreviousCycleInfo', 'cycleLength');
    BuiltValueNullFieldError.checkNotNull(
        cycleLengthStatus, r'PreviousCycleInfo', 'cycleLengthStatus');
  }

  @override
  PreviousCycleInfo rebuild(void Function(PreviousCycleInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PreviousCycleInfoBuilder toBuilder() =>
      new PreviousCycleInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PreviousCycleInfo &&
        startDate == other.startDate &&
        daysAgo == other.daysAgo &&
        duration == other.duration &&
        durationStatus == other.durationStatus &&
        cycleLength == other.cycleLength &&
        cycleLengthStatus == other.cycleLengthStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, daysAgo.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, durationStatus.hashCode);
    _$hash = $jc(_$hash, cycleLength.hashCode);
    _$hash = $jc(_$hash, cycleLengthStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PreviousCycleInfo')
          ..add('startDate', startDate)
          ..add('daysAgo', daysAgo)
          ..add('duration', duration)
          ..add('durationStatus', durationStatus)
          ..add('cycleLength', cycleLength)
          ..add('cycleLengthStatus', cycleLengthStatus))
        .toString();
  }
}

class PreviousCycleInfoBuilder
    implements Builder<PreviousCycleInfo, PreviousCycleInfoBuilder> {
  _$PreviousCycleInfo? _$v;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _daysAgo;
  String? get daysAgo => _$this._daysAgo;
  set daysAgo(String? daysAgo) => _$this._daysAgo = daysAgo;

  String? _duration;
  String? get duration => _$this._duration;
  set duration(String? duration) => _$this._duration = duration;

  String? _durationStatus;
  String? get durationStatus => _$this._durationStatus;
  set durationStatus(String? durationStatus) =>
      _$this._durationStatus = durationStatus;

  String? _cycleLength;
  String? get cycleLength => _$this._cycleLength;
  set cycleLength(String? cycleLength) => _$this._cycleLength = cycleLength;

  String? _cycleLengthStatus;
  String? get cycleLengthStatus => _$this._cycleLengthStatus;
  set cycleLengthStatus(String? cycleLengthStatus) =>
      _$this._cycleLengthStatus = cycleLengthStatus;

  PreviousCycleInfoBuilder() {
    PreviousCycleInfo._defaults(this);
  }

  PreviousCycleInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startDate = $v.startDate;
      _daysAgo = $v.daysAgo;
      _duration = $v.duration;
      _durationStatus = $v.durationStatus;
      _cycleLength = $v.cycleLength;
      _cycleLengthStatus = $v.cycleLengthStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PreviousCycleInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PreviousCycleInfo;
  }

  @override
  void update(void Function(PreviousCycleInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PreviousCycleInfo build() => _build();

  _$PreviousCycleInfo _build() {
    final _$result = _$v ??
        new _$PreviousCycleInfo._(
            startDate: BuiltValueNullFieldError.checkNotNull(
                startDate, r'PreviousCycleInfo', 'startDate'),
            daysAgo: BuiltValueNullFieldError.checkNotNull(
                daysAgo, r'PreviousCycleInfo', 'daysAgo'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'PreviousCycleInfo', 'duration'),
            durationStatus: BuiltValueNullFieldError.checkNotNull(
                durationStatus, r'PreviousCycleInfo', 'durationStatus'),
            cycleLength: BuiltValueNullFieldError.checkNotNull(
                cycleLength, r'PreviousCycleInfo', 'cycleLength'),
            cycleLengthStatus: BuiltValueNullFieldError.checkNotNull(
                cycleLengthStatus, r'PreviousCycleInfo', 'cycleLengthStatus'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
