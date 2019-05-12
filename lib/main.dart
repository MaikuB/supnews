import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supnews/screens/new_stories_page.dart';
import 'package:supnews/screens/settings_page.dart';
import 'package:supnews/screens/top_stories_page.dart';
import 'package:supnews/services/items_service.dart';
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
        Provider<ItemsService>(
          builder: (_) => ItemsService(),
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
            primarySwatch: Colors.blue,
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
                    icon: Icon(Icons.featured_play_list),
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
                            Provider.of<ItemsService>(context),
                            Provider.of<PreferencesService>(context),
                          ),
                      child: Consumer<NewStoriesStore>(
                        builder: (context, value, _) => NewStoriesPage(
                              value,
                              key: PageStorageKey('New'),
                            ),
                      ),
                    );
                  case 1:
                    return Provider(
                      builder: (_) => TopStoriesStore(
                            Provider.of<ItemsService>(context),
                            Provider.of<PreferencesService>(context),
                          ),
                      child: Consumer<TopStoriesStore>(
                        builder: (context, value, _) => TopStoriesPage(
                              value,
                              key: PageStorageKey('Top'),
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
    // return Observer(
    //   builder: (_) => MaterialApp(
    //         title: 'SUpNews',
    //         theme: ThemeData(
    //           fontFamily: 'Lato',
    //           brightness: store.useDarkMode == true
    //               ? Brightness.dark
    //               : Brightness.light,
    //           primarySwatch: Colors.blue,
    //         ),
    //         home: DefaultTabController(
    //           length: 3,
    //           child: Scaffold(
    //             bottomNavigationBar: BottomAppBar(
    //               child: TabBar(
    //                 tabs: [
    //                   Tab(
    //                     icon: Icon(
    //                       Icons.new_releases,
    //                       color: Colors.red,
    //                     ),
    //                   ),
    //                   Tab(
    //                     icon: Icon(
    //                       Icons.featured_play_list,
    //                       color: Colors.red,
    //                     ),
    //                   ),
    //                   Tab(
    //                     icon: Icon(
    //                       Icons.settings,
    //                       color: Colors.red,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             body: SafeArea(
    //               child: TabBarView(
    //                 children: [
    //                   Provider(
    //                     builder: (_) => NewStoriesStore(
    //                           Provider.of<ItemsService>(context),
    //                           Provider.of<PreferencesService>(context),
    //                         ),
    //                     child: Consumer<NewStoriesStore>(
    //                       builder: (context, value, _) => NewStoriesPage(
    //                             value,
    //                             key: PageStorageKey('New'),
    //                           ),
    //                     ),
    //                   ),
    //                   Provider(
    //                     builder: (_) => TopStoriesStore(
    //                           Provider.of<ItemsService>(context),
    //                           Provider.of<PreferencesService>(context),
    //                         ),
    //                     child: Consumer<TopStoriesStore>(
    //                       builder: (context, value, _) => TopStoriesPage(
    //                             value,
    //                             key: PageStorageKey('Top'),
    //                           ),
    //                     ),
    //                   ),
    //                   SettingsPage(),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    // );
  }
}
