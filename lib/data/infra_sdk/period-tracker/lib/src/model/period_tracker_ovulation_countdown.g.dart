// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'period_tracker_ovulation_countdown.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PeriodTrackerOvulationCountdown
    extends PeriodTrackerOvulationCountdown {
  @override
  final num ovulationInDays;
  @override
  final bool isToday;

  factory _$PeriodTrackerOvulationCountdown(
          [void Function(PeriodTrackerOvulationCountdownBuilder)? updates]) =>
      (new PeriodTrackerOvulationCountdownBuilder()..update(updates))._build();

  _$PeriodTrackerOvulationCountdown._(
      {required this.ovulationInDays, required this.isToday})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ovulationInDays, r'PeriodTrackerOvulationCountdown', 'ovulationInDays');
    BuiltValueNullFieldError.checkNotNull(
        isToday, r'PeriodTrackerOvulationCountdown', 'isToday');
  }

  @override
  PeriodTrackerOvulationCountdown rebuild(
          void Function(PeriodTrackerOvulationCountdownBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodTrackerOvulationCountdownBuilder toBuilder() =>
      new PeriodTrackerOvulationCountdownBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodTrackerOvulationCountdown &&
        ovulationInDays == other.ovulationInDays &&
        isToday == other.isToday;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ovulationInDays.hashCode);
    _$hash = $jc(_$hash, isToday.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodTrackerOvulationCountdown')
          ..add('ovulationInDays', ovulationInDays)
          ..add('isToday', isToday))
        .toString();
  }
}

class PeriodTrackerOvulationCountdownBuilder
    implements
        Builder<PeriodTrackerOvulationCountdown,
            PeriodTrackerOvulationCountdownBuilder> {
  _$PeriodTrackerOvulationCountdown? _$v;

  num? _ovulationInDays;
  num? get ovulationInDays => _$this._ovulationInDays;
  set ovulationInDays(num? ovulationInDays) =>
      _$this._ovulationInDays = ovulationInDays;

  bool? _isToday;
  bool? get isToday => _$this._isToday;
  set isToday(bool? isToday) => _$this._isToday = isToday;

  PeriodTrackerOvulationCountdownBuilder() {
    PeriodTrackerOvulationCountdown._defaults(this);
  }

  PeriodTrackerOvulationCountdownBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ovulationInDays = $v.ovulationInDays;
      _isToday = $v.isToday;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodTrackerOvulationCountdown other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodTrackerOvulationCountdown;
  }

  @override
  void update(void Function(PeriodTrackerOvulationCountdownBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodTrackerOvulationCountdown build() => _build();

  _$PeriodTrackerOvulationCountdown _build() {
    final _$result = _$v ??
        new _$PeriodTrackerOvulationCountdown._(
            ovulationInDays: BuiltValueNullFieldError.checkNotNull(
                ovulationInDays,
                r'PeriodTrackerOvulationCountdown',
                'ovulationInDays'),
            isToday: BuiltValueNullFieldError.checkNotNull(
                isToday, r'PeriodTrackerOvulationCountdown', 'isToday'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
