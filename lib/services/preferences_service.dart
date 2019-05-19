import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final String _useDarkModeKey = 'useDarkMode';
  final String _openInAppKey = 'openInApp';

  final SharedPreferences _sharedPreferences;

  const PreferencesService(this._sharedPreferences);

  set useDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  bool get useDarkMode => _sharedPreferences.getBool(_useDarkModeKey) ?? false;

  bool get openInApp => _sharedPreferences.getBool(_openInAppKey) ?? true;

  set openInApp(bool openInApp) {
    _sharedPreferences.setBool(_openInAppKey, openInApp);
  }
}
