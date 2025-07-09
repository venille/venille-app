import 'package:test/test.dart';
import 'package:account_sdk/account_sdk.dart';


/// tests for AIAssistantApi
void main() {
  final instance = AccountSdk().getAIAssistantApi();

  group(AIAssistantApi, () {
    //Future accountControllerReportAIResponse(ReportAIResponseDTO reportAIResponseDTO) async
    test('test accountControllerReportAIResponse', () async {
      // TODO
    });

  });
}
