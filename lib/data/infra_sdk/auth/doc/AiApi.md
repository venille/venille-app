# auth_sdk.api.AiApi

## Load the API package
```dart
import 'package:auth_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authControllerTestGeminiAI**](AiApi.md#authcontrollertestgeminiai) | **POST** /v1/auth/test-gemini | 


# **authControllerTestGeminiAI**
> String authControllerTestGeminiAI(query)



### Example
```dart
import 'package:auth_sdk/api.dart';

final api = AuthSdk().getAiApi();
final String query = Explain how AI works in a few words; // String | What do you want to ask the AI

try {
    final response = api.authControllerTestGeminiAI(query);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AiApi->authControllerTestGeminiAI: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| What do you want to ask the AI | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

