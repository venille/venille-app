// ignore_for_file: library_prefixes, use_build_context_synchronously
import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:venille/data/services/guards/auth_guard.dart';
import 'package:venille/data/infra_sdk/period-tracker/lib/period_tracker_sdk.dart';

class PeriodTrackerService extends GetxController {
  RxBool isLogPeriodSymptomsProcessing = false.obs;
  RxBool isLogPeriodLogHistoryProcessing = false.obs;
  RxBool isFetchPeriodTrackerDashboardInfoProcessing = false.obs;

  //! FETCH DASHBOARD PERIOD INFO
  /// Fetch dashboard period info.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /period-tracker/me/dashboard
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchPeriodTrackerHistoryService() async {
    return authGuard<void>(() async {
      try {
        log("[FETCH-DASHBOARD-PERIOD-INFO-PENDING]");

        PeriodTrackerApi periodTrackerApi =
            ServiceRegistry.periodTrackerSdk.getPeriodTrackerApi();

        Dio.Response response = await periodTrackerApi
            .periodTrackerControllerGetPeriodTrackerHistory(
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[FETCH-DASHBOARD-PERIOD-INFO-RESPONSE] :: ${response.data}');

          PeriodTrackerHistory dashboardPeriodInfo = response.data;

          ServiceRegistry.userRepository.periodTrackerHistory.value =
              dashboardPeriodInfo;

          log("[FETCH-DASHBOARD-PERIOD-INFO-SUCCESS]");
        }
      } catch (error) {
        log('[FETCH-DASHBOARD-PERIOD-INFO-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[FETCH-DASHBOARD-PERIOD-INFO-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      }
    });
  }

  //! LOG PERIOD TRACKER HISTORY
  /// Log period tracker history.
  ///
  /// [METHOD] - PATCH
  ///
  /// [ROUTE] - /period-tracker/me/log
  ///
  /// [IS-AUTHENTICATED]
  Future<void> logPeriodTrackerHistoryService(
      PeriodTrackerHistoryDto payload) async {
    return authGuard<void>(() async {
      try {
        log("[LOG-PERIOD-TRACKER-HISTORY-PENDING]");

        isLogPeriodLogHistoryProcessing.value = true;

        PeriodTrackerApi periodTrackerApi =
            ServiceRegistry.periodTrackerSdk.getPeriodTrackerApi();

        Dio.Response response = await periodTrackerApi
            .periodTrackerControllerLogPeriodTrackerHistory(
          periodTrackerHistoryDto: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 201 || response.statusCode == 200) {
          log('[LOG-PERIOD-TRACKER-HISTORY-RESPONSE] :: ${response.data}');

          fetchPeriodTrackerHistoryService();

          Get.back();

          customSuccessMessageSnackbar(
            title: 'Message',
            message: 'Period tracker history logged successfully!',
          );

          isLogPeriodLogHistoryProcessing.value = false;

          log("[LOG-PERIOD-TRACKER-HISTORY-SUCCESS]");
        }
      } catch (error) {
        isLogPeriodLogHistoryProcessing.value = false;

        log('[LOG-PERIOD-TRACKER-HISTORY-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[LOG-PERIOD-TRACKER-HISTORY-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isLogPeriodLogHistoryProcessing.value = false;
      }
    });
  }

  //! FETCH DASHBOARD INFO
  /// Fetch period tracker dashboard info.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /period-tracker/me/dashboard
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchDashboardInfoService() async {
    return authGuard<void>(() async {
      try {
        log("[FETCH-DASHBOARD-INFO-PENDING]");

        isFetchPeriodTrackerDashboardInfoProcessing.value = true;

        PeriodTrackerApi periodTrackerApi =
            ServiceRegistry.periodTrackerSdk.getPeriodTrackerApi();

        Dio.Response response =
            await periodTrackerApi.periodTrackerControllerGetDashboardInfo(
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[FETCH-DASHBOARD-INFO-RESPONSE] :: ${response.data}');

          DashboardInfo dashboardInfo = response.data;

          ServiceRegistry.userRepository.dashboardInfo.value = dashboardInfo;

          isFetchPeriodTrackerDashboardInfoProcessing.value = false;

          log("[FETCH-DASHBOARD-INFO-SUCCESS]");
        }
      } catch (error) {
        isFetchPeriodTrackerDashboardInfoProcessing.value = false;

        log('[FETCH-DASHBOARD-INFO-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[FETCH-DASHBOARD-INFO-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isFetchPeriodTrackerDashboardInfoProcessing.value = false;
      }
    });
  }

  //! LOG PERIOD TRACKER SYMPTOMS
  /// Log period tracker symptoms.
  ///
  /// [METHOD] - PATCH
  ///
  /// [ROUTE] - /period-tracker/me/log-symptoms
  ///
  /// [IS-AUTHENTICATED]
  Future<void> logPeriodTrackerSymptomsService(
      LogPeriodSymptomDto payload) async {
    return authGuard<void>(() async {
      try {
        log("[LOG-PERIOD-TRACKER-SYMPTOMS-PENDING]");

        isLogPeriodSymptomsProcessing.value = true;

        PeriodTrackerApi periodTrackerApi =
            ServiceRegistry.periodTrackerSdk.getPeriodTrackerApi();

        Dio.Response response =
            await periodTrackerApi.periodTrackerControllerLogPeriodSymptoms(
          logPeriodSymptomDto: payload,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 201 || response.statusCode == 200) {
          log('[LOG-PERIOD-TRACKER-SYMPTOMS-RESPONSE] :: ${response.data}');

          fetchPeriodTrackerHistoryService();

          Get.back();

          customSuccessMessageSnackbar(
            title: 'Message',
            message: 'Period symptoms logged successfully!',
          );

          isLogPeriodSymptomsProcessing.value = false;

          log("[LOG-PERIOD-TRACKER-SYMPTOMS-SUCCESS]");
        }
      } catch (error) {
        isLogPeriodSymptomsProcessing.value = false;

        log('[LOG-PERIOD-TRACKER-SYMPTOMS-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[LOG-PERIOD-TRACKER-SYMPTOMS-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      } finally {
        isLogPeriodSymptomsProcessing.value = false;
      }
    });
  }
}
