import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final String _useDarkModeKey = 'useDarkMode';
  final String _openInAppKey = 'openInApp';

  SharedPreferences _sharedPreferences;

  PreferencesService(this._sharedPreferences);

  void setUseDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  bool getUseDarkMode() {
    return _sharedPreferences.getBool(_useDarkModeKey) ?? false;
  }

  bool getOpenInApp() {
    return _sharedPreferences.getBool(_openInAppKey) ?? true;
  }

  void setOpenInApp(bool openInApp) {
    _sharedPreferences.setBool(_openInAppKey, openInApp);
  }
}
