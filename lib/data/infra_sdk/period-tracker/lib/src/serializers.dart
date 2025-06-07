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

import 'package:period_tracker_sdk/src/model/period_tracker_calendar_info.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_info.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_last_period_info.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_ovulation_countdown.dart';
import 'package:period_tracker_sdk/src/model/period_tracker_reminder_info.dart';

part 'serializers.g.dart';

@SerializersFor([
  PeriodTrackerCalendarInfo,
  PeriodTrackerInfo,
  PeriodTrackerLastPeriodInfo,
  PeriodTrackerOvulationCountdown,
  PeriodTrackerReminderInfo,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(PeriodTrackerInfo)]),
        () => ListBuilder<PeriodTrackerInfo>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
