// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'cycle_ovulation_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CycleOvulationInfo extends CycleOvulationInfo {
  @override
  final num cycleLength;
  @override
  final num periodLength;
  @override
  final num lutealPhaseLength;

  factory _$CycleOvulationInfo(
          [void Function(CycleOvulationInfoBuilder)? updates]) =>
      (new CycleOvulationInfoBuilder()..update(updates))._build();

  _$CycleOvulationInfo._(
      {required this.cycleLength,
      required this.periodLength,
      required this.lutealPhaseLength})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cycleLength, r'CycleOvulationInfo', 'cycleLength');
    BuiltValueNullFieldError.checkNotNull(
        periodLength, r'CycleOvulationInfo', 'periodLength');
    BuiltValueNullFieldError.checkNotNull(
        lutealPhaseLength, r'CycleOvulationInfo', 'lutealPhaseLength');
  }

  @override
  CycleOvulationInfo rebuild(
          void Function(CycleOvulationInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CycleOvulationInfoBuilder toBuilder() =>
      new CycleOvulationInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CycleOvulationInfo &&
        cycleLength == other.cycleLength &&
        periodLength == other.periodLength &&
        lutealPhaseLength == other.lutealPhaseLength;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cycleLength.hashCode);
    _$hash = $jc(_$hash, periodLength.hashCode);
    _$hash = $jc(_$hash, lutealPhaseLength.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CycleOvulationInfo')
          ..add('cycleLength', cycleLength)
          ..add('periodLength', periodLength)
          ..add('lutealPhaseLength', lutealPhaseLength))
        .toString();
  }
}

class CycleOvulationInfoBuilder
    implements Builder<CycleOvulationInfo, CycleOvulationInfoBuilder> {
  _$CycleOvulationInfo? _$v;

  num? _cycleLength;
  num? get cycleLength => _$this._cycleLength;
  set cycleLength(num? cycleLength) => _$this._cycleLength = cycleLength;

  num? _periodLength;
  num? get periodLength => _$this._periodLength;
  set periodLength(num? periodLength) => _$this._periodLength = periodLength;

  num? _lutealPhaseLength;
  num? get lutealPhaseLength => _$this._lutealPhaseLength;
  set lutealPhaseLength(num? lutealPhaseLength) =>
      _$this._lutealPhaseLength = lutealPhaseLength;

  CycleOvulationInfoBuilder() {
    CycleOvulationInfo._defaults(this);
  }

  CycleOvulationInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cycleLength = $v.cycleLength;
      _periodLength = $v.periodLength;
      _lutealPhaseLength = $v.lutealPhaseLength;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CycleOvulationInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CycleOvulationInfo;
  }

  @override
  void update(void Function(CycleOvulationInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CycleOvulationInfo build() => _build();

  _$CycleOvulationInfo _build() {
    final _$result = _$v ??
        new _$CycleOvulationInfo._(
            cycleLength: BuiltValueNullFieldError.checkNotNull(
                cycleLength, r'CycleOvulationInfo', 'cycleLength'),
            periodLength: BuiltValueNullFieldError.checkNotNull(
                periodLength, r'CycleOvulationInfo', 'periodLength'),
            lutealPhaseLength: BuiltValueNullFieldError.checkNotNull(
                lutealPhaseLength, r'CycleOvulationInfo', 'lutealPhaseLength'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
