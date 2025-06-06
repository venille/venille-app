// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'available_state_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AvailableStateInfo extends AvailableStateInfo {
  @override
  final String state;
  @override
  final String stateId;
  @override
  final BuiltList<String> lgas;

  factory _$AvailableStateInfo(
          [void Function(AvailableStateInfoBuilder)? updates]) =>
      (new AvailableStateInfoBuilder()..update(updates))._build();

  _$AvailableStateInfo._(
      {required this.state, required this.stateId, required this.lgas})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        state, r'AvailableStateInfo', 'state');
    BuiltValueNullFieldError.checkNotNull(
        stateId, r'AvailableStateInfo', 'stateId');
    BuiltValueNullFieldError.checkNotNull(lgas, r'AvailableStateInfo', 'lgas');
  }

  @override
  AvailableStateInfo rebuild(
          void Function(AvailableStateInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvailableStateInfoBuilder toBuilder() =>
      new AvailableStateInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AvailableStateInfo &&
        state == other.state &&
        stateId == other.stateId &&
        lgas == other.lgas;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, stateId.hashCode);
    _$hash = $jc(_$hash, lgas.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AvailableStateInfo')
          ..add('state', state)
          ..add('stateId', stateId)
          ..add('lgas', lgas))
        .toString();
  }
}

class AvailableStateInfoBuilder
    implements Builder<AvailableStateInfo, AvailableStateInfoBuilder> {
  _$AvailableStateInfo? _$v;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _stateId;
  String? get stateId => _$this._stateId;
  set stateId(String? stateId) => _$this._stateId = stateId;

  ListBuilder<String>? _lgas;
  ListBuilder<String> get lgas => _$this._lgas ??= new ListBuilder<String>();
  set lgas(ListBuilder<String>? lgas) => _$this._lgas = lgas;

  AvailableStateInfoBuilder() {
    AvailableStateInfo._defaults(this);
  }

  AvailableStateInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _stateId = $v.stateId;
      _lgas = $v.lgas.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AvailableStateInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AvailableStateInfo;
  }

  @override
  void update(void Function(AvailableStateInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AvailableStateInfo build() => _build();

  _$AvailableStateInfo _build() {
    _$AvailableStateInfo _$result;
    try {
      _$result = _$v ??
          new _$AvailableStateInfo._(
              state: BuiltValueNullFieldError.checkNotNull(
                  state, r'AvailableStateInfo', 'state'),
              stateId: BuiltValueNullFieldError.checkNotNull(
                  stateId, r'AvailableStateInfo', 'stateId'),
              lgas: lgas.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'lgas';
        lgas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AvailableStateInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
