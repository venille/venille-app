// @dart=3.5
// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:engagement_sdk/src/api_util.dart';
import 'package:engagement_sdk/src/model/translate_long_text_dto.dart';
import 'package:engagement_sdk/src/model/translate_text_info.dart';

class TranslationApi {

  final Dio _dio;

  final Serializers _serializers;

  const TranslationApi(this._dio, this._serializers);

  /// translationControllerTranslateLongText
  /// 
  ///
  /// Parameters:
  /// * [sourceLanguage] 
  /// * [targetLanguage] 
  /// * [translateLongTextDto] 
  /// * [engine] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TranslateTextInfo] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TranslateTextInfo>> translationControllerTranslateLongText({ 
    required String sourceLanguage,
    required String targetLanguage,
    required TranslateLongTextDto translateLongTextDto,
    String? engine,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/engagement/translation/translate-text-long';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearer',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      r'sourceLanguage': encodeQueryParameter(_serializers, sourceLanguage, const FullType(String)),
      r'targetLanguage': encodeQueryParameter(_serializers, targetLanguage, const FullType(String)),
      if (engine != null) r'engine': encodeQueryParameter(_serializers, engine, const FullType(String)),
    };

    dynamic _bodyData;

    try {
      const _type = FullType(TranslateLongTextDto);
      _bodyData = _serializers.serialize(translateLongTextDto, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    TranslateTextInfo? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(TranslateTextInfo),
      ) as TranslateTextInfo;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TranslateTextInfo>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// translationControllerTranslateText
  /// 
  ///
  /// Parameters:
  /// * [text] 
  /// * [sourceLanguage] 
  /// * [targetLanguage] 
  /// * [engine] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TranslateTextInfo] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TranslateTextInfo>> translationControllerTranslateText({ 
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    String? engine,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/engagement/translation/translate';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      r'text': encodeQueryParameter(_serializers, text, const FullType(String)),
      r'sourceLanguage': encodeQueryParameter(_serializers, sourceLanguage, const FullType(String)),
      r'targetLanguage': encodeQueryParameter(_serializers, targetLanguage, const FullType(String)),
      if (engine != null) r'engine': encodeQueryParameter(_serializers, engine, const FullType(String)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    TranslateTextInfo? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(TranslateTextInfo),
      ) as TranslateTextInfo;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TranslateTextInfo>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
