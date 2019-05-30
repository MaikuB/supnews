import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'services/preferences_service.dart';
import 'widgets/app.dart';

Future<void> main() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  await FlutterStatusbarcolor.setStatusBarColor(Colors.teal);
  if (useWhiteForeground(Colors.teal)) {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  } else {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }
  runApp(App(PreferencesService(sharedPreferences)));
}
