// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'onboarding_question_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OnboardingQuestionInfo extends OnboardingQuestionInfo {
  @override
  final String id;
  @override
  final String question;
  @override
  final String questionType;
  @override
  final String optionType;
  @override
  final String enumType;
  @override
  final BuiltList<String> options;
  @override
  final bool isUserInput;
  @override
  final num position;

  factory _$OnboardingQuestionInfo(
          [void Function(OnboardingQuestionInfoBuilder)? updates]) =>
      (new OnboardingQuestionInfoBuilder()..update(updates))._build();

  _$OnboardingQuestionInfo._(
      {required this.id,
      required this.question,
      required this.questionType,
      required this.optionType,
      required this.enumType,
      required this.options,
      required this.isUserInput,
      required this.position})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'OnboardingQuestionInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(
        question, r'OnboardingQuestionInfo', 'question');
    BuiltValueNullFieldError.checkNotNull(
        questionType, r'OnboardingQuestionInfo', 'questionType');
    BuiltValueNullFieldError.checkNotNull(
        optionType, r'OnboardingQuestionInfo', 'optionType');
    BuiltValueNullFieldError.checkNotNull(
        enumType, r'OnboardingQuestionInfo', 'enumType');
    BuiltValueNullFieldError.checkNotNull(
        options, r'OnboardingQuestionInfo', 'options');
    BuiltValueNullFieldError.checkNotNull(
        isUserInput, r'OnboardingQuestionInfo', 'isUserInput');
    BuiltValueNullFieldError.checkNotNull(
        position, r'OnboardingQuestionInfo', 'position');
  }

  @override
  OnboardingQuestionInfo rebuild(
          void Function(OnboardingQuestionInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OnboardingQuestionInfoBuilder toBuilder() =>
      new OnboardingQuestionInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OnboardingQuestionInfo &&
        id == other.id &&
        question == other.question &&
        questionType == other.questionType &&
        optionType == other.optionType &&
        enumType == other.enumType &&
        options == other.options &&
        isUserInput == other.isUserInput &&
        position == other.position;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, questionType.hashCode);
    _$hash = $jc(_$hash, optionType.hashCode);
    _$hash = $jc(_$hash, enumType.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, isUserInput.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OnboardingQuestionInfo')
          ..add('id', id)
          ..add('question', question)
          ..add('questionType', questionType)
          ..add('optionType', optionType)
          ..add('enumType', enumType)
          ..add('options', options)
          ..add('isUserInput', isUserInput)
          ..add('position', position))
        .toString();
  }
}

class OnboardingQuestionInfoBuilder
    implements Builder<OnboardingQuestionInfo, OnboardingQuestionInfoBuilder> {
  _$OnboardingQuestionInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  String? _questionType;
  String? get questionType => _$this._questionType;
  set questionType(String? questionType) => _$this._questionType = questionType;

  String? _optionType;
  String? get optionType => _$this._optionType;
  set optionType(String? optionType) => _$this._optionType = optionType;

  String? _enumType;
  String? get enumType => _$this._enumType;
  set enumType(String? enumType) => _$this._enumType = enumType;

  ListBuilder<String>? _options;
  ListBuilder<String> get options =>
      _$this._options ??= new ListBuilder<String>();
  set options(ListBuilder<String>? options) => _$this._options = options;

  bool? _isUserInput;
  bool? get isUserInput => _$this._isUserInput;
  set isUserInput(bool? isUserInput) => _$this._isUserInput = isUserInput;

  num? _position;
  num? get position => _$this._position;
  set position(num? position) => _$this._position = position;

  OnboardingQuestionInfoBuilder() {
    OnboardingQuestionInfo._defaults(this);
  }

  OnboardingQuestionInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _question = $v.question;
      _questionType = $v.questionType;
      _optionType = $v.optionType;
      _enumType = $v.enumType;
      _options = $v.options.toBuilder();
      _isUserInput = $v.isUserInput;
      _position = $v.position;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OnboardingQuestionInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OnboardingQuestionInfo;
  }

  @override
  void update(void Function(OnboardingQuestionInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OnboardingQuestionInfo build() => _build();

  _$OnboardingQuestionInfo _build() {
    _$OnboardingQuestionInfo _$result;
    try {
      _$result = _$v ??
          new _$OnboardingQuestionInfo._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'OnboardingQuestionInfo', 'id'),
              question: BuiltValueNullFieldError.checkNotNull(
                  question, r'OnboardingQuestionInfo', 'question'),
              questionType: BuiltValueNullFieldError.checkNotNull(
                  questionType, r'OnboardingQuestionInfo', 'questionType'),
              optionType: BuiltValueNullFieldError.checkNotNull(
                  optionType, r'OnboardingQuestionInfo', 'optionType'),
              enumType: BuiltValueNullFieldError.checkNotNull(
                  enumType, r'OnboardingQuestionInfo', 'enumType'),
              options: options.build(),
              isUserInput: BuiltValueNullFieldError.checkNotNull(
                  isUserInput, r'OnboardingQuestionInfo', 'isUserInput'),
              position: BuiltValueNullFieldError.checkNotNull(
                  position, r'OnboardingQuestionInfo', 'position'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        options.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OnboardingQuestionInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
