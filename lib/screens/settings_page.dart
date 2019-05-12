import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supnews/stores/settings_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final store = Provider.of<SettingsStore>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Observer(
            builder: (_) => Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: SwitchListTile(
                    title: Text('Dark mode'),
                    subtitle: Text(
                        'Note: this won\'t affect the articles that are displayed'),
                    value: store.useDarkMode,
                    onChanged: (bool value) {
                      store.setDarkMode(value);
                    },
                  ),
                ),
          ),
          Observer(
            builder: (_) => SwitchListTile(
                  title: Text('Display stories within app'),
                  subtitle: Text(
                      'Controls the default behaviour when tapping on a story to read'),
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

  @override
  bool get wantKeepAlive => true;
}
