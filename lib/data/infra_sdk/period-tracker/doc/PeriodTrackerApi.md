# period_tracker_sdk.api.PeriodTrackerApi

## Load the API package
```dart
import 'package:period_tracker_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**periodTrackerControllerGetDetailedAccountInfo**](PeriodTrackerApi.md#periodtrackercontrollergetdetailedaccountinfo) | **GET** /v1/period-tracker/tracker/history | 


# **periodTrackerControllerGetDetailedAccountInfo**
> BuiltList<PeriodTrackerInfo> periodTrackerControllerGetDetailedAccountInfo()



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getPeriodTrackerApi();

try {
    final response = api.periodTrackerControllerGetDetailedAccountInfo();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PeriodTrackerApi->periodTrackerControllerGetDetailedAccountInfo: $e\n');
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

