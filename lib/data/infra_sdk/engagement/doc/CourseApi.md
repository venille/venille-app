# engagement_sdk.api.CourseApi

## Load the API package
```dart
import 'package:engagement_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**courseControllerFetchForumFeed**](CourseApi.md#coursecontrollerfetchforumfeed) | **GET** /v1/engagement/course/feed | 


# **courseControllerFetchForumFeed**
> BuiltList<CourseCategoryInfo> courseControllerFetchForumFeed(page, pageSize)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getCourseApi();
final num page = 1; // num | 
final num pageSize = 5; // num | 

try {
    final response = api.courseControllerFetchForumFeed(page, pageSize);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CourseApi->courseControllerFetchForumFeed: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**|  | 
 **pageSize** | **num**|  | 

### Return type

[**BuiltList&lt;CourseCategoryInfo&gt;**](CourseCategoryInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

