# engagement_sdk.api.ForumApi

## Load the API package
```dart
import 'package:engagement_sdk/api.dart';
```

All URIs are relative to *https://venille-api.livestocx.xyz*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forumControllerAddForumComment**](ForumApi.md#forumcontrolleraddforumcomment) | **POST** /v1/engagement/forum/feed/add-comment | 
[**forumControllerDeleteForumComment**](ForumApi.md#forumcontrollerdeleteforumcomment) | **DELETE** /v1/engagement/forum/feed/delete-comment | 
[**forumControllerFetchForumComments**](ForumApi.md#forumcontrollerfetchforumcomments) | **GET** /v1/engagement/forum/feed/comments | 
[**forumControllerFetchForumFeed**](ForumApi.md#forumcontrollerfetchforumfeed) | **GET** /v1/engagement/forum/feed | 
[**forumControllerLikeUnlikeForumPost**](ForumApi.md#forumcontrollerlikeunlikeforumpost) | **POST** /v1/engagement/forum/feed/like-unlike | 


# **forumControllerAddForumComment**
> ForumCommentInfo forumControllerAddForumComment(forumId, createForumCommentDto)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getForumApi();
final num forumId = 1; // num | 
final CreateForumCommentDto createForumCommentDto = ; // CreateForumCommentDto | 

try {
    final response = api.forumControllerAddForumComment(forumId, createForumCommentDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ForumApi->forumControllerAddForumComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forumId** | **num**|  | 
 **createForumCommentDto** | [**CreateForumCommentDto**](CreateForumCommentDto.md)|  | 

### Return type

[**ForumCommentInfo**](ForumCommentInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **forumControllerDeleteForumComment**
> bool forumControllerDeleteForumComment(commentId)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getForumApi();
final num commentId = 1; // num | 

try {
    final response = api.forumControllerDeleteForumComment(commentId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ForumApi->forumControllerDeleteForumComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **commentId** | **num**|  | 

### Return type

**bool**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **forumControllerFetchForumComments**
> ForumCommentsResponse forumControllerFetchForumComments(page, forumId, pageSize)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getForumApi();
final num page = 1; // num | 
final num forumId = 1; // num | 
final num pageSize = 20; // num | 

try {
    final response = api.forumControllerFetchForumComments(page, forumId, pageSize);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ForumApi->forumControllerFetchForumComments: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**|  | 
 **forumId** | **num**|  | 
 **pageSize** | **num**|  | 

### Return type

[**ForumCommentsResponse**](ForumCommentsResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **forumControllerFetchForumFeed**
> ForumFeedResponse forumControllerFetchForumFeed(page, pageSize)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getForumApi();
final num page = 1; // num | 
final num pageSize = 20; // num | 

try {
    final response = api.forumControllerFetchForumFeed(page, pageSize);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ForumApi->forumControllerFetchForumFeed: $e\n');
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

# **forumControllerLikeUnlikeForumPost**
> ForumInfo forumControllerLikeUnlikeForumPost(forumId)



### Example
```dart
import 'package:engagement_sdk/api.dart';

final api = EngagementSdk().getForumApi();
final num forumId = 1; // num | 

try {
    final response = api.forumControllerLikeUnlikeForumPost(forumId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ForumApi->forumControllerLikeUnlikeForumPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forumId** | **num**|  | 

### Return type

[**ForumInfo**](ForumInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

