// @dart=3.5
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:period_tracker_sdk/src/date_serializer.dart';
import 'package:period_tracker_sdk/src/model/date.dart';

import 'package:period_tracker_sdk/src/model/dashboard_info.dart';
import 'package:period_tracker_sdk/src/model/log_period_symptom_dto.dart';
import 'package:period_tracker_sdk/src/model/menstrual_phase_description_info.dart';
import 'package:period_tracker_sdk/src/model/menstrual_phase_info.dart';
import 'package:period_tracker_sdk/src/model/monthly_period_info.dart';
import 'package:period_tracker_sdk/src/model/period_day_info.dart';
import 'package:period_tracker_sdk/src/model/period_month_dto.dart';
import 'package:period_tracker_sdk/src/model/period_symptom_dto.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_history.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_history_dto.dart';
import 'package:period_tracker_sdk/src/model/period_year_dto.dart';
import 'package:period_tracker_sdk/src/model/predicted_year_tracker_info.dart';
import 'package:period_tracker_sdk/src/model/previous_cycle_info.dart';

part 'serializers.g.dart';

@SerializersFor([
  DashboardInfo,
  LogPeriodSymptomDto,
  MenstrualPhaseDescriptionInfo,
  MenstrualPhaseInfo,
  MonthlyPeriodInfo,
  PeriodDayInfo,
  PeriodMonthDto,
  PeriodSymptomDto,
  PeriodTrackerHistory,
  PeriodTrackerHistoryDto,
  PeriodYearDto,
  PredictedYearTrackerInfo,
  PreviousCycleInfo,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
