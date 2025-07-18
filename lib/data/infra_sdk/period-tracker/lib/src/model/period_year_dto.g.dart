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
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_year_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodYearDto extends PeriodYearDto {
  @override
  final num year;
  @override
  final BuiltList<PeriodMonthDto> months;

  factory _$PeriodYearDto([void Function(PeriodYearDtoBuilder)? updates]) =>
      (new PeriodYearDtoBuilder()..update(updates))._build();

  _$PeriodYearDto._({required this.year, required this.months}) : super._() {
    BuiltValueNullFieldError.checkNotNull(year, r'PeriodYearDto', 'year');
    BuiltValueNullFieldError.checkNotNull(months, r'PeriodYearDto', 'months');
  }

  @override
  PeriodYearDto rebuild(void Function(PeriodYearDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodYearDtoBuilder toBuilder() => new PeriodYearDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodYearDto &&
        year == other.year &&
        months == other.months;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, months.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodYearDto')
          ..add('year', year)
          ..add('months', months))
        .toString();
  }
}

class PeriodYearDtoBuilder
    implements Builder<PeriodYearDto, PeriodYearDtoBuilder> {
  _$PeriodYearDto? _$v;

  num? _year;
  num? get year => _$this._year;
  set year(num? year) => _$this._year = year;

  ListBuilder<PeriodMonthDto>? _months;
  ListBuilder<PeriodMonthDto> get months =>
      _$this._months ??= new ListBuilder<PeriodMonthDto>();
  set months(ListBuilder<PeriodMonthDto>? months) => _$this._months = months;

  PeriodYearDtoBuilder() {
    PeriodYearDto._defaults(this);
  }

  PeriodYearDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _year = $v.year;
      _months = $v.months.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodYearDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodYearDto;
  }

  @override
  void update(void Function(PeriodYearDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodYearDto build() => _build();

  _$PeriodYearDto _build() {
    _$PeriodYearDto _$result;
    try {
      _$result = _$v ??
          new _$PeriodYearDto._(
              year: BuiltValueNullFieldError.checkNotNull(
                  year, r'PeriodYearDto', 'year'),
              months: months.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'months';
        months.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeriodYearDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
