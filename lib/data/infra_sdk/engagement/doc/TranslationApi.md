# engagement_sdk.api.TranslationApi

## Load the API package
```dart
import 'package:engagement_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**translationControllerTranslateText**](TranslationApi.md#translationcontrollertranslatetext) | **POST** /v1/engagement/translation/translate | 


# **translationControllerTranslateText**
> TranslateTextInfo translationControllerTranslateText(text, sourceLanguage, targetLanguage, engine)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getTranslationApi();
final String text = Hello; // String | 
final String sourceLanguage = la; // String | 
final String targetLanguage = en; // String | 
final String engine = aws; // String | 

try {
    final response = api.translationControllerTranslateText(text, sourceLanguage, targetLanguage, engine);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TranslationApi->translationControllerTranslateText: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **text** | **String**|  | 
 **sourceLanguage** | **String**|  | 
 **targetLanguage** | **String**|  | 
 **engine** | **String**|  | [optional] 

### Return type

[**TranslateTextInfo**](TranslateTextInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

