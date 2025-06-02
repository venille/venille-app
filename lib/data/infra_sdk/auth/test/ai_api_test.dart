import 'package:test/test.dart';
import 'package:auth_sdk/auth_sdk.dart';


/// tests for AiApi
void main() {
  final instance = AuthSdk().getAiApi();

  group(AiApi, () {
    //Future<String> authControllerGenerateVellaAiPrompt(String query) async
    test('test authControllerGenerateVellaAiPrompt', () async {
      // TODO
    });

  });
}
