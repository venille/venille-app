// ignore_for_file: library_prefixes, use_build_context_synchronously
import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:venille/data/services/guards/auth_guard.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart';

class PeriodTrackerService extends GetxController {
  RxBool isFetchPeriodTrackerProcessing = false.obs;

  //! FETCH PERIOD TRACKER
  /// Fetch detailed user period tracker.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /period-tracker/me/history
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchPeriodTrackerHistoryService() async {
    return authGuard<void>(() async {
      try {
        log("[FETCH-PERIOD-TRACKER-HISTORY-PENDING]");

        isFetchPeriodTrackerProcessing.value = true;

        PeriodTrackerApi periodTrackerApi =
            ServiceRegistry.periodTrackerSdk.getPeriodTrackerApi();

        Dio.Response response = await periodTrackerApi
            .periodTrackerControllerGetDetailedAccountInfo(
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[FETCH-PERIOD-TRACKER-HISTORY-RESPONSE] :: ${response.data}');

          BuiltList<PeriodTrackerInfo> periodTrackerHistory = response.data;

          ServiceRegistry.userRepository.periodTrackerHistory.value =
              periodTrackerHistory.toList();

          log("[FETCH-PERIOD-TRACKER-HISTORY-SUCCESS]");

          isFetchPeriodTrackerProcessing.value = false;
        }
      } catch (error) {
        isFetchPeriodTrackerProcessing.value = false;

        log('[FETCH-PERIOD-TRACKER-HISTORY-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[FETCH-PERIOD-TRACKER-HISTORY-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isFetchPeriodTrackerProcessing.value = false;
      }
    });
  }
}
