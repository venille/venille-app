import 'package:test/test.dart';
import 'package:engagement_sdk/engagement_sdk.dart';


/// tests for TranslationApi
void main() {
  final instance = EngagementSdk().getTranslationApi();

  group(TranslationApi, () {
    //Future<TranslateTextInfo> translationControllerTranslateText(String text, String sourceLanguage, String targetLanguage, { String engine }) async
    test('test translationControllerTranslateText', () async {
      // TODO
    });

  });
}
