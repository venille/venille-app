# account_sdk.api.OnboardingApi

## Load the API package
```dart
import 'package:account_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**onboardingControllerGetOnboardingQuestions**](OnboardingApi.md#onboardingcontrollergetonboardingquestions) | **GET** /v1/account/onboarding/questions | 
[**onboardingControllerRegisterPeriodTracker**](OnboardingApi.md#onboardingcontrollerregisterperiodtracker) | **POST** /v1/account/onboarding/period-tracker | 


# **onboardingControllerGetOnboardingQuestions**
> BuiltList<OnboardingQuestionInfo> onboardingControllerGetOnboardingQuestions()



### Example
```dart
import 'package:account_sdk/api.dart';

final api = AccountSdk().getOnboardingApi();

try {
    final response = api.onboardingControllerGetOnboardingQuestions();
    print(response);
} catch on DioException (e) {
    print('Exception when calling OnboardingApi->onboardingControllerGetOnboardingQuestions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;OnboardingQuestionInfo&gt;**](OnboardingQuestionInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **onboardingControllerRegisterPeriodTracker**
> AccountInfo onboardingControllerRegisterPeriodTracker(registerPeriodTrackerDTO)



### Example
```dart
import 'package:account_sdk/api.dart';

final api = AccountSdk().getOnboardingApi();
final RegisterPeriodTrackerDTO registerPeriodTrackerDTO = ; // RegisterPeriodTrackerDTO | 

try {
    final response = api.onboardingControllerRegisterPeriodTracker(registerPeriodTrackerDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OnboardingApi->onboardingControllerRegisterPeriodTracker: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerPeriodTrackerDTO** | [**RegisterPeriodTrackerDTO**](RegisterPeriodTrackerDTO.md)|  | 

### Return type

[**AccountInfo**](AccountInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

