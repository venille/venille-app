# engagement_sdk.api.MyForumApi

## Load the API package
```dart
import 'package:engagement_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forumControllerCreateForum**](MyForumApi.md#forumcontrollercreateforum) | **POST** /v1/engagement/forum/create | 
[**forumControllerDeleteForum**](MyForumApi.md#forumcontrollerdeleteforum) | **DELETE** /v1/engagement/forum/delete | 
[**forumControllerFetchUserForumFeed**](MyForumApi.md#forumcontrollerfetchuserforumfeed) | **GET** /v1/engagement/forum/feed-me | 


# **forumControllerCreateForum**
> ForumInfo forumControllerCreateForum(createForumDto)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getMyForumApi();
final CreateForumDto createForumDto = ; // CreateForumDto | 

try {
    final response = api.forumControllerCreateForum(createForumDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyForumApi->forumControllerCreateForum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createForumDto** | [**CreateForumDto**](CreateForumDto.md)|  | 

### Return type

[**ForumInfo**](ForumInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **forumControllerDeleteForum**
> bool forumControllerDeleteForum(forumId)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getMyForumApi();
final num forumId = 1; // num | 

try {
    final response = api.forumControllerDeleteForum(forumId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyForumApi->forumControllerDeleteForum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forumId** | **num**|  | 

### Return type

**bool**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **forumControllerFetchUserForumFeed**
> ForumFeedResponse forumControllerFetchUserForumFeed(page, pageSize)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getMyForumApi();
final num page = 1; // num | 
final num pageSize = 20; // num | 

try {
    final response = api.forumControllerFetchUserForumFeed(page, pageSize);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyForumApi->forumControllerFetchUserForumFeed: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**|  | 
 **pageSize** | **num**|  | 

### Return type

[**ForumFeedResponse**](ForumFeedResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

