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

part of 'register_period_tracker_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterPeriodTrackerDTO extends RegisterPeriodTrackerDTO {
  @override
  final String lastPeriodStartDate;
  @override
  final num periodLengthDays;
  @override
  final num cycleLengthDays;
  @override
  final bool irregularPeriods;
  @override
  final String periodSymptoms;
  @override
  final bool trackingOvulation;
  @override
  final num age;
  @override
  final String birthControlMethods;
  @override
  final String healthConditions;

  factory _$RegisterPeriodTrackerDTO(
          [void Function(RegisterPeriodTrackerDTOBuilder)? updates]) =>
      (new RegisterPeriodTrackerDTOBuilder()..update(updates))._build();

  _$RegisterPeriodTrackerDTO._(
      {required this.lastPeriodStartDate,
      required this.periodLengthDays,
      required this.cycleLengthDays,
      required this.irregularPeriods,
      required this.periodSymptoms,
      required this.trackingOvulation,
      required this.age,
      required this.birthControlMethods,
      required this.healthConditions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(lastPeriodStartDate,
        r'RegisterPeriodTrackerDTO', 'lastPeriodStartDate');
    BuiltValueNullFieldError.checkNotNull(
        periodLengthDays, r'RegisterPeriodTrackerDTO', 'periodLengthDays');
    BuiltValueNullFieldError.checkNotNull(
        cycleLengthDays, r'RegisterPeriodTrackerDTO', 'cycleLengthDays');
    BuiltValueNullFieldError.checkNotNull(
        irregularPeriods, r'RegisterPeriodTrackerDTO', 'irregularPeriods');
    BuiltValueNullFieldError.checkNotNull(
        periodSymptoms, r'RegisterPeriodTrackerDTO', 'periodSymptoms');
    BuiltValueNullFieldError.checkNotNull(
        trackingOvulation, r'RegisterPeriodTrackerDTO', 'trackingOvulation');
    BuiltValueNullFieldError.checkNotNull(
        age, r'RegisterPeriodTrackerDTO', 'age');
    BuiltValueNullFieldError.checkNotNull(birthControlMethods,
        r'RegisterPeriodTrackerDTO', 'birthControlMethods');
    BuiltValueNullFieldError.checkNotNull(
        healthConditions, r'RegisterPeriodTrackerDTO', 'healthConditions');
  }

  @override
  RegisterPeriodTrackerDTO rebuild(
          void Function(RegisterPeriodTrackerDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterPeriodTrackerDTOBuilder toBuilder() =>
      new RegisterPeriodTrackerDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterPeriodTrackerDTO &&
        lastPeriodStartDate == other.lastPeriodStartDate &&
        periodLengthDays == other.periodLengthDays &&
        cycleLengthDays == other.cycleLengthDays &&
        irregularPeriods == other.irregularPeriods &&
        periodSymptoms == other.periodSymptoms &&
        trackingOvulation == other.trackingOvulation &&
        age == other.age &&
        birthControlMethods == other.birthControlMethods &&
        healthConditions == other.healthConditions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, lastPeriodStartDate.hashCode);
    _$hash = $jc(_$hash, periodLengthDays.hashCode);
    _$hash = $jc(_$hash, cycleLengthDays.hashCode);
    _$hash = $jc(_$hash, irregularPeriods.hashCode);
    _$hash = $jc(_$hash, periodSymptoms.hashCode);
    _$hash = $jc(_$hash, trackingOvulation.hashCode);
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jc(_$hash, birthControlMethods.hashCode);
    _$hash = $jc(_$hash, healthConditions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterPeriodTrackerDTO')
          ..add('lastPeriodStartDate', lastPeriodStartDate)
          ..add('periodLengthDays', periodLengthDays)
          ..add('cycleLengthDays', cycleLengthDays)
          ..add('irregularPeriods', irregularPeriods)
          ..add('periodSymptoms', periodSymptoms)
          ..add('trackingOvulation', trackingOvulation)
          ..add('age', age)
          ..add('birthControlMethods', birthControlMethods)
          ..add('healthConditions', healthConditions))
        .toString();
  }
}

class RegisterPeriodTrackerDTOBuilder
    implements
        Builder<RegisterPeriodTrackerDTO, RegisterPeriodTrackerDTOBuilder> {
  _$RegisterPeriodTrackerDTO? _$v;

  String? _lastPeriodStartDate;
  String? get lastPeriodStartDate => _$this._lastPeriodStartDate;
  set lastPeriodStartDate(String? lastPeriodStartDate) =>
      _$this._lastPeriodStartDate = lastPeriodStartDate;

  num? _periodLengthDays;
  num? get periodLengthDays => _$this._periodLengthDays;
  set periodLengthDays(num? periodLengthDays) =>
      _$this._periodLengthDays = periodLengthDays;

  num? _cycleLengthDays;
  num? get cycleLengthDays => _$this._cycleLengthDays;
  set cycleLengthDays(num? cycleLengthDays) =>
      _$this._cycleLengthDays = cycleLengthDays;

  bool? _irregularPeriods;
  bool? get irregularPeriods => _$this._irregularPeriods;
  set irregularPeriods(bool? irregularPeriods) =>
      _$this._irregularPeriods = irregularPeriods;

  String? _periodSymptoms;
  String? get periodSymptoms => _$this._periodSymptoms;
  set periodSymptoms(String? periodSymptoms) =>
      _$this._periodSymptoms = periodSymptoms;

  bool? _trackingOvulation;
  bool? get trackingOvulation => _$this._trackingOvulation;
  set trackingOvulation(bool? trackingOvulation) =>
      _$this._trackingOvulation = trackingOvulation;

  num? _age;
  num? get age => _$this._age;
  set age(num? age) => _$this._age = age;

  String? _birthControlMethods;
  String? get birthControlMethods => _$this._birthControlMethods;
  set birthControlMethods(String? birthControlMethods) =>
      _$this._birthControlMethods = birthControlMethods;

  String? _healthConditions;
  String? get healthConditions => _$this._healthConditions;
  set healthConditions(String? healthConditions) =>
      _$this._healthConditions = healthConditions;

  RegisterPeriodTrackerDTOBuilder() {
    RegisterPeriodTrackerDTO._defaults(this);
  }

  RegisterPeriodTrackerDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lastPeriodStartDate = $v.lastPeriodStartDate;
      _periodLengthDays = $v.periodLengthDays;
      _cycleLengthDays = $v.cycleLengthDays;
      _irregularPeriods = $v.irregularPeriods;
      _periodSymptoms = $v.periodSymptoms;
      _trackingOvulation = $v.trackingOvulation;
      _age = $v.age;
      _birthControlMethods = $v.birthControlMethods;
      _healthConditions = $v.healthConditions;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterPeriodTrackerDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterPeriodTrackerDTO;
  }

  @override
  void update(void Function(RegisterPeriodTrackerDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterPeriodTrackerDTO build() => _build();

  _$RegisterPeriodTrackerDTO _build() {
    final _$result = _$v ??
        new _$RegisterPeriodTrackerDTO._(
            lastPeriodStartDate: BuiltValueNullFieldError.checkNotNull(
                lastPeriodStartDate, r'RegisterPeriodTrackerDTO', 'lastPeriodStartDate'),
            periodLengthDays: BuiltValueNullFieldError.checkNotNull(
                periodLengthDays, r'RegisterPeriodTrackerDTO', 'periodLengthDays'),
            cycleLengthDays: BuiltValueNullFieldError.checkNotNull(
                cycleLengthDays, r'RegisterPeriodTrackerDTO', 'cycleLengthDays'),
            irregularPeriods: BuiltValueNullFieldError.checkNotNull(
                irregularPeriods, r'RegisterPeriodTrackerDTO', 'irregularPeriods'),
            periodSymptoms: BuiltValueNullFieldError.checkNotNull(
                periodSymptoms, r'RegisterPeriodTrackerDTO', 'periodSymptoms'),
            trackingOvulation: BuiltValueNullFieldError.checkNotNull(
                trackingOvulation, r'RegisterPeriodTrackerDTO', 'trackingOvulation'),
            age: BuiltValueNullFieldError.checkNotNull(
                age, r'RegisterPeriodTrackerDTO', 'age'),
            birthControlMethods: BuiltValueNullFieldError.checkNotNull(birthControlMethods, r'RegisterPeriodTrackerDTO', 'birthControlMethods'),
            healthConditions: BuiltValueNullFieldError.checkNotNull(healthConditions, r'RegisterPeriodTrackerDTO', 'healthConditions'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
