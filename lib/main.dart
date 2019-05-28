import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'screens/new_stories_page.dart';
import 'screens/settings_page.dart';
import 'screens/top_stories_page.dart';
import 'services/preferences_service.dart';
import 'stores/new_stories_store.dart';
import 'stores/settings_store.dart';
import 'stores/top_stories_store.dart';

Future main() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  await FlutterStatusbarcolor.setStatusBarColor(Colors.teal);
  if (useWhiteForeground(Colors.teal)) {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  } else {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }
  runApp(App(PreferencesService(sharedPreferences)));
}

class App extends StatelessWidget {
  final PreferencesService _preferencesService;

  const App(this._preferencesService);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PreferencesService>(
          builder: (_) => _preferencesService,
        ),
        Provider<HnpwaClient>(
          builder: (_) => HnpwaClient(),
        ),
        Provider<SettingsStore>(
          builder: (_) => SettingsStore(_preferencesService),
        ),
      ],
      child: Consumer<SettingsStore>(
        builder: (context, value, _) => ThemeableApp(value),
      ),
    );
  }
}

class ThemeableApp extends StatelessWidget {
  final SettingsStore settingsStore;
  ThemeableApp(this.settingsStore, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var themeData = ThemeData(
          fontFamily: 'Lato',
          brightness: settingsStore.useDarkMode == true
              ? Brightness.dark
              : Brightness.light,
          primarySwatch: Colors.teal,
          textTheme: TextTheme(
            subhead: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            subtitle: TextStyle(fontWeight: FontWeight.w300),
          ),
        );
        return MaterialApp(
          title: 'SUpNews',
          theme: themeData,
          home: SafeArea(
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.new_releases),
                    title: Text('New'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up),
                    title: Text('Top'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
              ),
              tabBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    return Consumer2<HnpwaClient, PreferencesService>(
                      builder: (context, hnpwaClient, preferencesService, _) =>
                          Provider(
                            builder: (_) => NewStoriesStore(
                                hnpwaClient, preferencesService),
                            child: Consumer<NewStoriesStore>(
                              builder: (context, value, _) => Scaffold(
                                    body: NewStoriesPage(
                                      value,
                                    ),
                                  ),
                            ),
                          ),
                    );
                  case 1:
                    return Consumer2<HnpwaClient, PreferencesService>(
                      builder: (context, hnpwaClient, preferencesService, _) =>
                          Provider(
                            builder: (_) => TopStoriesStore(
                                  hnpwaClient,
                                  preferencesService,
                                ),
                            child: Consumer<TopStoriesStore>(
                              builder: (context, value, _) => Scaffold(
                                    body: TopStoriesPage(
                                      value,
                                    ),
                                  ),
                            ),
                          ),
                    );
                  case 2:
                    return Consumer<SettingsStore>(
                      builder: (context, value, _) => Scaffold(
                            body: SettingsPage(value),
                          ),
                    );
                }
                return null;
              },
            ),
          ),
        );
      },
    );
  }
}
