import 'package:get/get.dart';
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/api/config.dart';
import 'package:schedule_app_fe/core/api/user.api.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';
import 'package:schedule_app_fe/core/providers/ui.provider.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';
import 'package:schedule_app_fe/core/providers/sharePreference.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// config global dependencies
Future<void> configureDependencies() async {
  Get.put(ApiProvider());
  Get.put(UIProvider());
  Get.put(SharedPreferenceProvider(await SharedPreferences.getInstance()));
  // depend singleton
  Get.put(ApiClient());
  Get.put(AuthApi());
  Get.put(UserApi());
  Get.put(UserProvider());
}
