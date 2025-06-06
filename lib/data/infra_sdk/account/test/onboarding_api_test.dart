import 'package:test/test.dart';
import 'package:account_sdk/account_sdk.dart';


/// tests for OnboardingApi
void main() {
  final instance = AccountSdk().getOnboardingApi();

  group(OnboardingApi, () {
    //Future<BuiltList<OnboardingQuestionInfo>> onboardingControllerGetOnboardingQuestions() async
    test('test onboardingControllerGetOnboardingQuestions', () async {
      // TODO
    });

    //Future<AccountInfo> onboardingControllerRegisterPeriodTracker(RegisterPeriodTrackerDTO registerPeriodTrackerDTO) async
    test('test onboardingControllerRegisterPeriodTracker', () async {
      // TODO
    });

  });
}
