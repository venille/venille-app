// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'translate_text_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TranslateTextInfo extends TranslateTextInfo {
  @override
  final bool isTranslated;
  @override
  final String translatedText;

  factory _$TranslateTextInfo(
          [void Function(TranslateTextInfoBuilder)? updates]) =>
      (new TranslateTextInfoBuilder()..update(updates))._build();

  _$TranslateTextInfo._(
      {required this.isTranslated, required this.translatedText})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isTranslated, r'TranslateTextInfo', 'isTranslated');
    BuiltValueNullFieldError.checkNotNull(
        translatedText, r'TranslateTextInfo', 'translatedText');
  }

  @override
  TranslateTextInfo rebuild(void Function(TranslateTextInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslateTextInfoBuilder toBuilder() =>
      new TranslateTextInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslateTextInfo &&
        isTranslated == other.isTranslated &&
        translatedText == other.translatedText;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isTranslated.hashCode);
    _$hash = $jc(_$hash, translatedText.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TranslateTextInfo')
          ..add('isTranslated', isTranslated)
          ..add('translatedText', translatedText))
        .toString();
  }
}

class TranslateTextInfoBuilder
    implements Builder<TranslateTextInfo, TranslateTextInfoBuilder> {
  _$TranslateTextInfo? _$v;

  bool? _isTranslated;
  bool? get isTranslated => _$this._isTranslated;
  set isTranslated(bool? isTranslated) => _$this._isTranslated = isTranslated;

  String? _translatedText;
  String? get translatedText => _$this._translatedText;
  set translatedText(String? translatedText) =>
      _$this._translatedText = translatedText;

  TranslateTextInfoBuilder() {
    TranslateTextInfo._defaults(this);
  }

  TranslateTextInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isTranslated = $v.isTranslated;
      _translatedText = $v.translatedText;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TranslateTextInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslateTextInfo;
  }

  @override
  void update(void Function(TranslateTextInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslateTextInfo build() => _build();

  _$TranslateTextInfo _build() {
    final _$result = _$v ??
        new _$TranslateTextInfo._(
            isTranslated: BuiltValueNullFieldError.checkNotNull(
                isTranslated, r'TranslateTextInfo', 'isTranslated'),
            translatedText: BuiltValueNullFieldError.checkNotNull(
                translatedText, r'TranslateTextInfo', 'translatedText'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
