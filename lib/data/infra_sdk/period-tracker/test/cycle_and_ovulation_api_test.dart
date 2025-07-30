import 'package:test/test.dart';
import 'package:period_tracker_sdk/period_tracker_sdk.dart';


/// tests for CycleAndOvulationApi
void main() {
  final instance = PeriodTrackerSdk().getCycleAndOvulationApi();

  group(CycleAndOvulationApi, () {
    //Future<CycleOvulationInfo> periodTrackerControllerFetchCycleAndOvulationSettings() async
    test('test periodTrackerControllerFetchCycleAndOvulationSettings', () async {
      // TODO
    });

    //Future<CycleOvulationInfo> periodTrackerControllerPatchCycleAndOvulationSettings(UpdateCycleAndOvulationSettingsDto updateCycleAndOvulationSettingsDto) async
    test('test periodTrackerControllerPatchCycleAndOvulationSettings', () async {
      // TODO
    });

  });
}
