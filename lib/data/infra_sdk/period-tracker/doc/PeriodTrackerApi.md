# period_tracker_sdk.api.PeriodTrackerApi

## Load the API package
```dart
import 'package:period_tracker_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**periodTrackerControllerGetDashboardInfo**](PeriodTrackerApi.md#periodtrackercontrollergetdashboardinfo) | **GET** /v1/period-tracker/tracker/dashboard-info | 
[**periodTrackerControllerGetPeriodTrackerHistory**](PeriodTrackerApi.md#periodtrackercontrollergetperiodtrackerhistory) | **GET** /v1/period-tracker/tracker/predicted-log | 
[**periodTrackerControllerLogPeriodSymptoms**](PeriodTrackerApi.md#periodtrackercontrollerlogperiodsymptoms) | **POST** /v1/period-tracker/tracker/log-symptoms | 
[**periodTrackerControllerLogPeriodTrackerHistory**](PeriodTrackerApi.md#periodtrackercontrollerlogperiodtrackerhistory) | **PATCH** /v1/period-tracker/tracker/predicted-log | 


# **periodTrackerControllerGetDashboardInfo**
> DashboardInfo periodTrackerControllerGetDashboardInfo()



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getPeriodTrackerApi();

try {
    final response = api.periodTrackerControllerGetDashboardInfo();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PeriodTrackerApi->periodTrackerControllerGetDashboardInfo: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DashboardInfo**](DashboardInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **periodTrackerControllerGetPeriodTrackerHistory**
> PeriodTrackerHistory periodTrackerControllerGetPeriodTrackerHistory()



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getPeriodTrackerApi();

try {
    final response = api.periodTrackerControllerGetPeriodTrackerHistory();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PeriodTrackerApi->periodTrackerControllerGetPeriodTrackerHistory: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PeriodTrackerHistory**](PeriodTrackerHistory.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **periodTrackerControllerLogPeriodSymptoms**
> periodTrackerControllerLogPeriodSymptoms(logPeriodSymptomDto)



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getPeriodTrackerApi();
final LogPeriodSymptomDto logPeriodSymptomDto = ; // LogPeriodSymptomDto | 

try {
    api.periodTrackerControllerLogPeriodSymptoms(logPeriodSymptomDto);
} catch on DioException (e) {
    print('Exception when calling PeriodTrackerApi->periodTrackerControllerLogPeriodSymptoms: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **logPeriodSymptomDto** | [**LogPeriodSymptomDto**](LogPeriodSymptomDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **periodTrackerControllerLogPeriodTrackerHistory**
> periodTrackerControllerLogPeriodTrackerHistory(periodTrackerHistoryDto)



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getPeriodTrackerApi();
final PeriodTrackerHistoryDto periodTrackerHistoryDto = ; // PeriodTrackerHistoryDto | 

try {
    api.periodTrackerControllerLogPeriodTrackerHistory(periodTrackerHistoryDto);
} catch on DioException (e) {
    print('Exception when calling PeriodTrackerApi->periodTrackerControllerLogPeriodTrackerHistory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **periodTrackerHistoryDto** | [**PeriodTrackerHistoryDto**](PeriodTrackerHistoryDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

