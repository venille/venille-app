// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'translate_long_text_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TranslateLongTextDto extends TranslateLongTextDto {
  @override
  final String text;

  factory _$TranslateLongTextDto(
          [void Function(TranslateLongTextDtoBuilder)? updates]) =>
      (new TranslateLongTextDtoBuilder()..update(updates))._build();

  _$TranslateLongTextDto._({required this.text}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        text, r'TranslateLongTextDto', 'text');
  }

  @override
  TranslateLongTextDto rebuild(
          void Function(TranslateLongTextDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslateLongTextDtoBuilder toBuilder() =>
      new TranslateLongTextDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslateLongTextDto && text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TranslateLongTextDto')
          ..add('text', text))
        .toString();
  }
}

class TranslateLongTextDtoBuilder
    implements Builder<TranslateLongTextDto, TranslateLongTextDtoBuilder> {
  _$TranslateLongTextDto? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  TranslateLongTextDtoBuilder() {
    TranslateLongTextDto._defaults(this);
  }

  TranslateLongTextDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TranslateLongTextDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslateLongTextDto;
  }

  @override
  void update(void Function(TranslateLongTextDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslateLongTextDto build() => _build();

  _$TranslateLongTextDto _build() {
    final _$result = _$v ??
        new _$TranslateLongTextDto._(
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'TranslateLongTextDto', 'text'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
