// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'log_period_symptom_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogPeriodSymptomDto extends LogPeriodSymptomDto {
  @override
  final String date;
  @override
  final BuiltList<PeriodSymptomDto> symptoms;

  factory _$LogPeriodSymptomDto(
          [void Function(LogPeriodSymptomDtoBuilder)? updates]) =>
      (new LogPeriodSymptomDtoBuilder()..update(updates))._build();

  _$LogPeriodSymptomDto._({required this.date, required this.symptoms})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(date, r'LogPeriodSymptomDto', 'date');
    BuiltValueNullFieldError.checkNotNull(
        symptoms, r'LogPeriodSymptomDto', 'symptoms');
  }

  @override
  LogPeriodSymptomDto rebuild(
          void Function(LogPeriodSymptomDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogPeriodSymptomDtoBuilder toBuilder() =>
      new LogPeriodSymptomDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogPeriodSymptomDto &&
        date == other.date &&
        symptoms == other.symptoms;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, symptoms.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogPeriodSymptomDto')
          ..add('date', date)
          ..add('symptoms', symptoms))
        .toString();
  }
}

class LogPeriodSymptomDtoBuilder
    implements Builder<LogPeriodSymptomDto, LogPeriodSymptomDtoBuilder> {
  _$LogPeriodSymptomDto? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  ListBuilder<PeriodSymptomDto>? _symptoms;
  ListBuilder<PeriodSymptomDto> get symptoms =>
      _$this._symptoms ??= new ListBuilder<PeriodSymptomDto>();
  set symptoms(ListBuilder<PeriodSymptomDto>? symptoms) =>
      _$this._symptoms = symptoms;

  LogPeriodSymptomDtoBuilder() {
    LogPeriodSymptomDto._defaults(this);
  }

  LogPeriodSymptomDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _symptoms = $v.symptoms.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogPeriodSymptomDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogPeriodSymptomDto;
  }

  @override
  void update(void Function(LogPeriodSymptomDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogPeriodSymptomDto build() => _build();

  _$LogPeriodSymptomDto _build() {
    _$LogPeriodSymptomDto _$result;
    try {
      _$result = _$v ??
          new _$LogPeriodSymptomDto._(
              date: BuiltValueNullFieldError.checkNotNull(
                  date, r'LogPeriodSymptomDto', 'date'),
              symptoms: symptoms.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'symptoms';
        symptoms.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LogPeriodSymptomDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
