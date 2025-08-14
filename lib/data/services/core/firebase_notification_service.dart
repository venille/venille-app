// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:get/get.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venille/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/middlewares/core.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';

class FirebaseNotificationService extends GetxController {
  static String? fcmToken;

  static bool _isInitialized = false;

  static final FirebaseNotificationService _instance =
      FirebaseNotificationService._internal();

  factory FirebaseNotificationService() => _instance;
  FirebaseNotificationService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init(BuildContext context) async {
    if (_isInitialized) return;
    _isInitialized = true;

    try {
      // Requesting permission for notifications
      NotificationSettings settings = await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      log(
        '[FIREBASE-NOTIFICATION-PERMISSION] :: ${settings.authorizationStatus}',
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        fcmToken = await _fcm.getToken();

        UpdateFCMTokenDTO updateFCMTokenDTO = UpdateFCMTokenDTO(
          (instance) => instance..fcmToken = fcmToken,
        );

        ServiceRegistry.accountService
            .updateAccountFcmTokenService(updateFCMTokenDTO);

        ServiceRegistry.localStorage.write(
          LocalStorageSecrets.pushNotificationsEnabled,
          true,
        );
      }

      _fcm.onTokenRefresh.listen((newToken) async {
        UpdateFCMTokenDTO updateFCMTokenDTO = UpdateFCMTokenDTO(
          (instance) => instance..fcmToken = fcmToken,
        );

        ServiceRegistry.accountService
            .updateAccountFcmTokenService(updateFCMTokenDTO);
      });

      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        if (message.notification != null) {
          log('[FOREGROUND-PUSH-NOTIFICATION]');
          log('[NOTIFICATION-DATA] :: ${message.data}');
          log('[NOTIFICATION-DATA] :: ${message.data}');

          Get.closeAllSnackbars();

          return customNotificationSnackbar(
            message: message.notification!.body!,
            title: capitalizeFirstLetter(message.notification!.title!),
          );
        }
      });

      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {}
      });

      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        log('[ON-OPENED-NOTIFICATION] :: ${message.data}');
      });
    } catch (error) {
      log('[FIREBASE-MESSAGE-INITIALIZATION-ERROR] :: $error');
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
