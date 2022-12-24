import 'package:get_it/get_it.dart' show GetIt;
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/api/config.dart';
import 'package:schedule_app_fe/core/api/user.api.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';
import 'package:schedule_app_fe/core/providers/ui.provider.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';
import 'package:schedule_app_fe/util/date.dart';
import 'package:schedule_app_fe/util/route.dart';
import 'package:schedule_app_fe/util/sharePreferenceHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<DateUtil>(DateUtil());
  getIt.registerSingleton<ApiProvider>(ApiProvider());
  getIt.registerSingleton<UiProvider>(UiProvider());
  getIt.registerSingleton<PageNavigator>(PageNavigator());

  // depend singleton
  getIt.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(await SharedPreferences.getInstance()));

  getIt.registerSingleton<ApiClient>(
      ApiClient(getIt<ApiProvider>(), getIt<UiProvider>()));

  getIt.registerSingleton<AuthApi>(AuthApi(getIt<ApiClient>()));
  getIt.registerSingleton<UserApi>(UserApi(getIt<ApiClient>()));

  getIt.registerSingleton<UserProvider>(UserProvider(getIt<AuthApi>()));
}
