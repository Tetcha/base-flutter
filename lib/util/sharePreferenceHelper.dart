import 'package:schedule_app_fe/core/constants/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  SharedPreferences get instance => _sharedPreference;

  // General Methods: ----------------------------------------------------------
  String? get authToken {
    return _sharedPreference.getString(StoreKey.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return await _sharedPreference.setString(StoreKey.authToken, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(StoreKey.authToken);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(StoreKey.isDarkMode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(StoreKey.isDarkMode, value);
  }
}
