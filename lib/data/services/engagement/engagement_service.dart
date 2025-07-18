// ignore_for_file: library_prefixes, use_build_context_synchronously
import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:venille/data/services/guards/auth_guard.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/data/infra_sdk/engagement/lib/engagement_sdk.dart';

class EngagementService extends GetxController {
  RxBool isFetchCoursesProcessing = false.obs;
  RxBool isFetchForumPostsProcessing = false.obs;
  RxBool isAddForumCommentProcessing = false.obs;
  RxBool isFetchForumCommentsProcessing = false.obs;
  RxBool isFetchUserForumFeedProcessing = false.obs;
  RxBool isCreateUserForumPostProcessing = false.obs;
  RxBool isDeleteUserForumPostProcessing = false.obs;
  RxBool isDeleteForumCommentProcessing = false.obs;
  RxBool isLikeUnlikeForumPostProcessing = false.obs;
  RxBool isTranslateCourseDescriptionProcessing = false.obs;
  RxBool isTranslateForumPostDescriptionProcessing = false.obs;

  //! FETCH FORUM POSTS
  /// Fetch forum posts.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /forum/feed
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchForumPostsService({required int currentPage}) async {
    return authGuard<void>(() async {
      try {
        log("[FETCH-FORUM-POSTS-PENDING]");

        isFetchForumPostsProcessing.value = true;

        ForumApi forumApi = ServiceRegistry.engagementSdk.getForumApi();

        Dio.Response response = await forumApi.forumControllerFetchForumFeed(
          page: currentPage,
          pageSize: 20,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[FETCH-FORUM-POSTS-RESPONSE] :: ${response.data}');

          ForumFeedResponse data = response.data;

          if (currentPage == 1) {
            ServiceRegistry.userRepository.forumPosts.value =
                data.forums.toList();
          } else {
            ServiceRegistry.userRepository.forumPosts
                .addAll(data.forums.toList());
          }

          ServiceRegistry.userRepository.forumPostsCurrentPage.value =
              currentPage;
          ServiceRegistry.userRepository.forumPostsHasNextPage.value =
              data.hasNextPage;

          log("[FETCH-FORUM-POSTS-SUCCESS]");

          isFetchForumPostsProcessing.value = false;
        }
      } catch (error) {
        isFetchForumPostsProcessing.value = false;

        log('[FETCH-FORUM-POSTS-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[FETCH-FORUM-POSTS-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isFetchForumPostsProcessing.value = false;
      }
    });
  }

  //! FETCH FORUM COMMENTS
  /// Fetch forum comments.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /forum/comments
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchForumCommentsService({
    required int forumId,
    required int currentPage,
  }) async {
    return authGuard<void>(() async {
      try {
        log("[FETCH-FORUM-COMMENTS-PENDING]");

        isFetchForumCommentsProcessing.value = true;

        ForumApi forumApi = ServiceRegistry.engagementSdk.getForumApi();

        Dio.Response response =
            await forumApi.forumControllerFetchForumComments(
          forumId: forumId,
          page: currentPage,
          pageSize: 20,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          log('[FETCH-FORUM-COMMENTS-RESPONSE] :: ${response.data}');

          ForumCommentsResponse data = response.data;

          if (currentPage == 1) {
            ServiceRegistry.userRepository.forumPostComments.value =
                data.comments.toList();
          } else {
            ServiceRegistry.userRepository.forumPostComments
                .addAll(data.comments.toList());
          }

          ServiceRegistry.userRepository.forumPostCommentsCurrentPage.value =
              currentPage;
          ServiceRegistry.userRepository.forumPostCommentsHasNextPage.value =
              data.hasNextPage;

          log("[FETCH-FORUM-COMMENTS-SUCCESS]");

          isFetchForumCommentsProcessing.value = false;
        }
      } catch (error) {
        isFetchForumCommentsProcessing.value = false;

        log('[FETCH-FORUM-COMMENTS-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[FETCH-FORUM-COMMENTS-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isFetchForumCommentsProcessing.value = false;
      }
    });
  }

  //! LIKE UNLIKE FORUM POST
  /// Add forum comment.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /forum/comment
  ///
  /// [IS-AUTHENTICATED]
  Future<void> likeUnlikeForumPostService({
    required int forumId,
  }) async {
    return authGuard<void>(() async {
      try {
        log("[LIKE-UNLIKE-FORUM-POST-PENDING]");

        isLikeUnlikeForumPostProcessing.value = true;

        ForumApi forumApi = ServiceRegistry.engagementSdk.getForumApi();

        Dio.Response response =
            await forumApi.forumControllerLikeUnlikeForumPost(
          forumId: forumId,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          log('[LIKE-UNLIKE-FORUM-POST-RESPONSE] :: ${response.data}');

          ForumInfo data = response.data;

          ServiceRegistry.userRepository.forumPost.value = data;

          final updatedForumPost = ServiceRegistry
              .userRepository.forumPost.value
              .rebuild((forumPostBuilder) {
            forumPostBuilder.likes = ListBuilder(data.likes);
            forumPostBuilder.likeCount = data.likeCount;
          });

          ServiceRegistry.userRepository.forumPost.value = updatedForumPost;
          ServiceRegistry.userRepository.forumPosts.value =
              ServiceRegistry.userRepository.forumPosts.map((post) {
            if (post.id == updatedForumPost.id) {
              return updatedForumPost;
            }
            return post;
          }).toList();

          // customSuccessMessageSnackbar(
          //   title: 'Message',
          //   message: 'Post liked successfully',
          // );

          log("[LIKE-UNLIKE-FORUM-POST-SUCCESS]");

          isLikeUnlikeForumPostProcessing.value = false;
        }
      } catch (error) {
        isLikeUnlikeForumPostProcessing.value = false;

        log('[LIKE-UNLIKE-FORUM-POST-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[LIKE-UNLIKE-FORUM-POST-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isLikeUnlikeForumPostProcessing.value = false;
      }
    });
  }

  //! ADD FORUM COMMENT
  /// Add forum comment.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /forum/comment
  ///
  /// [IS-AUTHENTICATED]
  Future<void> addForumCommentService({
    required int forumId,
    required FocusNode focusNode,
    required CreateForumCommentDto payload,
    required TextEditingController commentController,
  }) async {
    return authGuard<void>(() async {
      try {
        log("[ADD-FORUM-COMMENT-PENDING]");

        isAddForumCommentProcessing.value = true;

        ForumApi forumApi = ServiceRegistry.engagementSdk.getForumApi();

        Dio.Response response = await forumApi.forumControllerAddForumComment(
          forumId: forumId,
          createForumCommentDto: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          log('[ADD-FORUM-COMMENT-RESPONSE] :: ${response.data}');

          ForumCommentInfo data = response.data;

          ServiceRegistry.userRepository.forumPostComments.insert(0, data);

          final updatedForumPost = ServiceRegistry
              .userRepository.forumPost.value
              .rebuild((forumPostBuilder) {
            forumPostBuilder.comments =
                (ServiceRegistry.userRepository.forumPost.value.comments + 1);
          });

          ServiceRegistry.userRepository.forumPost.value = updatedForumPost;
          ServiceRegistry.userRepository.forumPosts.value =
              ServiceRegistry.userRepository.forumPosts.map((post) {
            if (post.id == updatedForumPost.id) {
              return updatedForumPost;
            }
            return post;
          }).toList();

          customSuccessMessageSnackbar(
            title: 'Message',
            message: 'Comment added successfully',
          );

          focusNode.unfocus();
          commentController.clear();
          log("[ADD-FORUM-COMMENT-SUCCESS]");

          isAddForumCommentProcessing.value = false;
        }
      } catch (error) {
        isAddForumCommentProcessing.value = false;

        log('[ADD-FORUM-COMMENT-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[ADD-FORUM-COMMENT-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isAddForumCommentProcessing.value = false;
      }
    });
  }

  //! DELETE FORUM COMMENT
  /// Delete forum comment.
  ///
  /// [METHOD] - DELETE
  ///
  /// [ROUTE] - /forum/comment
  ///
  /// [IS-AUTHENTICATED]
  Future<void> deleteForumCommentService({
    required int commentId,
  }) async {
    return authGuard<void>(() async {
      try {
        log("[DELETE-FORUM-COMMENT-PENDING]");

        isDeleteForumCommentProcessing.value = true;

        ForumApi forumApi = ServiceRegistry.engagementSdk.getForumApi();

        Dio.Response response =
            await forumApi.forumControllerDeleteForumComment(
          commentId: commentId,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          // log('[DELETE-FORUM-COMMENT-RESPONSE] :: ${response.data}');

          if (response.data) {
            ServiceRegistry.userRepository.forumPostComments
                .removeWhere((element) => element.id == commentId.toString());
          }

          log("[DELETE-FORUM-COMMENT-SUCCESS]");

          isDeleteForumCommentProcessing.value = false;
        }
      } catch (error) {
        isDeleteForumCommentProcessing.value = false;

        log('[DELETE-FORUM-COMMENT-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[DELETE-FORUM-COMMENT-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isDeleteForumCommentProcessing.value = false;
      }
    });
  }

  //! FETCH USER FORUM FEED
  /// Fetch user forum feed.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /forum/feed/user
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchUserForumFeedService({
    required int currentPage,
  }) async {
    return authGuard<void>(() async {
      try {
        log("[FETCH-USER-FORUM-FEED-PENDING]");

        isFetchUserForumFeedProcessing.value = true;

        MyForumApi myForumApi = ServiceRegistry.engagementSdk.getMyForumApi();

        Dio.Response response =
            await myForumApi.forumControllerFetchUserForumFeed(
          page: currentPage,
          pageSize: 20,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[FETCH-USER-FORUM-FEED-RESPONSE] :: ${response.data}');

          ForumFeedResponse data = response.data;

          if (currentPage == 1) {
            ServiceRegistry.userRepository.userForumPosts.value =
                data.forums.toList();
          } else {
            ServiceRegistry.userRepository.userForumPosts
                .addAll(data.forums.toList());
          }

          log("[FETCH-USER-FORUM-FEED-SUCCESS]");

          isFetchUserForumFeedProcessing.value = false;
        }
      } catch (error) {
        isFetchUserForumFeedProcessing.value = false;

        log('[FETCH-USER-FORUM-FEED-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[FETCH-USER-FORUM-FEED-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isFetchUserForumFeedProcessing.value = false;
      }
    });
  }

  //! CREATE USER FORUM POST
  /// Create user forum post.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /forum/post
  ///
  /// [IS-AUTHENTICATED]
  Future<void> createUserForumPostService({
    required CreateForumDto payload,
  }) async {
    return authGuard<void>(() async {
      try {
        log("[CREATE-USER-FORUM-POST-PENDING]");

        isCreateUserForumPostProcessing.value = true;

        MyForumApi myForumApi = ServiceRegistry.engagementSdk.getMyForumApi();

        Dio.Response response = await myForumApi.forumControllerCreateForum(
          createForumDto: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 201) {
          // log('[FETCH-USER-FORUM-FEED-RESPONSE] :: ${response.data}');

          ForumInfo data = response.data;

          ServiceRegistry.userRepository.forumPosts.insert(0, data);
          ServiceRegistry.userRepository.userForumPosts.insert(0, data);

          Get.back();

          customSuccessMessageSnackbar(
            title: 'Message',
            message: 'Post created successfully',
          );

          log("[CREATE-USER-FORUM-POST-SUCCESS]");

          isCreateUserForumPostProcessing.value = false;
        }
      } catch (error) {
        isCreateUserForumPostProcessing.value = false;

        log('[CREATE-USER-FORUM-POST-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[CREATE-USER-FORUM-POST-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isCreateUserForumPostProcessing.value = false;
      }
    });
  }

  //! DELETE USER FORUM POST
  /// Delete user forum post.
  ///
  /// [METHOD] - DELETE
  ///
  /// [ROUTE] - /forum/post
  ///
  /// [IS-AUTHENTICATED]
  Future<void> deleteUserForumPostService({
    required int postId,
  }) async {
    return authGuard<void>(() async {
      try {
        log("[DELETE-USER-FORUM-POST-PENDING]");

        isDeleteUserForumPostProcessing.value = true;

        MyForumApi myForumApi = ServiceRegistry.engagementSdk.getMyForumApi();

        Dio.Response response = await myForumApi.forumControllerDeleteForum(
          forumId: postId,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[DELETE-USER-FORUM-POST-RESPONSE] :: ${response.data}');

          if (response.data) {
            ServiceRegistry.userRepository.forumPosts
                .removeWhere((element) => element.id == postId.toString());
            ServiceRegistry.userRepository.userForumPosts
                .removeWhere((element) => element.id == postId.toString());
          }

          log("[DELETE-USER-FORUM-POST-SUCCESS]");

          isDeleteUserForumPostProcessing.value = false;
        }
      } catch (error) {
        isDeleteUserForumPostProcessing.value = false;

        log('[DELETE-USER-FORUM-POST-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[DELETE-USER-FORUM-POST-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isDeleteUserForumPostProcessing.value = false;
      }
    });
  }

  //! FETCH COURSES
  /// Fetch courses.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /course/feed
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchCoursesService({
    required int currentPage,
  }) async {
    try {
      log("[FETCH-COURSES-PENDING]");

      isFetchCoursesProcessing.value = true;

      CourseApi courseApi = ServiceRegistry.engagementSdk.getCourseApi();

      Dio.Response response = await courseApi.courseControllerFetchForumFeed(
        page: currentPage,
        pageSize: 10,
      );

      if (response.statusCode == 200) {
        // log('[FETCH-COURSES-RESPONSE] :: ${response.data}');

        BuiltList<CourseCategoryInfo> data = response.data;

        if (currentPage == 1) {
          ServiceRegistry.userRepository.courseCategories.value = data.toList();
        } else {
          ServiceRegistry.userRepository.courseCategories.addAll(data.toList());
        }

        log("[FETCH-COURSES-SUCCESS]");

        List<String> courseImages = [];
        for (CourseCategoryInfo course
            in ServiceRegistry.userRepository.courseCategories) {
          for (CourseInfo courseCategory in course.courses) {
            courseImages.add(courseCategory.coverPhoto);
          }
        }

        Future.microtask(() {
          preCacheNetworkImages(courseImages);
        });

        isFetchCoursesProcessing.value = false;
      }
    } catch (error) {
      isFetchCoursesProcessing.value = false;

      log('[FETCH-COURSES-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[FETCH-COURSES-DIO-ERROR-RESPONSE] :: ${dioError.response}');
      }
    } finally {
      isFetchCoursesProcessing.value = false;
    }
  }

  //! TRANSLATE COURSE DESCRIPTION
  /// Translate course description.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /course/description/translate
  ///
  /// [IS-AUTHENTICATED]
  Future<void> translateCourseDescriptionService({
    required TranslateLongTextDto payload,
    required String courseId,
    required String sourceLanguage,
    required String targetLanguage,
    required String courseCategory,
    required Function updateLocalState,
  }) async {
    return authGuard<void>(() async {
      try {
        log("[TRANSLATE-COURSE-DESCRIPTION-PENDING]");

        isTranslateCourseDescriptionProcessing.value = true;

        TranslationApi translationApi =
            ServiceRegistry.engagementSdk.getTranslationApi();

        Dio.Response response =
            await translationApi.translationControllerTranslateLongText(
          translateLongTextDto: payload,
          engine: 'aws',
          sourceLanguage: sourceLanguage,
          targetLanguage: targetLanguage,
        );

        if (response.statusCode == 201 || response.statusCode == 200) {
          log('[TRANSLATE-COURSE-DESCRIPTION-RESPONSE] :: ${response.data}');

          TranslateTextInfo data = response.data;

          if (data.isTranslated) {
            // final updatedCourses =
            //     ServiceRegistry.userRepository.courseCategories.map((course) {
            //   if (course.title == courseCategory) {
            //     return course.rebuild((courseCategoryBuilder) {
            //       courseCategoryBuilder.courses =
            //           ListBuilder(course.courses.map((course) {
            //         if (course.id == courseId) {
            //           return course.rebuild((courseBuilder) {
            //             courseBuilder.description = data.translatedText;
            //           });
            //         }
            //         return course;
            //       }).toList());
            //     });
            //   }
            //   return course;
            // }).toList();

            ServiceRegistry.userRepository.courseInfo.value =
                ServiceRegistry.userRepository.courseInfo.value.rebuild(
              (courseInfoBuilder) {
                courseInfoBuilder.description = data.translatedText;
              },
            );

            updateLocalState();

            // ServiceRegistry.userRepository.courseCategories.value =
            //     updatedCourses;
          }
        } else {
          customErrorMessageSnackbar(
            title: 'Message',
            message: 'Failed to translate course description',
          );
        }

        log("[TRANSLATE-COURSE-DESCRIPTION-SUCCESS]");

        isTranslateCourseDescriptionProcessing.value = false;
      } catch (error) {
        isTranslateCourseDescriptionProcessing.value = false;

        log('[TRANSLATE-COURSE-DESCRIPTION-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[TRANSLATE-COURSE-DESCRIPTION-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isTranslateCourseDescriptionProcessing.value = false;
      }
    });
  }

  //! TRANSLATE FORUM POST DESCRIPTION
  /// Translate forum post description.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /forum/post/description/translate
  ///
  /// [IS-AUTHENTICATED]
  Future<void> translateForumPostDescriptionService(
      {required String text,
      required String postId,
      required String sourceLanguage,
      required String targetLanguage,
      required Function updateLocalState}) async {
    return authGuard<void>(() async {
      try {
        log("[TRANSLATE-FORUM-POST-DESCRIPTION-PENDING]");

        isTranslateForumPostDescriptionProcessing.value = true;

        TranslationApi translationApi =
            ServiceRegistry.engagementSdk.getTranslationApi();

        Dio.Response response =
            await translationApi.translationControllerTranslateText(
          text: text,
          engine: 'aws',
          sourceLanguage: sourceLanguage,
          targetLanguage: targetLanguage,
        );

        if (response.statusCode == 201) {
          log('[TRANSLATE-FORUM-POST-DESCRIPTION-RESPONSE] :: ${response.data}');

          TranslateTextInfo data = response.data;

          log('[UPDATED-DESCRIPTION] :: $data');

          if (data.isTranslated) {
            final updatedForumPost = ServiceRegistry
                .userRepository.forumPost.value
                .rebuild((forumPostBuilder) {
              forumPostBuilder.description = data.translatedText;
            });

            log('[UPDATED-DESCRIPTION] :: $updatedForumPost');

            ServiceRegistry.userRepository.forumPost.value = updatedForumPost;
            ServiceRegistry.userRepository.forumPosts.value =
                ServiceRegistry.userRepository.forumPosts.map((post) {
              if (post.id == updatedForumPost.id) {
                return updatedForumPost;
              }
              return post;
            }).toList();

            updateLocalState();

            log("[TRANSLATE-FORUM-POST-DESCRIPTION-SUCCESS]");
          }
        } else {
          customErrorMessageSnackbar(
            title: 'Message',
            message: 'Failed to translate post description',
          );
        }

        log("[TRANSLATE-FORUM-POST-DESCRIPTION-SUCCESS]");

        isTranslateForumPostDescriptionProcessing.value = false;
      } catch (error) {
        isTranslateForumPostDescriptionProcessing.value = false;

        log('[TRANSLATE-FORUM-POST-DESCRIPTION-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[TRANSLATE-FORUM-POST-DESCRIPTION-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isTranslateForumPostDescriptionProcessing.value = false;
      }
    });
  }
}
