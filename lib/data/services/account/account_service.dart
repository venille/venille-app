// ignore_for_file: library_prefixes, use_build_context_synchronously
import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/src/multipart_file.dart' as DioMultipart;
import 'package:venille/data/services/guards/auth_guard.dart';
import 'package:venille/data/services/auth/auth_middlewares.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';

class AccountService extends GetxController {
  RxBool isContactUsProcessing = false.obs;
  RxBool isFileUploadProcessing = false.obs;
  RxBool isFetchAccountInfoProcessing = false.obs;
  RxBool isDeleteUserAccountProcessing = false.obs;
  RxBool isUpdateAccountInfoProcessing = false.obs;
  RxBool isUpdateAccountPasswordProcessing = false.obs;
  RxBool isResendUpdateAccountInfoOtpProcessing = false.obs;

  //! FETCH ACCOUNT INFO
  /// Fetch detailed user account info.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /account/me/detailed
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchDetailedUserAccountInfoService() async {
    return authGuard<void>(() async {
      if (ServiceRegistry.localStorage
              .read(LocalStorageSecrets.authenticationMethod) ==
          'GUEST') {
        return;
      }

      try {
        log("[FETCH-DETAILED-USER-ACCOUNT-INFO-PENDING]");

        isFetchAccountInfoProcessing.value = true;

        MeApi meApi = ServiceRegistry.accountSdk.getMeApi();

        Dio.Response response =
            await meApi.accountControllerGetDetailedAccountInfo(
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[FETCH-DETAILED-USER-ACCOUNT-INFO-RESPONSE] :: ${response.data}');

          AccountInfo accountInfo = response.data;

          ServiceRegistry.userRepository.accountInfo.value = accountInfo;

          log("[FETCH-DETAILED-USER-ACCOUNT-INFO-SUCCESS]");

          isFetchAccountInfoProcessing.value = false;
        }
      } catch (error) {
        isFetchAccountInfoProcessing.value = false;

        log('[FETCH-DETAILED-USER-ACCOUNT-INFO-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[FETCH-DETAILED-USER-ACCOUNT-INFO-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isFetchAccountInfoProcessing.value = false;
      }
    });
  }

  //! UPDATE ACCOUNT NAME
  /// Update user account name.
  ///
  /// [METHOD] - PATCH
  ///
  /// [ROUTE] - /account/me/update-name
  ///
  /// [IS-AUTHENTICATED]
  Future<void> updateUserAccountNameService(
      UpdateAccountNameDTO payload) async {
    return authGuard<void>(() async {
      if (ServiceRegistry.localStorage
              .read(LocalStorageSecrets.authenticationMethod) ==
          'GUEST') {
        return;
      }

      try {
        log("[UPDATE-USER-ACCOUNT-NAME-PENDING]");

        isUpdateAccountInfoProcessing.value = true;

        ManageContactInfoApi manageContactInfoApi =
            ServiceRegistry.accountSdk.getManageContactInfoApi();

        Dio.Response response =
            await manageContactInfoApi.accountControllerUpdateAccountName(
          updateAccountNameDTO: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[UPDATE-USER-ACCOUNT-NAME-RESPONSE] :: ${response.data}');

          AccountInfo accountInfo = response.data;

          ServiceRegistry.userRepository.accountInfo.value = accountInfo;

          Get.back();

          customSuccessMessageSnackbar(
            title: 'Message',
            message: 'Account name updated.',
          );

          log("[UPDATE-USER-ACCOUNT-NAME-SUCCESS]");

          isUpdateAccountInfoProcessing.value = false;
        }
      } catch (error) {
        isUpdateAccountInfoProcessing.value = false;

        log('[UPDATE-USER-ACCOUNT-NAME-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[UPDATE-USER-ACCOUNT-NAME-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isUpdateAccountInfoProcessing.value = false;
      }
    });
  }

  //! UPDATE ACCOUNT LOCATION
  /// Update user account location.
  ///
  /// [METHOD] - PATCH
  ///
  /// [ROUTE] - /account/me/update-location
  ///
  /// [IS-AUTHENTICATED]
  Future<void> updateUserAccountLocationService(
      UpdateAccountLocationDTO payload) async {
    return authGuard<void>(() async {
      if (ServiceRegistry.localStorage
              .read(LocalStorageSecrets.authenticationMethod) ==
          'GUEST') {
        return;
      }

      try {
        log("[UPDATE-USER-ACCOUNT-LOCATION-PENDING]");

        isUpdateAccountInfoProcessing.value = true;

        ManageContactInfoApi manageContactInfoApi =
            ServiceRegistry.accountSdk.getManageContactInfoApi();

        Dio.Response response =
            await manageContactInfoApi.accountControllerUpdateAccountLocation(
          updateAccountLocationDTO: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[UPDATE-USER-ACCOUNT-LOCATION-RESPONSE] :: ${response.data}');

          AccountInfo accountInfo = response.data;

          ServiceRegistry.userRepository.accountInfo.value = accountInfo;

          Get.back();

          customSuccessMessageSnackbar(
            title: 'Message',
            message: 'Account location updated.',
          );

          log("[UPDATE-USER-ACCOUNT-LOCATION-SUCCESS]");

          isUpdateAccountInfoProcessing.value = false;
        }
      } catch (error) {
        isUpdateAccountInfoProcessing.value = false;

        log('[UPDATE-USER-ACCOUNT-LOCATION-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[UPDATE-USER-ACCOUNT-LOCATION-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isUpdateAccountInfoProcessing.value = false;
      }
    });
  }

  //! UPDATE ACCOUNT PHONE NUMBER
  /// Update user account phone number.
  ///
  /// [METHOD] - PATCH
  ///
  /// [ROUTE] - /account/me/update-phone
  ///
  /// [IS-AUTHENTICATED]
  Future<void> updateUserAccountPhoneNumberService(
      UpdateAccountPhoneDTO payload) async {
    return authGuard<void>(() async {
      if (ServiceRegistry.localStorage
              .read(LocalStorageSecrets.authenticationMethod) ==
          'GUEST') {
        return;
      }

      try {
        log("[UPDATE-USER-ACCOUNT-PHONE-PENDING]");

        isUpdateAccountInfoProcessing.value = true;

        ManageContactInfoApi manageContactInfoApi =
            ServiceRegistry.accountSdk.getManageContactInfoApi();

        Dio.Response response =
            await manageContactInfoApi.accountControllerUpdateAccountPhone(
          updateAccountPhoneDTO: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[UPDATE-USER-ACCOUNT-PHONE-RESPONSE] :: ${response.data}');

          AccountInfo accountInfo = response.data;

          ServiceRegistry.userRepository.accountInfo.value = accountInfo;

          Get.back();

          customSuccessMessageSnackbar(
            title: 'Message',
            message: 'Account phone number updated.',
          );

          log("[UPDATE-USER-ACCOUNT-PHONE-SUCCESS]");

          isUpdateAccountInfoProcessing.value = false;
        }
      } catch (error) {
        isUpdateAccountInfoProcessing.value = false;

        log('[UPDATE-USER-ACCOUNT-PHONE-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          if (dioError.response?.data['message'] != null) {
            customErrorMessageSnackbar(
              title: 'Message',
              message: dioError.response?.data['message'],
            );
          }

          log('[UPDATE-USER-ACCOUNT-PHONE-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isUpdateAccountInfoProcessing.value = false;
      }
    });
  }

  //! UPDATE ACCOUNT AVATAR
  /// Update account avatar.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /account/me
  ///
  /// [IS-AUTHENTICATED]
  Future<void> updateAccountAvatarService(
      {PlatformFile? platformFile,
      String? photoUrl,
      BuildContext? context}) async {
    try {
      log("[UPDATE-ACCOUNT-AVATAR-PENDING]");

      late FileUploadResult fileUploadResult;

      MeApi meApi = ServiceRegistry.accountSdk.getMeApi();
      UploadApi uploadApi = ServiceRegistry.accountSdk.getUploadApi();

      isFileUploadProcessing.value = true;

      if (platformFile != null) {
        DioMultipart.MultipartFile file =
            await DioMultipart.MultipartFile.fromFile(
          platformFile.path!,
          filename: platformFile.name,
        );

        Dio.Response uploadImageResponse =
            await uploadApi.imageUploadControllerUploadImage(
          file: file,
          headers: {
            'content-type': 'multipart/form-data',
          },
        ).timeout(const Duration(seconds: 30));

        fileUploadResult = uploadImageResponse.data;
      }

      UpdateProfileImageDTO formData = UpdateProfileImageDTO(
        (instance) => instance
          ..imageUrl = platformFile != null ? fileUploadResult.url : photoUrl,
      );

      Dio.Response response = await meApi.accountControllerUpdateProfileImage(
        updateProfileImageDTO: formData,
        headers: {
          "Authorization": ServiceRegistry.localStorage.read(
            LocalStorageSecrets.accessToken,
          ),
        },
      );

      if (response.statusCode == 200) {
        log('[UPDATE-USER-ACCOUNT-AVATAR-RESPONSE] :: ${response.data}');

        AccountInfo accountInfo = response.data;

        ServiceRegistry.userRepository.accountInfo.value = accountInfo;

        Navigator.of(context!).pop();

        customSuccessMessageSnackbar(
          title: 'Message',
          message: 'Profile avatar updated.',
        );

        log("[UPDATE-ACCOUNT-AVATAR-SUCCESS]");

        isFileUploadProcessing.value = false;
      }
    } catch (error) {
      isFileUploadProcessing.value = false;

      log('[UPDATE-ACCOUNT-AVATAR-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[UPDATE-ACCOUNT-AVATAR-ERROR-RESPONSE] :: ${dioError.response}');
      }
    } finally {
      isFileUploadProcessing.value = false;
    }
  }

  //! FETCH NOTIFICATIONS
  /// Fetch notifications.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /account/me/notifications
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchNotificationsService({required int page}) async {
    try {
      log("[FETCH-NOTIFICATIONS-PENDING]");

      NotificationsApi notificationsApi =
          ServiceRegistry.accountSdk.getNotificationsApi();

      Dio.Response response =
          await notificationsApi.accountNotificationControllerGetNotifications(
        page: page,
        pageSize: 20,
        headers: {
          "Authorization": ServiceRegistry.localStorage.read(
            LocalStorageSecrets.accessToken,
          ),
        },
      );

      if (response.statusCode == 200) {
        // log('[FETCH-NOTIFICATIONS-RESPONSE] :: ${response.data}');

        NotificationsResponse notificationsResponse = response.data;

        RxList<NotificationInfo> notifications = RxList<NotificationInfo>.from(
          notificationsResponse.notifications,
        );

        if (page == 1) {
          ServiceRegistry.userRepository.notifications.clear();
        }

        ServiceRegistry.userRepository.notifications.value = notifications;

        ServiceRegistry.userRepository.notificationsCurrentPage.value = page;

        ServiceRegistry.userRepository.notificationsHasNextPage.value =
            notificationsResponse.hasNextPage;

        log("[FETCH-NOTIFICATIONS-SUCCESS]");
      }
    } catch (error) {
      log('[FETCH-NOTIFICATIONS-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[FETCH-NOTIFICATIONS-ERROR-RESPONSE] :: ${dioError.response}');
      }
    }
  }

  //! READ NOTIFICATION
  /// Read notifications.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /account/me/notifications
  ///
  /// [IS-AUTHENTICATED]
  Future<void> readNotificationsService({required int notificationId}) async {
    try {
      log("[READ-NOTIFICATION-PENDING]");

      NotificationsApi notificationsApi =
          ServiceRegistry.accountSdk.getNotificationsApi();

      Dio.Response response =
          await notificationsApi.accountNotificationControllerReadNotification(
        notificationId: notificationId,
        headers: {
          "Authorization": ServiceRegistry.localStorage.read(
            LocalStorageSecrets.accessToken,
          ),
        },
      );

      if (response.statusCode == 200) {
        // log('[READ-NOTIFICATION-RESPONSE] :: ${response.data}');

        NotificationInfo notification = response.data;

        // Remove the notification with matching ID
        ServiceRegistry.userRepository.notifications
            .removeWhere((item) => item.id == notificationId.toString());

        // Add the new notification
        ServiceRegistry.userRepository.notifications.add(notification);

        log("[READ-NOTIFICATION-SUCCESS]");
      }
    } catch (error) {
      log('[READ-NOTIFICATION-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[READ-NOTIFICATION-ERROR-RESPONSE] :: ${dioError.response}');
      }
    }
  }

  //! CONTACT US
  /// Contact us.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /account/support/contact-us
  ///
  /// [IS-AUTHENTICATED]
  Future<bool> contactUsService(ContactUsDTO payload) async {
    try {
      log("[CONTACT-US-PENDING]");

      isContactUsProcessing.value = true;

      SupportApi supportApi = ServiceRegistry.accountSdk.getSupportApi();

      Dio.Response response = await supportApi.supportControllerContactUs(
        contactUsDTO: payload,
        headers: {
          "Authorization": ServiceRegistry.localStorage.read(
            LocalStorageSecrets.accessToken,
          ),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('[CONTACT-US-RESPONSE] :: ${response.data}');

        customSuccessMessageSnackbar(
          title: 'Message',
          message:
              'Your ticket has been created successfully, we will get back to you soon.',
        );

        isContactUsProcessing.value = false;

        log("[CONTACT-US-SUCCESS]");

        return true;
      }

      return false;
    } catch (error) {
      isContactUsProcessing.value = false;

      log('[CONTACT-US-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[CONTACT-US-ERROR-RESPONSE] :: ${dioError.response}');
      }

      return false;
    } finally {
      isContactUsProcessing.value = false;
    }
  }

  //! UPDATE ACCOUNT FCM TOKEN
  /// Update account fcm token.
  ///
  /// [METHOD] - PATCH
  ///
  /// [ROUTE] - /account/me/update-fcm-token
  ///
  /// [IS-AUTHENTICATED]
  Future<void> updateAccountFcmTokenService(UpdateFCMTokenDTO payload) async {
    return authGuard<void>(() async {
      try {
        log("[UPDATE-ACCOUNT-FCM-TOKEN-PENDING]");

        MeApi meApi = ServiceRegistry.accountSdk.getMeApi();

        Dio.Response response = await meApi.accountControllerUpdateFcmToken(
          updateFCMTokenDTO: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          log('[UPDATE-USER-ACCOUNT-FCM-TOKEN-RESPONSE] :: ${response.data}');

          log("[UPDATE-ACCOUNT-FCM-TOKEN-SUCCESS]");
        }
      } catch (error) {
        log('[UPDATE-ACCOUNT-FCM-TOKEN-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[UPDATE-ACCOUNT-FCM-TOKEN-ERROR-RESPONSE] :: ${dioError.response}');
        }
      }
    });
  }

  //! UPLOAD FILE
  /// Upload file.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /v1/upload/file
  Future<String> uploadFile(PlatformFile platformFile) async {
    try {
      log('[FILE-UPLOAD-PROCESSING]');

      isFileUploadProcessing.value = true;

      UploadApi uploadApi = ServiceRegistry.accountSdk.getUploadApi();

      DioMultipart.MultipartFile file =
          await DioMultipart.MultipartFile.fromFile(
        platformFile.path!,
        filename: platformFile.name,
        contentType:
            Dio.DioMediaType.parse(getFileMimeType(platformFile.extension!)),
      );

      Dio.Response response = await uploadApi.imageUploadControllerUploadFile(
        file: file,
        headers: {
          'content-type': 'multipart/form-data',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('[FILE-UPLOAD-SUCCESS] :: ${response.data}');

        FileUploadResult fileUploadResult = response.data;

        return fileUploadResult.url;
      }

      return '';
    } catch (error) {
      log('[FILE-UPLOAD-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[FILE-UPLOAD-ERROR-RESPONSE] :: ${dioError.response}');
      }

      return '';
    } finally {
      isFileUploadProcessing.value = false;
    }
  }

  //! UPLOAD FILE
  /// Upload file.
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /v1/upload/file
  Future<String> uploadImage(PlatformFile platformFile) async {
    try {
      log('[IMAGE-UPLOAD-PROCESSING]');

      isFileUploadProcessing.value = true;

      UploadApi uploadApi = ServiceRegistry.accountSdk.getUploadApi();

      DioMultipart.MultipartFile file =
          await DioMultipart.MultipartFile.fromFile(
        platformFile.path!,
        filename: platformFile.name,
        contentType:
            Dio.DioMediaType.parse(getFileMimeType(platformFile.extension!)),
      );

      Dio.Response response = await uploadApi.imageUploadControllerUploadImage(
        file: file,
        headers: {
          'content-type': 'multipart/form-data',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('[IMAGE-UPLOAD-SUCCESS] :: ${response.data}');

        FileUploadResult fileUploadResult = response.data;

        return fileUploadResult.url;
      }

      return '';
    } catch (error) {
      log('[IMAGE-UPLOAD-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[IMAGE-UPLOAD-ERROR-RESPONSE] :: ${dioError.response}');
      }

      return '';
    } finally {
      isFileUploadProcessing.value = false;
    }
  }

  //! DELETE USER ACCOUNT
  /// Delete account.
  ///
  /// [METHOD] - DELETE
  ///
  /// [ROUTE] - /v1/account/me
  ///
  Future<void> deleteUserAccountService(
      DeleteAccountDTO payload, BuildContext context) async {
    return authGuard<void>(() async {
      if (ServiceRegistry.localStorage
              .read(LocalStorageSecrets.authenticationMethod) ==
          'GUEST') {
        return;
      }

      try {
        log("DELETE-USER-ACCOUNT-PENDING]");

        isDeleteUserAccountProcessing.value = true;

        MeApi meApi = ServiceRegistry.accountSdk.getMeApi();

        Dio.Response response = await meApi.accountControllerDeleteAccount(
          deleteAccountDTO: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage
                .read(LocalStorageSecrets.accessToken),
          },
        );

        if (response.statusCode == 200) {
          log('DELETE-USER-ACCOUNT-RESPONSE] :: ${response.data}');

          Navigator.of(context).pop();

          userLogoutHandler(displayMessage: 'Account deleted successfully.');

          isDeleteUserAccountProcessing.value = false;

          log("DELETE-USER-ACCOUNT-SUCCESS]");
        }
      } catch (error) {
        isDeleteUserAccountProcessing.value = false;

        log('DELETE-USER-ACCOUNT-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('DELETE-USER-ACCOUNT-ERROR-RESPONSE] :: ${dioError.response}');

          if (dioError.response?.data['message'] != null) {
            customErrorMessageSnackbar(
              title: 'Message',
              message: dioError.response?.data['message'],
            );
          }
        }
      } finally {
        isDeleteUserAccountProcessing.value = false;
      }
    });
  }
}
