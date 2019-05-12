import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supnews/stores/settings_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SettingsStore>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Observer(
            builder: (_) => SwitchListTile(
                  title: const Text('Dark mode'),
                  value: store.useDarkMode,
                  onChanged: (bool value) {
                    store.setDarkMode(value);
                  },
                ),
          ),
          Observer(
            builder: (_) => SwitchListTile(
                  title: const Text('Open articles in app'),
                  value: store.openInApp,
                  onChanged: (bool value) {
                    store.setOpenInApp(value);
                  },
                ),
          ),
        ],
      ),
    );
  }
}
