// ignore_for_file: library_prefixes
import 'package:get/get.dart';
import 'package:venille/data/infra_sdk/auth/lib/auth_sdk.dart' as AuthSdk;

class UserRepository extends GetxController {
  final RxList<AuthSdk.AvailableStateInfo> _availableStates =
      <AuthSdk.AvailableStateInfo>[].obs;
  RxList<AuthSdk.AvailableStateInfo> get availableStates => _availableStates;
}
