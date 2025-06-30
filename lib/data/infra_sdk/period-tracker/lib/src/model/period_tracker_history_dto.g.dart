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

part of 'period_tracker_history_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerHistoryDto extends PeriodTrackerHistoryDto {
  @override
  final BuiltList<PeriodYearDto> years;

  factory _$PeriodTrackerHistoryDto(
          [void Function(PeriodTrackerHistoryDtoBuilder)? updates]) =>
      (new PeriodTrackerHistoryDtoBuilder()..update(updates))._build();

  _$PeriodTrackerHistoryDto._({required this.years}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        years, r'PeriodTrackerHistoryDto', 'years');
  }

  @override
  PeriodTrackerHistoryDto rebuild(
          void Function(PeriodTrackerHistoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerHistoryDtoBuilder toBuilder() =>
      new PeriodTrackerHistoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerHistoryDto && years == other.years;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, years.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerHistoryDto')
          ..add('years', years))
        .toString();
  }
}

class PeriodTrackerHistoryDtoBuilder
    implements
        Builder<PeriodTrackerHistoryDto, PeriodTrackerHistoryDtoBuilder> {
  _$PeriodTrackerHistoryDto? _$v;

  ListBuilder<PeriodYearDto>? _years;
  ListBuilder<PeriodYearDto> get years =>
      _$this._years ??= new ListBuilder<PeriodYearDto>();
  set years(ListBuilder<PeriodYearDto>? years) => _$this._years = years;

  PeriodTrackerHistoryDtoBuilder() {
    PeriodTrackerHistoryDto._defaults(this);
  }

  PeriodTrackerHistoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _years = $v.years.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerHistoryDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerHistoryDto;
  }

  @override
  void update(void Function(PeriodTrackerHistoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerHistoryDto build() => _build();

  _$PeriodTrackerHistoryDto _build() {
    _$PeriodTrackerHistoryDto _$result;
    try {
      _$result = _$v ?? new _$PeriodTrackerHistoryDto._(years: years.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'years';
        years.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeriodTrackerHistoryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
