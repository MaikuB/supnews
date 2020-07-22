import 'package:flutter/material.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:provider/provider.dart';
import '../services/sharing_service.dart';
import '../services/story_service.dart';
import '../stores/favourites_store.dart';
import '../stores/settings_store.dart';
import '../services/preferences_service.dart';
import 'themeable_app.dart';

class App extends StatelessWidget {
  final PreferencesService _preferencesService;

  const App(this._preferencesService);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PreferencesService>(
          create: (_) => _preferencesService,
        ),
        Provider<HnpwaClient>(
          create: (_) => HnpwaClient(),
        ),
        Provider<SettingsStore>(
          create: (_) => SettingsStore(_preferencesService),
        ),
        Provider<FavouritesStore>(
          create: (_) => FavouritesStore(_preferencesService),
        ),
        Provider<SharingService>(
          create: (_) => SharingService(),
        ),
        Provider<StoryService>(
          create: (_) => StoryService(_preferencesService),
        )
      ],
      child: Consumer<SettingsStore>(
        builder: (context, value, _) => ThemeableApp(value),
      ),
    );
  }
}
