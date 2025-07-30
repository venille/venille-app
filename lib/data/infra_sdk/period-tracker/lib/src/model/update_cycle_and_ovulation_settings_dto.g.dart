// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'update_cycle_and_ovulation_settings_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCycleAndOvulationSettingsDto
    extends UpdateCycleAndOvulationSettingsDto {
  @override
  final num cycleLength;
  @override
  final num periodLength;
  @override
  final num lutealPhaseLength;

  factory _$UpdateCycleAndOvulationSettingsDto(
          [void Function(UpdateCycleAndOvulationSettingsDtoBuilder)?
              updates]) =>
      (new UpdateCycleAndOvulationSettingsDtoBuilder()..update(updates))
          ._build();

  _$UpdateCycleAndOvulationSettingsDto._(
      {required this.cycleLength,
      required this.periodLength,
      required this.lutealPhaseLength})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cycleLength, r'UpdateCycleAndOvulationSettingsDto', 'cycleLength');
    BuiltValueNullFieldError.checkNotNull(
        periodLength, r'UpdateCycleAndOvulationSettingsDto', 'periodLength');
    BuiltValueNullFieldError.checkNotNull(lutealPhaseLength,
        r'UpdateCycleAndOvulationSettingsDto', 'lutealPhaseLength');
  }

  @override
  UpdateCycleAndOvulationSettingsDto rebuild(
          void Function(UpdateCycleAndOvulationSettingsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCycleAndOvulationSettingsDtoBuilder toBuilder() =>
      new UpdateCycleAndOvulationSettingsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCycleAndOvulationSettingsDto &&
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
    return (newBuiltValueToStringHelper(r'UpdateCycleAndOvulationSettingsDto')
          ..add('cycleLength', cycleLength)
          ..add('periodLength', periodLength)
          ..add('lutealPhaseLength', lutealPhaseLength))
        .toString();
  }
}

class UpdateCycleAndOvulationSettingsDtoBuilder
    implements
        Builder<UpdateCycleAndOvulationSettingsDto,
            UpdateCycleAndOvulationSettingsDtoBuilder> {
  _$UpdateCycleAndOvulationSettingsDto? _$v;

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

  UpdateCycleAndOvulationSettingsDtoBuilder() {
    UpdateCycleAndOvulationSettingsDto._defaults(this);
  }

  UpdateCycleAndOvulationSettingsDtoBuilder get _$this {
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
  void replace(UpdateCycleAndOvulationSettingsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCycleAndOvulationSettingsDto;
  }

  @override
  void update(
      void Function(UpdateCycleAndOvulationSettingsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCycleAndOvulationSettingsDto build() => _build();

  _$UpdateCycleAndOvulationSettingsDto _build() {
    final _$result = _$v ??
        new _$UpdateCycleAndOvulationSettingsDto._(
            cycleLength: BuiltValueNullFieldError.checkNotNull(cycleLength,
                r'UpdateCycleAndOvulationSettingsDto', 'cycleLength'),
            periodLength: BuiltValueNullFieldError.checkNotNull(periodLength,
                r'UpdateCycleAndOvulationSettingsDto', 'periodLength'),
            lutealPhaseLength: BuiltValueNullFieldError.checkNotNull(
                lutealPhaseLength,
                r'UpdateCycleAndOvulationSettingsDto',
                'lutealPhaseLength'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
