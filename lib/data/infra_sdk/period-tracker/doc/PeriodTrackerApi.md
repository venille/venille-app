# period_tracker_sdk.api.PeriodTrackerApi

## Load the API package
```dart
import 'package:period_tracker_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**periodTrackerControllerGetDashboardPeriodTrackerHistory**](PeriodTrackerApi.md#periodtrackercontrollergetdashboardperiodtrackerhistory) | **GET** /v1/period-tracker/tracker/dashboard | 
[**periodTrackerControllerGetPeriodLogHistory**](PeriodTrackerApi.md#periodtrackercontrollergetperiodloghistory) | **GET** /v1/period-tracker/tracker/log/history | 
[**periodTrackerControllerGetPeriodTrackerHistory**](PeriodTrackerApi.md#periodtrackercontrollergetperiodtrackerhistory) | **GET** /v1/period-tracker/tracker/history | 


# **periodTrackerControllerGetDashboardPeriodTrackerHistory**
> DashboardTrackerInfo periodTrackerControllerGetDashboardPeriodTrackerHistory()



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getPeriodTrackerApi();

try {
    final response = api.periodTrackerControllerGetDashboardPeriodTrackerHistory();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PeriodTrackerApi->periodTrackerControllerGetDashboardPeriodTrackerHistory: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DashboardTrackerInfo**](DashboardTrackerInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **periodTrackerControllerGetPeriodLogHistory**
> BuiltList<PeriodLogInfo> periodTrackerControllerGetPeriodLogHistory()



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getPeriodTrackerApi();

try {
    final response = api.periodTrackerControllerGetPeriodLogHistory();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PeriodTrackerApi->periodTrackerControllerGetPeriodLogHistory: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PeriodLogInfo&gt;**](PeriodLogInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **periodTrackerControllerGetPeriodTrackerHistory**
> BuiltList<PeriodTrackerInfo> periodTrackerControllerGetPeriodTrackerHistory()



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

[**BuiltList&lt;PeriodTrackerInfo&gt;**](PeriodTrackerInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

