import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'dart:developer';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLoading = false;
  bool _notificationsEnabled = false;

  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    _loadNotificationSettings();
  }

  void _loadNotificationSettings() {
    // Load the saved notification setting from local storage
    final storedValue = ServiceRegistry.localStorage.read(
      LocalStorageSecrets.pushNotificationsEnabled,
    );
    setState(() {
      _notificationsEnabled = storedValue ?? false;
    });
  }

  Future<void> _toggleNotifications(bool value) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      if (value) {
        // Enable notifications
        await _enableNotifications();
      } else {
        // Disable notifications
        await _disableNotifications();
      }

      setState(() {
        _notificationsEnabled = value;
        _isLoading = false;
      });

      // Save to local storage
      ServiceRegistry.localStorage.write(
        LocalStorageSecrets.pushNotificationsEnabled,
        value,
      );

      customSuccessMessageSnackbar(
        title: AppLocale.notification.getString(context),
        message: value
            ? AppLocale.pushNotificationsEnabled.getString(context)
            : AppLocale.pushNotificationsDisabled.getString(context),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      log('Notification toggle error: $e');

      customErrorMessageSnackbar(
        title: AppLocale.errors.getString(context),
        message: AppLocale.failedToUpdateNotificationSettingsPleaseTryAgain
            .getString(context),
      );
    }
  }

  Future<void> _enableNotifications() async {
    try {
      // Initialize Firebase if not already done
      await _ensureFirebaseInitialized();

      // Request permission from system
      final permission = await Permission.notification.request();

      if (permission.isDenied || permission.isPermanentlyDenied) {
        throw Exception('Notification permission denied by user');
      }

      // Get FCM instance and request permission
      final messaging = FirebaseMessaging.instance;

      // Request permission from Firebase
      final settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus != AuthorizationStatus.authorized &&
          settings.authorizationStatus != AuthorizationStatus.provisional) {
        throw Exception('Firebase messaging permission denied');
      }

      // Get the FCM token
      final fcmToken = await messaging.getToken();

      if (fcmToken != null && fcmToken.isNotEmpty) {
        // Update FCM token on the server
        final updateFcmDto = UpdateFCMTokenDTO((b) => b..fcmToken = fcmToken);
        await ServiceRegistry.accountService
            .updateAccountFcmTokenService(updateFcmDto);

        log('FCM token updated successfully: ${fcmToken.substring(0, 20)}...');
      } else {
        throw Exception('Failed to get FCM token');
      }
    } catch (e) {
      log('Error enabling notifications: $e');
      rethrow;
    }
  }

  Future<void> _disableNotifications() async {
    try {
      // Clear FCM token on the server by sending empty token
      final updateFcmDto = UpdateFCMTokenDTO((b) => b..fcmToken = '');
      await ServiceRegistry.accountService
          .updateAccountFcmTokenService(updateFcmDto);

      log('FCM token cleared successfully');
    } catch (e) {
      log('Error disabling notifications: $e');
      rethrow;
    }
  }

  Future<void> _ensureFirebaseInitialized() async {
    try {
      // Check if Firebase is already initialized
      await Firebase.initializeApp();
    } catch (e) {
      // Firebase might already be initialized, which is fine
      log('Firebase initialization: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: AppLocale.settings.getString(context),
          onTap: () => Get.back(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontal_15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.vertical_5),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.vertical_5,
                horizontal: AppSizes.horizontal_10,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText(
                    text: AppLocale.pushNotifications.getString(context),
                    weight: FontWeight.w400,
                  ),
                  Switch(
                    value: _notificationsEnabled,
                    onChanged: _toggleNotifications,
                    activeColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.vertical_10),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.vertical_20,
                horizontal: AppSizes.horizontal_10,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText(
                    text: AppLocale.language.getString(context),
                    weight: FontWeight.w400,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.languageSettingsRoute);
                    },
                    child: Row(
                      children: [
                        SubtitleText(
                          weight: FontWeight.w400,
                          text: '${_localization.currentLocale?.languageCode}',
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
