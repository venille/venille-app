// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'report_ai_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportAIResponseDTO extends ReportAIResponseDTO {
  @override
  final String prompt;
  @override
  final String responseType;

  factory _$ReportAIResponseDTO(
          [void Function(ReportAIResponseDTOBuilder)? updates]) =>
      (new ReportAIResponseDTOBuilder()..update(updates))._build();

  _$ReportAIResponseDTO._({required this.prompt, required this.responseType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        prompt, r'ReportAIResponseDTO', 'prompt');
    BuiltValueNullFieldError.checkNotNull(
        responseType, r'ReportAIResponseDTO', 'responseType');
  }

  @override
  ReportAIResponseDTO rebuild(
          void Function(ReportAIResponseDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportAIResponseDTOBuilder toBuilder() =>
      new ReportAIResponseDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportAIResponseDTO &&
        prompt == other.prompt &&
        responseType == other.responseType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, responseType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportAIResponseDTO')
          ..add('prompt', prompt)
          ..add('responseType', responseType))
        .toString();
  }
}

class ReportAIResponseDTOBuilder
    implements Builder<ReportAIResponseDTO, ReportAIResponseDTOBuilder> {
  _$ReportAIResponseDTO? _$v;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  String? _responseType;
  String? get responseType => _$this._responseType;
  set responseType(String? responseType) => _$this._responseType = responseType;

  ReportAIResponseDTOBuilder() {
    ReportAIResponseDTO._defaults(this);
  }

  ReportAIResponseDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prompt = $v.prompt;
      _responseType = $v.responseType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportAIResponseDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportAIResponseDTO;
  }

  @override
  void update(void Function(ReportAIResponseDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportAIResponseDTO build() => _build();

  _$ReportAIResponseDTO _build() {
    final _$result = _$v ??
        new _$ReportAIResponseDTO._(
            prompt: BuiltValueNullFieldError.checkNotNull(
                prompt, r'ReportAIResponseDTO', 'prompt'),
            responseType: BuiltValueNullFieldError.checkNotNull(
                responseType, r'ReportAIResponseDTO', 'responseType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
