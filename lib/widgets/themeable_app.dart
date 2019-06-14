import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:provider/provider.dart';
import '../screens/favourites_page.dart';
import '../stores/favourites_store.dart';
import '../screens/new_stories_page.dart';
import '../screens/settings_page.dart';
import '../screens/top_stories_page.dart';
import '../services/preferences_service.dart';
import '../stores/new_stories_store.dart';
import '../stores/top_stories_store.dart';
import '../stores/settings_store.dart';

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
                    icon: Icon(Icons.favorite),
                    title: Text('Favourites'),
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
                              builder: (context, value, _) => Material(
                                    child: NewStoriesPage(
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
                              builder: (context, value, _) => Material(
                                    child: TopStoriesPage(
                                      value,
                                    ),
                                  ),
                            ),
                          ),
                    );
                  case 2:
                    return Consumer<FavouritesStore>(
                      builder: (context, value, _) => Material(
                            child: FavouritesPage(value),
                          ),
                    );
                  case 3:
                    return Consumer<SettingsStore>(
                      builder: (context, value, _) => Material(
                            child: SettingsPage(value),
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
