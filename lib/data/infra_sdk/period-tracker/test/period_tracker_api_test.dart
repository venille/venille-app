import 'package:test/test.dart';
import 'package:period_tracker_sdk/period_tracker_sdk.dart';


/// tests for PeriodTrackerApi
void main() {
  final instance = PeriodTrackerSdk().getPeriodTrackerApi();

  group(PeriodTrackerApi, () {
    //Future<BuiltList<PeriodTrackerInfo>> periodTrackerControllerGetDetailedAccountInfo() async
    test('test periodTrackerControllerGetDetailedAccountInfo', () async {
      // TODO
    });

  });
}
