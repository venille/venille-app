# period_tracker_sdk.api.CycleAndOvulationApi

## Load the API package
```dart
import 'package:period_tracker_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**periodTrackerControllerFetchCycleAndOvulationSettings**](CycleAndOvulationApi.md#periodtrackercontrollerfetchcycleandovulationsettings) | **GET** /v1/period-tracker/tracker/cycle-and-ovulation-info | 
[**periodTrackerControllerPatchCycleAndOvulationSettings**](CycleAndOvulationApi.md#periodtrackercontrollerpatchcycleandovulationsettings) | **PATCH** /v1/period-tracker/tracker/update-cycle-and-ovulation-info | 


# **periodTrackerControllerFetchCycleAndOvulationSettings**
> CycleOvulationInfo periodTrackerControllerFetchCycleAndOvulationSettings()



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getCycleAndOvulationApi();

try {
    final response = api.periodTrackerControllerFetchCycleAndOvulationSettings();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CycleAndOvulationApi->periodTrackerControllerFetchCycleAndOvulationSettings: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CycleOvulationInfo**](CycleOvulationInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **periodTrackerControllerPatchCycleAndOvulationSettings**
> CycleOvulationInfo periodTrackerControllerPatchCycleAndOvulationSettings(updateCycleAndOvulationSettingsDto)



### Example
```dart
import 'package:period_tracker_sdk/api.dart';

final api = PeriodTrackerSdk().getCycleAndOvulationApi();
final UpdateCycleAndOvulationSettingsDto updateCycleAndOvulationSettingsDto = ; // UpdateCycleAndOvulationSettingsDto | 

try {
    final response = api.periodTrackerControllerPatchCycleAndOvulationSettings(updateCycleAndOvulationSettingsDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CycleAndOvulationApi->periodTrackerControllerPatchCycleAndOvulationSettings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateCycleAndOvulationSettingsDto** | [**UpdateCycleAndOvulationSettingsDto**](UpdateCycleAndOvulationSettingsDto.md)|  | 

### Return type

[**CycleOvulationInfo**](CycleOvulationInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

