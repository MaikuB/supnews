import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supnews/screens/new_stories_page.dart';
import 'package:supnews/screens/settings_page.dart';
import 'package:supnews/screens/top_stories_page.dart';
import 'package:supnews/services/preferences_service.dart';
import 'package:supnews/stores/new_stories_store.dart';
import 'package:supnews/stores/settings_store.dart';
import 'package:supnews/stores/top_stories_store.dart';

Future main() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  runApp(App(PreferencesService(sharedPreferences)));
}

class App extends StatelessWidget {
  final PreferencesService _preferencesService;

  const App(this._preferencesService);

  // This widget is the root of your application.
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
      child: new ThemeableApp(),
    );
  }
}

class ThemeableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<SettingsStore>(context);
    return Observer(
      builder: (_) => MaterialApp(
          title: 'SUpNews',
          theme: ThemeData(
            fontFamily: 'Lato',
            brightness:
                store.useDarkMode == true ? Brightness.dark : Brightness.light,
            primarySwatch: Colors.teal,
            textTheme: TextTheme(
              subhead: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              subtitle: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
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
                    return Provider(
                      builder: (_) => NewStoriesStore(
                            Provider.of<HnpwaClient>(context),
                            Provider.of<PreferencesService>(context),
                          ),
                      child: Consumer<NewStoriesStore>(
                        builder: (context, value, _) => NewStoriesPage(
                              value,
                            ),
                      ),
                    );
                  case 1:
                    return Provider(
                      builder: (_) => TopStoriesStore(
                            Provider.of<HnpwaClient>(context),
                            Provider.of<PreferencesService>(context),
                          ),
                      child: Consumer<TopStoriesStore>(
                        builder: (context, value, _) => TopStoriesPage(
                              value,
                            ),
                      ),
                    );
                  case 2:
                    return SettingsPage();
                }
                return null;
              },
            ),
          )),
    );
  }
}
