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

part of 'period_month_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodMonthDto extends PeriodMonthDto {
  @override
  final String startDate;
  @override
  final String endDate;

  factory _$PeriodMonthDto([void Function(PeriodMonthDtoBuilder)? updates]) =>
      (new PeriodMonthDtoBuilder()..update(updates))._build();

  _$PeriodMonthDto._({required this.startDate, required this.endDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        startDate, r'PeriodMonthDto', 'startDate');
    BuiltValueNullFieldError.checkNotNull(
        endDate, r'PeriodMonthDto', 'endDate');
  }

  @override
  PeriodMonthDto rebuild(void Function(PeriodMonthDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodMonthDtoBuilder toBuilder() =>
      new PeriodMonthDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodMonthDto &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodMonthDto')
          ..add('startDate', startDate)
          ..add('endDate', endDate))
        .toString();
  }
}

class PeriodMonthDtoBuilder
    implements Builder<PeriodMonthDto, PeriodMonthDtoBuilder> {
  _$PeriodMonthDto? _$v;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  PeriodMonthDtoBuilder() {
    PeriodMonthDto._defaults(this);
  }

  PeriodMonthDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodMonthDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodMonthDto;
  }

  @override
  void update(void Function(PeriodMonthDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodMonthDto build() => _build();

  _$PeriodMonthDto _build() {
    final _$result = _$v ??
        new _$PeriodMonthDto._(
            startDate: BuiltValueNullFieldError.checkNotNull(
                startDate, r'PeriodMonthDto', 'startDate'),
            endDate: BuiltValueNullFieldError.checkNotNull(
                endDate, r'PeriodMonthDto', 'endDate'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
