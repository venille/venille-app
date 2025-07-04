// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:engagement_sdk/src/serializers.dart';
import 'package:engagement_sdk/src/auth/api_key_auth.dart';
import 'package:engagement_sdk/src/auth/basic_auth.dart';
import 'package:engagement_sdk/src/auth/bearer_auth.dart';
import 'package:engagement_sdk/src/auth/oauth.dart';
import 'package:engagement_sdk/src/api/course_api.dart';
import 'package:engagement_sdk/src/api/forum_api.dart';
import 'package:engagement_sdk/src/api/my_forum_api.dart';
import 'package:engagement_sdk/src/api/translation_api.dart';

class EngagementSdk {
  static const String basePath = r'https://venille-api.livestocx.xyz';

  final Dio dio;
  final Serializers serializers;

  EngagementSdk({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get CourseApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CourseApi getCourseApi() {
    return CourseApi(dio, serializers);
  }

  /// Get ForumApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ForumApi getForumApi() {
    return ForumApi(dio, serializers);
  }

  /// Get MyForumApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MyForumApi getMyForumApi() {
    return MyForumApi(dio, serializers);
  }

  /// Get TranslationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TranslationApi getTranslationApi() {
    return TranslationApi(dio, serializers);
  }
}
