// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$SettingsStore on SettingsStoreBase, Store {
  final _$useDarkModeAtom = Atom(name: 'SettingsStoreBase.useDarkMode');

  @override
  bool get useDarkMode {
    _$useDarkModeAtom.reportObserved();
    return super.useDarkMode;
  }

  @override
  set useDarkMode(bool value) {
    _$useDarkModeAtom.context
        .checkIfStateModificationsAreAllowed(_$useDarkModeAtom);
    super.useDarkMode = value;
    _$useDarkModeAtom.reportChanged();
  }

  final _$openInAppAtom = Atom(name: 'SettingsStoreBase.openInApp');

  @override
  bool get openInApp {
    _$openInAppAtom.reportObserved();
    return super.openInApp;
  }

  @override
  set openInApp(bool value) {
    _$openInAppAtom.context
        .checkIfStateModificationsAreAllowed(_$openInAppAtom);
    super.openInApp = value;
    _$openInAppAtom.reportChanged();
  }

  final _$SettingsStoreBaseActionController =
      ActionController(name: 'SettingsStoreBase');

  @override
  void setDarkMode(bool updatedDarkModePreference) {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction();
    try {
      return super.setDarkMode(updatedDarkModePreference);
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOpenInApp(bool updatedOpenInAppPreference) {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction();
    try {
      return super.setOpenInApp(updatedOpenInAppPreference);
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
