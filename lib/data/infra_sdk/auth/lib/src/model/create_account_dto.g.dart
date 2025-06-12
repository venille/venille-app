// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'create_account_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAccountDTO extends CreateAccountDTO {
  @override
  final String email;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String referralCode;

  factory _$CreateAccountDTO(
          [void Function(CreateAccountDTOBuilder)? updates]) =>
      (new CreateAccountDTOBuilder()..update(updates))._build();

  _$CreateAccountDTO._(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.referralCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'CreateAccountDTO', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'CreateAccountDTO', 'password');
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'CreateAccountDTO', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'CreateAccountDTO', 'lastName');
    BuiltValueNullFieldError.checkNotNull(phone, r'CreateAccountDTO', 'phone');
    BuiltValueNullFieldError.checkNotNull(
        referralCode, r'CreateAccountDTO', 'referralCode');
  }

  @override
  CreateAccountDTO rebuild(void Function(CreateAccountDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAccountDTOBuilder toBuilder() =>
      new CreateAccountDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAccountDTO &&
        email == other.email &&
        password == other.password &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phone == other.phone &&
        referralCode == other.referralCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, referralCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAccountDTO')
          ..add('email', email)
          ..add('password', password)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('phone', phone)
          ..add('referralCode', referralCode))
        .toString();
  }
}

class CreateAccountDTOBuilder
    implements Builder<CreateAccountDTO, CreateAccountDTOBuilder> {
  _$CreateAccountDTO? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _referralCode;
  String? get referralCode => _$this._referralCode;
  set referralCode(String? referralCode) => _$this._referralCode = referralCode;

  CreateAccountDTOBuilder() {
    CreateAccountDTO._defaults(this);
  }

  CreateAccountDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _phone = $v.phone;
      _referralCode = $v.referralCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAccountDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAccountDTO;
  }

  @override
  void update(void Function(CreateAccountDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAccountDTO build() => _build();

  _$CreateAccountDTO _build() {
    final _$result = _$v ??
        new _$CreateAccountDTO._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'CreateAccountDTO', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'CreateAccountDTO', 'password'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'CreateAccountDTO', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'CreateAccountDTO', 'lastName'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'CreateAccountDTO', 'phone'),
            referralCode: BuiltValueNullFieldError.checkNotNull(
                referralCode, r'CreateAccountDTO', 'referralCode'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
