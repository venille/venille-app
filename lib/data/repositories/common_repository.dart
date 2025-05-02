import 'package:get/get.dart';
import 'package:venille/core/models/user_country_model.dart';

class CommonRepository extends GetxController {
  RxString storeSlug = ''.obs;
  RxInt currentScreenIndex = 0.obs;
  RxInt currentPromotionPlan = 0.obs;
  RxInt promotionSelectedItemsLength = 0.obs;
  RxInt currentPremiumSubscriptionPlan = 0.obs;

  RxList<String> promotionSelectedItems = <String>[].obs;

  Rx<UserCountryModel> userCountry = UserCountryModel.fromJson({
    'name': 'Nigeria',
    'flagEmoji': '🇳🇬',
    'dialCode': '+234',
  }).obs;
}
