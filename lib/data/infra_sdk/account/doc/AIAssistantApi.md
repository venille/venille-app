# account_sdk.api.AIAssistantApi

## Load the API package
```dart
import 'package:account_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountControllerReportAIResponse**](AIAssistantApi.md#accountcontrollerreportairesponse) | **POST** /v1/account/me/report-ai-response | 


# **accountControllerReportAIResponse**
> accountControllerReportAIResponse(reportAIResponseDTO)



### Example
```dart
import 'package:account_sdk/api.dart';

final api = AccountSdk().getAIAssistantApi();
final ReportAIResponseDTO reportAIResponseDTO = ; // ReportAIResponseDTO | 

try {
    api.accountControllerReportAIResponse(reportAIResponseDTO);
} catch on DioException (e) {
    print('Exception when calling AIAssistantApi->accountControllerReportAIResponse: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reportAIResponseDTO** | [**ReportAIResponseDTO**](ReportAIResponseDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

