// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'signup_verification_response_payload.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignupVerificationResponsePayload
    extends SignupVerificationResponsePayload {
  @override
  final String token;

  factory _$SignupVerificationResponsePayload(
          [void Function(SignupVerificationResponsePayloadBuilder)? updates]) =>
      (new SignupVerificationResponsePayloadBuilder()..update(updates))
          ._build();

  _$SignupVerificationResponsePayload._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'SignupVerificationResponsePayload', 'token');
  }

  @override
  SignupVerificationResponsePayload rebuild(
          void Function(SignupVerificationResponsePayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignupVerificationResponsePayloadBuilder toBuilder() =>
      new SignupVerificationResponsePayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignupVerificationResponsePayload && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignupVerificationResponsePayload')
          ..add('token', token))
        .toString();
  }
}

class SignupVerificationResponsePayloadBuilder
    implements
        Builder<SignupVerificationResponsePayload,
            SignupVerificationResponsePayloadBuilder> {
  _$SignupVerificationResponsePayload? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  SignupVerificationResponsePayloadBuilder() {
    SignupVerificationResponsePayload._defaults(this);
  }

  SignupVerificationResponsePayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignupVerificationResponsePayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignupVerificationResponsePayload;
  }

  @override
  void update(
      void Function(SignupVerificationResponsePayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignupVerificationResponsePayload build() => _build();

  _$SignupVerificationResponsePayload _build() {
    final _$result = _$v ??
        new _$SignupVerificationResponsePayload._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'SignupVerificationResponsePayload', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
