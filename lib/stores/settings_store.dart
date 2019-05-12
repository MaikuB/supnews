import 'package:mobx/mobx.dart';
import 'package:supnews/services/preferences_service.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase implements Store {
  PreferencesService _preferencesService;

  @observable
  bool useDarkMode;

  @observable
  bool openInApp;

  /// when the store is created, we read in the current settings immediately to avoid the scenario where
  /// the values displayed will change upon switching to the settings tab
  SettingsStoreBase(this._preferencesService) {
    useDarkMode = _preferencesService.getUseDarkMode();
    openInApp = _preferencesService.getOpenInApp();
  }

  @action
  void setDarkMode(bool updatedDarkModePreference) {
    _preferencesService.setUseDarkMode(updatedDarkModePreference);
    useDarkMode = updatedDarkModePreference;
  }

  @action
  void setOpenInApp(bool updatedOpenInAppPreference) {
    _preferencesService.setOpenInApp(updatedOpenInAppPreference);
    openInApp = updatedOpenInAppPreference;
  }
}
