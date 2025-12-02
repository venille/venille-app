import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_upgrade_version/flutter_upgrade_version.dart'
    as flutter_upgrade_version;

class AppUpdateService {
  static final AppUpdateService _instance = AppUpdateService._internal();
  factory AppUpdateService() => _instance;
  AppUpdateService._internal();

  // late PackageInfo _packageInfo;
  // final InAppUpdateManager _manager = InAppUpdateManager();

  late NewVersionPlus newVersionPlus;
  final flutter_upgrade_version.InAppUpdateManager _manager =
      flutter_upgrade_version.InAppUpdateManager();

  Future<void> initialize() async {
    await Future.delayed(const Duration(milliseconds: 4500));

    final appStoreBundleId =
        dotenv.env['APP_STORE_BUNDLE_ID'] ?? 'com.venille.venille';
    final playStoreBundleId =
        dotenv.env['PLAY_STORE_BUNDLE_ID'] ?? 'com.venille.venille';
    final appStoreCountry =
        (dotenv.env['APP_STORE_COUNTRY'] ?? 'ng').toLowerCase();

    newVersionPlus = NewVersionPlus(
      iOSId: appStoreBundleId,
      androidId: playStoreBundleId,
      iOSAppStoreCountry: appStoreCountry,
    );

    await checkForUpdate();

    // Check for pending background notifications
    // handleBackgroundPushNotificationLocalRoutes();
  }

  Future<void> checkForUpdate() async {
    if (Platform.isAndroid) {
      await _handleAndroidUpdate();
    } else if (Platform.isIOS) {
      await _handleIOSUpdate();
    }
  }

  Future<void> _handleAndroidUpdate() async {
    log('[ANDROID-APP-UPDATE-PROCESSING]');

    flutter_upgrade_version.AppUpdateInfo? appUpdateInfo =
        await _manager.checkForUpdate();

    log('[ANDROID-APP-UPDATE-INFO] :: $appUpdateInfo');

    // Get.toNamed(AppRoutes.appUpdateRoute);

    if (appUpdateInfo == null) {
      log('[ANDROID-APP-UPDATE-FALLBACK] :: API returned null, checking version manually');
      await _handleAndroidUpdateFallback();
      return;
    }

    if (appUpdateInfo.updateAvailability ==
        flutter_upgrade_version
            .UpdateAvailability.developerTriggeredUpdateInProgress) {
      // await _manager.startAnUpdate(
      //   type: flutter_upgrade_version.AppUpdateType.immediate,
      // );
      Get.toNamed(AppRoutes.appUpdateRoute);
    } else if (appUpdateInfo.updateAvailability ==
        flutter_upgrade_version.UpdateAvailability.updateAvailable) {
      if (appUpdateInfo.immediateAllowed) {
        // await _manager.startAnUpdate(
        //   type: flutter_upgrade_version.AppUpdateType.immediate,
        // );
        Get.toNamed(AppRoutes.appUpdateRoute);
      } else if (appUpdateInfo.flexibleAllowed) {
        // await _manager.startAnUpdate(
        //   type: flutter_upgrade_version.AppUpdateType.flexible,
        // );
        Get.toNamed(AppRoutes.appUpdateRoute);
      }
    }

    log('[ANDROID-APP-UPDATE-SUCCESS]');
  }

  // Add this new method to fetch Play Store version
  Future<void> _handleAndroidUpdateFallback() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      final currentVersionClean = currentVersion.split('+').first.trim();
      final playStoreBundleId =
          dotenv.env['PLAY_STORE_BUNDLE_ID'] ?? packageInfo.packageName;

      log('[ANDROID-FALLBACK] :: Current version: $currentVersionClean');
      log('[ANDROID-FALLBACK] :: Bundle ID: $playStoreBundleId');

      String? storeVersion;

      // Try using new_version_plus first (same as iOS)
      try {
        final status = await newVersionPlus.getVersionStatus();
        log('[ANDROID_NEW_VERSION_PLUS_STATUS] :: canUpdate: ${status?.canUpdate}');
        log('[ANDROID_NEW_VERSION_PLUS_STATUS] :: storeVersion: ${status?.storeVersion}');
        log('[ANDROID_NEW_VERSION_PLUS_STATUS] :: localVersion: ${status?.localVersion}');

        if (status != null && status.storeVersion.isNotEmpty) {
          storeVersion = status.storeVersion;
          log('[ANDROID_STORE_VERSION_FROM_NEW_VERSION_PLUS] :: $storeVersion');
        }
      } catch (error) {
        log('[ANDROID_NEW_VERSION_PLUS_ERROR] :: $error');
      }

      // Fallback to scraping Play Store page
      if (storeVersion == null || storeVersion.isEmpty) {
        log('[ANDROID_TRYING_PLAY_STORE_SCRAPE] :: Fetching from Play Store page');
        storeVersion = await _fetchAndroidVersionFromPlayStore(
          packageId: playStoreBundleId,
        );
        log('[ANDROID_STORE_VERSION_FROM_SCRAPE] :: $storeVersion');
      }

      if (storeVersion == null || storeVersion.isEmpty) {
        log('[ANDROID_UPDATE_CHECK_WARNING] :: Store version is empty - App may not be published yet or bundle ID mismatch');
        log('[ANDROID_UPDATE_CHECK_WARNING] :: Bundle ID used: $playStoreBundleId');
        return;
      }

      log('[ANDROID_STORE_VERSION] :: $storeVersion');
      log('[ANDROID_CURRENT_VERSION] :: $currentVersionClean');

      final storeVersionClean = storeVersion.trim();
      final comparisonResult =
          _compareVersionStrings(storeVersionClean, currentVersionClean);

      log('[ANDROID_VERSION_COMPARISON] :: Store: $storeVersionClean, Local: $currentVersionClean, Result: $comparisonResult');

      if (comparisonResult > 0) {
        log('[ANDROID_UPDATE_AVAILABLE] :: Navigating to update screen');
        Get.toNamed(AppRoutes.appUpdateRoute);
      } else {
        log('[ANDROID_UPDATE_CHECK] :: App is up to date');
      }
    } catch (error, stackTrace) {
      log('[ANDROID_FALLBACK_ERROR] :: $error');
      log('[ANDROID_FALLBACK_STACK_TRACE] :: $stackTrace');
    }
  }

  Future<String?> _fetchAndroidVersionFromPlayStore({
    required String packageId,
  }) async {
    try {
      // Play Store URL format: https://play.google.com/store/apps/details?id=PACKAGE_ID
      final uri = Uri.https(
        'play.google.com',
        '/store/apps/details',
        {'id': packageId, 'hl': 'en'},
      );

      log('[PLAY_STORE_SCRAPE] :: Fetching from: $uri');

      final response = await http.get(uri).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          log('[PLAY_STORE_SCRAPE_TIMEOUT] :: Request timed out');
          throw TimeoutException('Request timed out');
        },
      );

      log('[PROCESSING-LOCAL-ANDROID-SETUP] :: ${response}');

      if (response.statusCode == 200) {
        final html = response.body;

        // Method 1: Try to extract from JSON-LD structured data
        final jsonLdPattern = RegExp(
          r'<script type="application/ld\+json">(.*?)</script>',
          dotAll: true,
        );
        final jsonLdMatch = jsonLdPattern.firstMatch(html);

        if (jsonLdMatch != null) {
          try {
            final jsonData = jsonDecode(jsonLdMatch.group(1)!);
            if (jsonData is Map<String, dynamic>) {
              final softwareVersion = jsonData['softwareVersion'] as String?;
              if (softwareVersion != null && softwareVersion.isNotEmpty) {
                log('[PLAY_STORE_SCRAPE_SUCCESS] :: Found version from JSON-LD: $softwareVersion');
                return softwareVersion;
              }
            }
          } catch (e) {
            log('[PLAY_STORE_SCRAPE_JSON_ERROR] :: $e');
          }
        }

        // Method 2: Try to extract from version string in HTML
        // Look for patterns like "Current Version" or version numbers
        final versionPatterns = [
          RegExp(r'Current Version</div><span[^>]*>([^<]+)</span>',
              caseSensitive: false),
          RegExp(r'Version[^<]*</div><span[^>]*>([^<]+)</span>',
              caseSensitive: false),
          RegExp(r'"version":"([^"]+)"', caseSensitive: false),
          RegExp(r'\[\[\["([\d.]+)"\]\]\]',
              caseSensitive: false), // Sometimes version is in this format
        ];

        for (final pattern in versionPatterns) {
          final match = pattern.firstMatch(html);
          if (match != null && match.group(1) != null) {
            final version = match.group(1)!.trim();
            // Validate it looks like a version number
            if (RegExp(r'^\d+\.\d+').hasMatch(version)) {
              log('[PLAY_STORE_SCRAPE_SUCCESS] :: Found version from HTML: $version');
              return version;
            }
          }
        }

        log('[PLAY_STORE_SCRAPE_NO_VERSION] :: Could not extract version from HTML');
        log('[PLAY_STORE_SCRAPE_DEBUG] :: HTML length: ${html.length}');
      } else {
        log('[PLAY_STORE_SCRAPE_ERROR] :: Status code: ${response.statusCode}');
      }
    } catch (error, stackTrace) {
      log('[PLAY_STORE_SCRAPE_ERROR] :: $error');
      log('[PLAY_STORE_SCRAPE_STACK_TRACE] :: $stackTrace');
    }

    return null;
  }

  Future<void> _handleIOSUpdate() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      final runtimeBundleId = packageInfo.packageName;
      final storeBundleId =
          dotenv.env['APP_STORE_BUNDLE_ID'] ?? runtimeBundleId;
      final storeCountryCode =
          (dotenv.env['APP_STORE_COUNTRY'] ?? 'us').toLowerCase();
      final appStoreAppId = dotenv.env['APP_STORE_APP_ID'];

      log('[IOS_UPDATE_CHECK_START] :: Current version: $currentVersion');
      log('[IOS_RUNTIME_BUNDLE_ID] :: $runtimeBundleId');
      log('[IOS_STORE_BUNDLE_ID] :: $storeBundleId');
      log('[IOS_STORE_COUNTRY] :: $storeCountryCode');
      log('[IOS_APP_STORE_ID] :: $appStoreAppId');

      String? storeVersion;

      try {
        final status = await newVersionPlus.getVersionStatus();

        log('[IOS_NEW_VERSION_PLUS_STATUS] :: canUpdate: ${status?.canUpdate}');
        log('[IOS_NEW_VERSION_PLUS_STATUS] :: storeVersion: ${status?.storeVersion}');
        log('[IOS_NEW_VERSION_PLUS_STATUS] :: localVersion: ${status?.localVersion}');
        log('[IOS_NEW_VERSION_PLUS_STATUS] :: appStoreLink: ${status?.appStoreLink}');

        if (status != null && status.storeVersion.isNotEmpty) {
          storeVersion = status.storeVersion;
          log('[IOS_STORE_VERSION_FROM_NEW_VERSION_PLUS] :: $storeVersion');
        }
      } catch (error) {
        log('[IOS_NEW_VERSION_PLUS_ERROR] :: $error');
      }

      if (storeVersion == null || storeVersion.isEmpty) {
        log('[IOS_TRYING_DIRECT_API] :: Fetching from iTunes Search API');
        storeVersion = await _fetchIOSVersionFromITunesAPI(
          bundleId: storeBundleId,
          countryCode: storeCountryCode,
          appId: appStoreAppId,
        );
        log('[IOS_STORE_VERSION_FROM_API] :: $storeVersion');
      }

      if (storeVersion == null || storeVersion.isEmpty) {
        log('[IOS_UPDATE_CHECK_WARNING] :: Store version is empty - App may not be published yet or bundle ID mismatch');
        log('[IOS_UPDATE_CHECK_WARNING] :: Bundle ID used: $storeBundleId');

        return;
      }

      log('[IOS_STORE_VERSION] :: $storeVersion');
      log('[IOS_CURRENT_VERSION] :: $currentVersion');

      final currentVersionClean = currentVersion.split('+').first.trim();
      final storeVersionClean = storeVersion.trim();
      final comparisonResult =
          _compareVersionStrings(storeVersionClean, currentVersionClean);

      log('[IOS_VERSION_COMPARISON] :: Store: $storeVersionClean, Local: $currentVersionClean, Result: $comparisonResult');

      if (comparisonResult > 0) {
        log('[IOS_UPDATE_AVAILABLE] :: Navigating to update screen');

        Get.toNamed(AppRoutes.appUpdateRoute);
      } else {
        log('[IOS_UPDATE_CHECK] :: App is up to date');
      }
    } catch (error, stackTrace) {
      log('[IOS_UPDATE_CHECK_ERROR] :: $error');
      log('[IOS_UPDATE_CHECK_STACK_TRACE] :: $stackTrace');
    }
  }

  Future<String?> _fetchIOSVersionFromITunesAPI({
    required String bundleId,
    required String countryCode,
    String? appId,
  }) async {
    final normalizedCountry = countryCode.isEmpty ? 'ng' : countryCode;
    final countryAttempts = <String>{normalizedCountry, 'ng'};

    for (final country in countryAttempts) {
      final lookupScenarios = <Map<String, String>>[
        {
          'bundleId': bundleId,
          'country': country,
        },
      ];

      if (appId != null && appId.isNotEmpty) {
        lookupScenarios.add({
          'id': appId,
          'country': country,
        });
      }

      for (final params in lookupScenarios) {
        final source = params.containsKey('bundleId') ? 'bundleId' : 'appId';
        log('[ITUNES_API_LOOKUP] :: Trying $source lookup with params: $params');

        final version = await _performItunesLookup(params);
        if (version != null && version.isNotEmpty) {
          return version;
        }
      }
    }

    return null;
  }

  Future<String?> _performItunesLookup(Map<String, String> params) async {
    try {
      final uri = Uri.https(
        'itunes.apple.com',
        '/lookup',
        params,
      );

      final response = await http.get(uri).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          log('[ITUNES_API_TIMEOUT] :: Request timed out');
          throw TimeoutException('Request timed out');
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is Map<String, dynamic>) {
          final results = data['results'] as List<dynamic>? ?? [];

          if (results.isEmpty) {
            log('[ITUNES_API_NO_RESULTS] :: No app found for params: $params');
            log('[ITUNES_API_RESPONSE] :: ${response.body}');
            return null;
          }

          final appInfo = results.first as Map<String, dynamic>;
          final version = appInfo['version'] as String?;

          if (version != null && version.isNotEmpty) {
            log('[ITUNES_API_SUCCESS] :: Found version: $version');
            return version;
          }

          log('[ITUNES_API_NO_VERSION] :: Version field missing in response for params: $params');
          log('[ITUNES_API_RESPONSE] :: ${response.body}');
          return null;
        }

        log('[ITUNES_API_UNEXPECTED_RESPONSE] :: ${response.body}');
      } else {
        log('[ITUNES_API_ERROR] :: Status code: ${response.statusCode}');
        log('[ITUNES_API_RESPONSE] :: ${response.body}');
      }
    } catch (error, stackTrace) {
      log('[ITUNES_API_ERROR] :: $error');
      log('[ITUNES_API_STACK_TRACE] :: $stackTrace');
    }

    return null;
  }

  int _compareVersionStrings(String storeVersion, String localVersion) {
    final storeParts = _normalizeVersionParts(storeVersion);
    final localParts = _normalizeVersionParts(localVersion);
    final maxLength = storeParts.length > localParts.length
        ? storeParts.length
        : localParts.length;

    for (var index = 0; index < maxLength; index++) {
      final storeValue = index < storeParts.length ? storeParts[index] : 0;
      final localValue = index < localParts.length ? localParts[index] : 0;

      if (storeValue > localValue) {
        return 1;
      }

      if (storeValue < localValue) {
        return -1;
      }
    }

    return 0;
  }

  List<int> _normalizeVersionParts(String version) {
    final sanitizedVersion = version.trim();
    if (sanitizedVersion.isEmpty) {
      return [0];
    }

    final parts = sanitizedVersion.split('.');
    final normalizedParts = <int>[];

    for (final part in parts) {
      final numericMatch = RegExp(r'\d+').stringMatch(part) ?? '0';
      normalizedParts.add(int.tryParse(numericMatch) ?? 0);
    }

    return normalizedParts;
  }
}
