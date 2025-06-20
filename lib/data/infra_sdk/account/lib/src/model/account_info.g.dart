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

part of 'account_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AccountInfoAccountTypeEnum _$accountInfoAccountTypeEnum_individual =
    const AccountInfoAccountTypeEnum._('individual');
const AccountInfoAccountTypeEnum _$accountInfoAccountTypeEnum_admin =
    const AccountInfoAccountTypeEnum._('admin');
const AccountInfoAccountTypeEnum _$accountInfoAccountTypeEnum_superAdmin =
    const AccountInfoAccountTypeEnum._('superAdmin');
const AccountInfoAccountTypeEnum _$accountInfoAccountTypeEnum_system =
    const AccountInfoAccountTypeEnum._('system');

AccountInfoAccountTypeEnum _$accountInfoAccountTypeEnumValueOf(String name) {
  switch (name) {
    case 'individual':
      return _$accountInfoAccountTypeEnum_individual;
    case 'admin':
      return _$accountInfoAccountTypeEnum_admin;
    case 'superAdmin':
      return _$accountInfoAccountTypeEnum_superAdmin;
    case 'system':
      return _$accountInfoAccountTypeEnum_system;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AccountInfoAccountTypeEnum> _$accountInfoAccountTypeEnumValues =
    new BuiltSet<AccountInfoAccountTypeEnum>(const <AccountInfoAccountTypeEnum>[
  _$accountInfoAccountTypeEnum_individual,
  _$accountInfoAccountTypeEnum_admin,
  _$accountInfoAccountTypeEnum_superAdmin,
  _$accountInfoAccountTypeEnum_system,
]);

const AccountInfoStatusEnum _$accountInfoStatusEnum_pending =
    const AccountInfoStatusEnum._('pending');
const AccountInfoStatusEnum _$accountInfoStatusEnum_active =
    const AccountInfoStatusEnum._('active');
const AccountInfoStatusEnum _$accountInfoStatusEnum_inactive =
    const AccountInfoStatusEnum._('inactive');
const AccountInfoStatusEnum _$accountInfoStatusEnum_shadowBanned =
    const AccountInfoStatusEnum._('shadowBanned');
const AccountInfoStatusEnum _$accountInfoStatusEnum_disabled =
    const AccountInfoStatusEnum._('disabled');

AccountInfoStatusEnum _$accountInfoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$accountInfoStatusEnum_pending;
    case 'active':
      return _$accountInfoStatusEnum_active;
    case 'inactive':
      return _$accountInfoStatusEnum_inactive;
    case 'shadowBanned':
      return _$accountInfoStatusEnum_shadowBanned;
    case 'disabled':
      return _$accountInfoStatusEnum_disabled;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AccountInfoStatusEnum> _$accountInfoStatusEnumValues =
    new BuiltSet<AccountInfoStatusEnum>(const <AccountInfoStatusEnum>[
  _$accountInfoStatusEnum_pending,
  _$accountInfoStatusEnum_active,
  _$accountInfoStatusEnum_inactive,
  _$accountInfoStatusEnum_shadowBanned,
  _$accountInfoStatusEnum_disabled,
]);

Serializer<AccountInfoAccountTypeEnum> _$accountInfoAccountTypeEnumSerializer =
    new _$AccountInfoAccountTypeEnumSerializer();
Serializer<AccountInfoStatusEnum> _$accountInfoStatusEnumSerializer =
    new _$AccountInfoStatusEnumSerializer();

class _$AccountInfoAccountTypeEnumSerializer
    implements PrimitiveSerializer<AccountInfoAccountTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'individual': 'individual',
    'admin': 'admin',
    'superAdmin': 'super_admin',
    'system': 'system',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'individual': 'individual',
    'admin': 'admin',
    'super_admin': 'superAdmin',
    'system': 'system',
  };

  @override
  final Iterable<Type> types = const <Type>[AccountInfoAccountTypeEnum];
  @override
  final String wireName = 'AccountInfoAccountTypeEnum';

  @override
  Object serialize(Serializers serializers, AccountInfoAccountTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AccountInfoAccountTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AccountInfoAccountTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AccountInfoStatusEnumSerializer
    implements PrimitiveSerializer<AccountInfoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'active': 'active',
    'inactive': 'inactive',
    'shadowBanned': 'shadow_banned',
    'disabled': 'disabled',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'active': 'active',
    'inactive': 'inactive',
    'shadow_banned': 'shadowBanned',
    'disabled': 'disabled',
  };

  @override
  final Iterable<Type> types = const <Type>[AccountInfoStatusEnum];
  @override
  final String wireName = 'AccountInfoStatusEnum';

  @override
  Object serialize(Serializers serializers, AccountInfoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AccountInfoStatusEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AccountInfoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AccountInfo extends AccountInfo {
  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String state;
  @override
  final String stateArea;
  @override
  final String profilePhoto;
  @override
  final AccountInfoAccountTypeEnum accountType;
  @override
  final AccountInfoStatusEnum status;
  @override
  final String fcmToken;
  @override
  final String referralCode;
  @override
  final bool isOnboardingUploaded;

  factory _$AccountInfo([void Function(AccountInfoBuilder)? updates]) =>
      (new AccountInfoBuilder()..update(updates))._build();

  _$AccountInfo._(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.state,
      required this.stateArea,
      required this.profilePhoto,
      required this.accountType,
      required this.status,
      required this.fcmToken,
      required this.referralCode,
      required this.isOnboardingUploaded})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AccountInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'AccountInfo', 'firstName');
    BuiltValueNullFieldError.checkNotNull(lastName, r'AccountInfo', 'lastName');
    BuiltValueNullFieldError.checkNotNull(phone, r'AccountInfo', 'phone');
    BuiltValueNullFieldError.checkNotNull(email, r'AccountInfo', 'email');
    BuiltValueNullFieldError.checkNotNull(state, r'AccountInfo', 'state');
    BuiltValueNullFieldError.checkNotNull(
        stateArea, r'AccountInfo', 'stateArea');
    BuiltValueNullFieldError.checkNotNull(
        profilePhoto, r'AccountInfo', 'profilePhoto');
    BuiltValueNullFieldError.checkNotNull(
        accountType, r'AccountInfo', 'accountType');
    BuiltValueNullFieldError.checkNotNull(status, r'AccountInfo', 'status');
    BuiltValueNullFieldError.checkNotNull(fcmToken, r'AccountInfo', 'fcmToken');
    BuiltValueNullFieldError.checkNotNull(
        referralCode, r'AccountInfo', 'referralCode');
    BuiltValueNullFieldError.checkNotNull(
        isOnboardingUploaded, r'AccountInfo', 'isOnboardingUploaded');
  }

  @override
  AccountInfo rebuild(void Function(AccountInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountInfoBuilder toBuilder() => new AccountInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountInfo &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phone == other.phone &&
        email == other.email &&
        state == other.state &&
        stateArea == other.stateArea &&
        profilePhoto == other.profilePhoto &&
        accountType == other.accountType &&
        status == other.status &&
        fcmToken == other.fcmToken &&
        referralCode == other.referralCode &&
        isOnboardingUploaded == other.isOnboardingUploaded;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, stateArea.hashCode);
    _$hash = $jc(_$hash, profilePhoto.hashCode);
    _$hash = $jc(_$hash, accountType.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, referralCode.hashCode);
    _$hash = $jc(_$hash, isOnboardingUploaded.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountInfo')
          ..add('id', id)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('phone', phone)
          ..add('email', email)
          ..add('state', state)
          ..add('stateArea', stateArea)
          ..add('profilePhoto', profilePhoto)
          ..add('accountType', accountType)
          ..add('status', status)
          ..add('fcmToken', fcmToken)
          ..add('referralCode', referralCode)
          ..add('isOnboardingUploaded', isOnboardingUploaded))
        .toString();
  }
}

class AccountInfoBuilder implements Builder<AccountInfo, AccountInfoBuilder> {
  _$AccountInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _stateArea;
  String? get stateArea => _$this._stateArea;
  set stateArea(String? stateArea) => _$this._stateArea = stateArea;

  String? _profilePhoto;
  String? get profilePhoto => _$this._profilePhoto;
  set profilePhoto(String? profilePhoto) => _$this._profilePhoto = profilePhoto;

  AccountInfoAccountTypeEnum? _accountType;
  AccountInfoAccountTypeEnum? get accountType => _$this._accountType;
  set accountType(AccountInfoAccountTypeEnum? accountType) =>
      _$this._accountType = accountType;

  AccountInfoStatusEnum? _status;
  AccountInfoStatusEnum? get status => _$this._status;
  set status(AccountInfoStatusEnum? status) => _$this._status = status;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  String? _referralCode;
  String? get referralCode => _$this._referralCode;
  set referralCode(String? referralCode) => _$this._referralCode = referralCode;

  bool? _isOnboardingUploaded;
  bool? get isOnboardingUploaded => _$this._isOnboardingUploaded;
  set isOnboardingUploaded(bool? isOnboardingUploaded) =>
      _$this._isOnboardingUploaded = isOnboardingUploaded;

  AccountInfoBuilder() {
    AccountInfo._defaults(this);
  }

  AccountInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _phone = $v.phone;
      _email = $v.email;
      _state = $v.state;
      _stateArea = $v.stateArea;
      _profilePhoto = $v.profilePhoto;
      _accountType = $v.accountType;
      _status = $v.status;
      _fcmToken = $v.fcmToken;
      _referralCode = $v.referralCode;
      _isOnboardingUploaded = $v.isOnboardingUploaded;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountInfo;
  }

  @override
  void update(void Function(AccountInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountInfo build() => _build();

  _$AccountInfo _build() {
    final _$result = _$v ??
        new _$AccountInfo._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'AccountInfo', 'id'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'AccountInfo', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'AccountInfo', 'lastName'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'AccountInfo', 'phone'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'AccountInfo', 'email'),
            state: BuiltValueNullFieldError.checkNotNull(
                state, r'AccountInfo', 'state'),
            stateArea: BuiltValueNullFieldError.checkNotNull(
                stateArea, r'AccountInfo', 'stateArea'),
            profilePhoto: BuiltValueNullFieldError.checkNotNull(
                profilePhoto, r'AccountInfo', 'profilePhoto'),
            accountType: BuiltValueNullFieldError.checkNotNull(
                accountType, r'AccountInfo', 'accountType'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AccountInfo', 'status'),
            fcmToken: BuiltValueNullFieldError.checkNotNull(
                fcmToken, r'AccountInfo', 'fcmToken'),
            referralCode:
                BuiltValueNullFieldError.checkNotNull(referralCode, r'AccountInfo', 'referralCode'),
            isOnboardingUploaded: BuiltValueNullFieldError.checkNotNull(isOnboardingUploaded, r'AccountInfo', 'isOnboardingUploaded'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
