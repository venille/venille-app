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
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_symptom_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodSymptomDto extends PeriodSymptomDto {
  @override
  final String symptomType;
  @override
  final String symptoms;

  factory _$PeriodSymptomDto(
          [void Function(PeriodSymptomDtoBuilder)? updates]) =>
      (new PeriodSymptomDtoBuilder()..update(updates))._build();

  _$PeriodSymptomDto._({required this.symptomType, required this.symptoms})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        symptomType, r'PeriodSymptomDto', 'symptomType');
    BuiltValueNullFieldError.checkNotNull(
        symptoms, r'PeriodSymptomDto', 'symptoms');
  }

  @override
  PeriodSymptomDto rebuild(void Function(PeriodSymptomDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodSymptomDtoBuilder toBuilder() =>
      new PeriodSymptomDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodSymptomDto &&
        symptomType == other.symptomType &&
        symptoms == other.symptoms;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, symptomType.hashCode);
    _$hash = $jc(_$hash, symptoms.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodSymptomDto')
          ..add('symptomType', symptomType)
          ..add('symptoms', symptoms))
        .toString();
  }
}

class PeriodSymptomDtoBuilder
    implements Builder<PeriodSymptomDto, PeriodSymptomDtoBuilder> {
  _$PeriodSymptomDto? _$v;

  String? _symptomType;
  String? get symptomType => _$this._symptomType;
  set symptomType(String? symptomType) => _$this._symptomType = symptomType;

  String? _symptoms;
  String? get symptoms => _$this._symptoms;
  set symptoms(String? symptoms) => _$this._symptoms = symptoms;

  PeriodSymptomDtoBuilder() {
    PeriodSymptomDto._defaults(this);
  }

  PeriodSymptomDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _symptomType = $v.symptomType;
      _symptoms = $v.symptoms;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodSymptomDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodSymptomDto;
  }

  @override
  void update(void Function(PeriodSymptomDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodSymptomDto build() => _build();

  _$PeriodSymptomDto _build() {
    final _$result = _$v ??
        new _$PeriodSymptomDto._(
            symptomType: BuiltValueNullFieldError.checkNotNull(
                symptomType, r'PeriodSymptomDto', 'symptomType'),
            symptoms: BuiltValueNullFieldError.checkNotNull(
                symptoms, r'PeriodSymptomDto', 'symptoms'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
