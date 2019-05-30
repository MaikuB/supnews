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
          builder: (_) => _preferencesService,
        ),
        Provider<HnpwaClient>(
          builder: (_) => HnpwaClient(),
        ),
        Provider<SettingsStore>(
          builder: (_) => SettingsStore(_preferencesService),
        ),
        Provider<FavouritesStore>(
          builder: (_) => FavouritesStore(_preferencesService),
        ),
        Provider<SharingService>(
          builder: (_) => SharingService(),
        ),
        Provider<StoryService>(
          builder: (_) => StoryService(_preferencesService),
        )
      ],
      child: Consumer<SettingsStore>(
        builder: (context, value, _) => ThemeableApp(value),
      ),
    );
  }
}
