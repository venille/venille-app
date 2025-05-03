# auth_sdk.api.AddressHelperApi

## Load the API package
```dart
import 'package:auth_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addressHelperControllerGetAvailableStates**](AddressHelperApi.md#addresshelpercontrollergetavailablestates) | **GET** /v1/auth/address-helper/available-states | 
[**addressHelperControllerGetAvailableStates_0**](AddressHelperApi.md#addresshelpercontrollergetavailablestates_0) | **GET** /v1/auth/address-helper/available-states | 


# **addressHelperControllerGetAvailableStates**
> BuiltList<AvailableStateInfo> addressHelperControllerGetAvailableStates()



### Example
```dart
import 'package:auth_sdk/api.dart';

final api = AuthSdk().getAddressHelperApi();

try {
    final response = api.addressHelperControllerGetAvailableStates();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressHelperApi->addressHelperControllerGetAvailableStates: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AvailableStateInfo&gt;**](AvailableStateInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addressHelperControllerGetAvailableStates_0**
> BuiltList<AvailableStateInfo> addressHelperControllerGetAvailableStates_0()



### Example
```dart
import 'package:auth_sdk/api.dart';

final api = AuthSdk().getAddressHelperApi();

try {
    final response = api.addressHelperControllerGetAvailableStates_0();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressHelperApi->addressHelperControllerGetAvailableStates_0: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AvailableStateInfo&gt;**](AvailableStateInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

