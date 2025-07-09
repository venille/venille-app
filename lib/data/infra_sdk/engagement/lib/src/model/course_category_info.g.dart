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
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'course_category_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseCategoryInfo extends CourseCategoryInfo {
  @override
  final String title;
  @override
  final BuiltList<CourseInfo> courses;

  factory _$CourseCategoryInfo(
          [void Function(CourseCategoryInfoBuilder)? updates]) =>
      (new CourseCategoryInfoBuilder()..update(updates))._build();

  _$CourseCategoryInfo._({required this.title, required this.courses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        title, r'CourseCategoryInfo', 'title');
    BuiltValueNullFieldError.checkNotNull(
        courses, r'CourseCategoryInfo', 'courses');
  }

  @override
  CourseCategoryInfo rebuild(
          void Function(CourseCategoryInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseCategoryInfoBuilder toBuilder() =>
      new CourseCategoryInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseCategoryInfo &&
        title == other.title &&
        courses == other.courses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, courses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseCategoryInfo')
          ..add('title', title)
          ..add('courses', courses))
        .toString();
  }
}

class CourseCategoryInfoBuilder
    implements Builder<CourseCategoryInfo, CourseCategoryInfoBuilder> {
  _$CourseCategoryInfo? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<CourseInfo>? _courses;
  ListBuilder<CourseInfo> get courses =>
      _$this._courses ??= new ListBuilder<CourseInfo>();
  set courses(ListBuilder<CourseInfo>? courses) => _$this._courses = courses;

  CourseCategoryInfoBuilder() {
    CourseCategoryInfo._defaults(this);
  }

  CourseCategoryInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _courses = $v.courses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseCategoryInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CourseCategoryInfo;
  }

  @override
  void update(void Function(CourseCategoryInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseCategoryInfo build() => _build();

  _$CourseCategoryInfo _build() {
    _$CourseCategoryInfo _$result;
    try {
      _$result = _$v ??
          new _$CourseCategoryInfo._(
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'CourseCategoryInfo', 'title'),
              courses: courses.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'courses';
        courses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CourseCategoryInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
